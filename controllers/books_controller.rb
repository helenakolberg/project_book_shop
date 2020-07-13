require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/book')
require_relative('../models/author')
also_reload('../models/*')

get '/books' do
    @books = Book.all()
    erb(:"books/index")
end

get '/books/new' do
    @books = Book.all()
    @authors = Author.all()
    erb(:"books/new")
end

post '/books' do
    Book.new(params).save
    redirect '/books'
end