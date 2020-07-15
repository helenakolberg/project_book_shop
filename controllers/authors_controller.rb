require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/book')
require_relative('../models/author')
also_reload('../models/*')

get '/authors' do
    @authors = Author.sort_alphabetically()
    erb(:"authors/index")
end

get '/authors/new' do
    @authors = Author.all()
    erb(:"authors/new")
end

post '/authors' do
    Author.new(params).save()
    redirect '/authors'
end

get '/authors/:id' do
    @author = Author.find_by_id(params['id'])
    erb(:"authors/show")
end

post '/authors/:id/delete' do
    author = Author.find_by_id(params['id'])
    author.delete()
    redirect '/authors'
end

get '/authors/:id/edit' do
    @author = Author.find_by_id(params['id'])
    erb(:"authors/edit")
end

post '/authors/:id' do
    author = Author.new(params)
    author.update()
    redirect "authors/#{params['id']}"
end

get '/authors/:id/books' do
    @author = Author.find_by_id(params['id'])
    erb(:"authors/books")
end