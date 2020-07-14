require_relative('../db/sql_runner.rb')

class Genre

    attr_reader :id
    attr_accessor :type

    def initialize(options)
        @id = options['id'].to if options['id']
        @type = options['type']
    end

    def save()
        sql = "INSERT INTO genres (type) VALUES ($1) RETURNING id"
        values = [@type]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i
    end

end