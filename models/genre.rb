require_relative('../db/sql_runner.rb')

class Genre

    attr_reader :id
    attr_accessor :type

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @type = options['type']
    end

    def save()
        sql = "INSERT INTO genres (type) VALUES ($1) RETURNING id"
        values = [@type]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM genres"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM genres WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.map_items(data)
        return data.map { |genre| Genre.new(genre) }
    end

    def self.all()
        sql = "SELECT * FROM genres"
        result = SqlRunner.run(sql)
        return self.map_items(result)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM genres WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        return Genre.new(result)
    end

    def update()
        sql = "UPDATE genres SET type = $1
        WHERE id = $2"
        values = [@type, @id]
        SqlRunner.run(sql, values)
    end

    def books()
        sql = "SELECT * FROM books WHERE genre_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        return Book.map_items(result)
    end

end