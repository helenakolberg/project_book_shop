require('pry-byebug')
require_relative('../models/author.rb')

Author.delete_all()

author1 = Author.new({
    'name' => 'Frank McCourt',
    'bio' => "Francis McCourt (August 19, 1930 – July 19, 2009) was an Irish-American teacher and writer. 
    He won a Pulitzer Prize for his book Angela's Ashes, a tragicomic memoir of the misery and squalor of his childhood."
    })

author1.save()




binding.pry
nil