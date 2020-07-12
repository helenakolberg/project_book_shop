require_relative('../db/sql_runner.rb')

class Book

    attr_reader :id
    attr_accessor :name, :description, :quantity, :buying_cost, :selling_price, :author_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @description = options['description']
        @quantity = options['quantity'].to_i
        @buying_cost = options['buying_cost'].to_i
        @selling_price = options['selling_price'].to_i
        @author_id = options['author_id'].to_i
    end

    def save()
        sql = "INSERT INTO books (name, description, quantity, buying_cost, selling_price, author_id)
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
        values = [@name, @description, @quantity, @buying_cost, @selling_price, @author_id]
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

end