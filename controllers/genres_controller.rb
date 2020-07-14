require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/genre')
require_relative('../models/book')
also_reload('../models/*')

get '/genres' do
    @genres = Genre.all()
    erb(:"genres/index")
end

get '/genres/:id/books' do
    @genre = Genre.find_by_id(params['id'])
    erb(:"genres/books")
end

get '/genres/new' do
    @genres = Genre.all()
    erb(:"genres/new")
end

post '/genres' do
    Genre.new(params).save()
    redirect '/genres'
end