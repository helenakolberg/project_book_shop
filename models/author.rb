require_relative('../db/sql_runner.rb')

class Author

    attr_reader :id
    attr_accessor :name, :bio

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @bio = options['bio']
    end

    def save()
        sql = "INSERT INTO authors (name, bio)
        VALUES ($1, $2) RETURNING id"
        values = [@name, @bio]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i
    end

end