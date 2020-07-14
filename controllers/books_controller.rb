require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/book')
require_relative('../models/author')
require_relative('../models/genre')
also_reload('../models/*')

get '/books' do
    @books = Book.all()
    erb(:"books/index")
end

get '/books/new' do
    @books = Book.all()
    @authors = Author.all()
    @genres = Genre.all()
    erb(:"books/new")
end

post '/books' do
    Book.new(params).save()
    redirect '/books'
end

get '/books/:id' do
    @book = Book.find_by_id(params['id'])
    erb(:"books/show")
  end

post '/books/:id/delete' do
    book = Book.find_by_id(params['id'])
    book.delete()
    redirect '/books'
end

get '/books/:id/edit' do
    @book = Book.find_by_id(params['id'])
    @authors = Author.all()
    @genres = Genre.all()
    erb(:"books/edit")
end

post '/books/:id' do
    book = Book.new(params)
    book.update()
    redirect "books/#{params['id']}"
end