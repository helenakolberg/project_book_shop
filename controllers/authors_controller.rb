require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/book')
require_relative('../models/author')
also_reload('../models/*')

get '/authors' do
    @authors = Author.all()
    erb(:"authors/index")
end