require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/book')
require_relative('../models/author')
also_reload('../models/*')

get '/authors' do
    @authors = Author.all()
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