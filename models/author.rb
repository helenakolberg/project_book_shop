class Author

    attr_reader :id
    attr_accessor :name, :bio

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @bio = options['bio']
    end

end