require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/genre')
require_relative('../models/book')
also_reload('../models/*')

get '/genres' do
    @genres = Genre.all()
    erb(:"genres/index")
end