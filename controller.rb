require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("./models/pet.rb")
require_relative("./models/owner.rb")
also_reload("./models/*")

get '/' do
  erb(:home)
end

get '/animals' do
  @animals = Pet.all
  erb(:animals)
end

get '/animals/new' do
  @animals = Pet.all
  erb(:new)
end

post '/animals' do
  @pet = Pet.new(params)
  @pet.save
  erb(:create)
end

get '/animals/:id' do
  @pet = Pet.find(params[:id])
  erb(:show)
end

get '/owners' do
  @owners = Owner.all
  erb(:owners)
end
# get '/animals/adoptable' do
#   @pets = Pet.all
#   erb(:adoptable)
# end
