require_relative('../db/sql_runner.rb')

class Author

    attr_reader :id
    attr_accessor :first_name, :last_name, :bio, :status

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @bio = options['bio']
        @status = options['status']
    end

    def save()
        sql = "INSERT INTO authors (first_name, last_name, bio, status)
        VALUES ($1, $2, $3, $4) RETURNING id"
        values = [@first_name, @last_name, @bio, @status]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM authors"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM authors WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.map_items(data)
        return data.map { |author| Author.new(author) }
    end

    def self.all()
        sql = "SELECT * FROM authors"
        result = SqlRunner.run(sql)
        return self.map_items(result)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM authors WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        author = Author.new(result)
        return author
    end

    def update()
        sql = "UPDATE authors SET
        (first_name, last_name, bio, status) = ($1, $2, $3, $4)
        WHERE id = $5"
        values = [@first_name, @last_name, @bio, @status, @id]
        SqlRunner.run(sql, values)
    end

    def books()
        sql = "SELECT * FROM books WHERE author_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        return Book.map_items(result)
    end

    def full_name()
        return "#{@first_name} #{@last_name}"
    end

    def self.sort_alphabetically()
        authors_array = Author.all()
        authors = authors_array.sort_by { |author| author.last_name }
        return authors
    end

end