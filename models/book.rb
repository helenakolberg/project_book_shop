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

end