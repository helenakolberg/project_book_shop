require('pry-byebug')
require_relative('../models/author.rb')

Author.delete_all()

author1 = Author.new({
    'name' => 'Frank McCourt',
    'bio' => "Francis McCourt (August 19, 1930 – July 19, 2009) was an Irish-American teacher and writer. 
    He won a Pulitzer Prize for his book Angela's Ashes, a tragicomic memoir of the misery and squalor of his childhood."
    })

author2 = Author.new({
    'name' => 'Elena Ferrante',
    'bio' => "Elena Ferrante is a pseudonymous Italian novelist. Her four-book series of Neapolitan Novels are her best-known works."
})

author3 = Author.new({
    'name' => 'J.K. Rowling',
    'bio' => "Joanne Rowling (born 31 July 1965), better known by her pen name J. K. Rowling, 
    is a British author, screenwriter, producer, and philanthropist."
})

author1.save()
author2.save()
author3.save()

author3.delete()




binding.pry
nil