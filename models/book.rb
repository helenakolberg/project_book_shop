require_relative('../db/sql_runner.rb')

class Book

    attr_reader :id
    attr_accessor :title, :description, :quantity, :buying_cost, :selling_price, :author_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @description = options['description']
        @quantity = options['quantity'].to_i
        @buying_cost = options['buying_cost'].to_i
        @selling_price = options['selling_price'].to_i
        @author_id = options['author_id'].to_i
    end

    def save()
        sql = "INSERT INTO books 
        (title, description, quantity, buying_cost, selling_price, author_id)
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
        values = [@title, @description, @quantity, @buying_cost, @selling_price, @author_id]
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
        result = SqlRunner.run(sql, values)
        return self.map_items(result)
    end

    def update()
        sql = "UPDATE books SET
        (title, description, quantity, buying_cost, selling_price, author_id)
        = ($1, $2, $3, $4, $5, $6)
        WHERE id = $7"
        values = [@title, @description, @quantity, @buying_cost, @selling_price, @author_id, @id]
        SqlRunner.run(sql, values)
    end

    def sell_book()
        sql = "UPDATE books SET quantity = $1 WHERE id = $2"
        values = [@quantity - 1, @id]
        SqlRunner.run(sql, values)
    end



end