require_relative('../db/sql_runner.rb')

class Book

    attr_reader :id
    attr_accessor :title, :description, :quantity, :buying_cost, :selling_price, :author_id, :genre_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @description = options['description']
        @quantity = options['quantity'].to_i
        @buying_cost = options['buying_cost'].to_f
        @selling_price = options['selling_price'].to_f
        @author_id = options['author_id'].to_i
        @genre_id = options['genre_id'].to_i
        @markup = book_markup()
    end

    def save()
        sql = "INSERT INTO books 
        (title, description, quantity, buying_cost, selling_price, author_id, genre_id, markup)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id"
        values = [@title, @description, @quantity, @buying_cost, @selling_price, @author_id, @genre_id, @markup]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM books"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM books WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.map_items(data)
        return data.map { |book| Book.new(book) }
    end

    def self.all()
        sql = "SELECT * FROM books"
        result = SqlRunner.run(sql)
        return self.map_items(result)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM books WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        return Book.new(result)
    end

    def update()
        sql = "UPDATE books SET
        (title, description, quantity, buying_cost, selling_price, author_id, genre_id, markup)
        = ($1, $2, $3, $4, $5, $6, $7, $8)
        WHERE id = $9"
        values = [@title, @description, @quantity, @buying_cost, @selling_price, @author_id, @genre_id, (@selling_price - @buying_cost), @id]
        SqlRunner.run(sql, values)
    end

    def author()
        author = Author.find_by_id(@author_id)
        return author
    end

    def book_markup()
        result = @selling_price - @buying_cost
        return result
    end

    def genre()
        genre = Genre.find_by_id(@genre_id)
        return genre
    end

end