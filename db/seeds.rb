require('pry-byebug')
require_relative('../models/author.rb')
require_relative('../models/book.rb')

Book.delete_all()
Author.delete_all()

author1 = Author.new({
    'first_name' => 'Frank',
    'last_name' => 'McCourt',
    'bio' => "Francis McCourt (August 19, 1930 – July 19, 2009) was an Irish-American teacher and writer. 
    He won a Pulitzer Prize for his book Angela's Ashes, a tragicomic memoir of the misery and squalor of his childhood."
    })
author2 = Author.new({
    'first_name' => 'Elena',
    'last_name' => 'Ferrante',
    'bio' => "Elena Ferrante is a pseudonymous Italian novelist. Her four-book series of Neapolitan Novels are her best-known works."
})
author3 = Author.new({
    'first_name' => 'J.K.',
    'last_name' => 'Rowling',
    'bio' => "Joanne Rowling (born 31 July 1965), better known by her pen name J. K. Rowling, 
    is a British author, screenwriter, producer, and philanthropist."
})

author1.save()
author2.save()
author3.save()

book1 = Book.new({
    'name' => "Angela's Ashes",
    'description' => "Angela's Ashes is a 1996 memoir by the Irish-American author Frank McCourt, 
    with various anecdotes and stories of his childhood.",
    'quantity' => 10,
    'buying_cost' => 8,
    'selling_price' => 12,
    'author_id' => author1.id
})
book2 = Book.new({
    'name' => "My Brilliant Friend",
    'description' => "A modern masterpiece from one of Italy s most acclaimed authors, 
    My Brilliant Friend is a rich, intense, and generous-hearted story about two friends, Elena and Lila.",
    'quantity' => 15,
    'buying_cost' => 9,
    'selling_price' => 15,
    'author_id' => author2.id
})
book3 = Book.new({
    'name' => "Harry Potter and the Goblet of Fire",
    'description' => "The Triwizard Tournament is to be held at Hogwarts. 
    Only wizards who are over seventeen are allowed to enter – but that doesn't stop Harry dreaming that he will win the competition.",
    'quantity' => 20,
    'buying_cost' => 10,
    'selling_price' => 15,
    'author_id' => author3.id
})

book1.save()
book2.save()
book3.save()

book3.delete()
author3.delete()

author1.bio = "Francis McCourt (19 August 1930 – 19 July 2009) was an Irish-American teacher and writer. 
He won a Pulitzer Prize for his book Angela's Ashes, a tragicomic memoir of the misery and squalor of his childhood."
author1.update()


binding.pry
nil