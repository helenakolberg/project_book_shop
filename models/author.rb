require_relative('../db/sql_runner.rb')

class Author

    attr_reader :id
    attr_accessor :first_name, :last_name, :bio

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @bio = options['bio']
    end

    def save()
        sql = "INSERT INTO authors (first_name, last_name, bio)
        VALUES ($1, $2, $3) RETURNING id"
        values = [@first_name, @last_name, @bio]
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



end