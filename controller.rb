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

get '/animals/adoptable' do
  @pets = Pet.adoptable
  erb(:adoptable)
end

get '/animals/training_or_vet' do
  @pets = Pet.training_or_vet
  erb(:training_or_vet)
end

get '/animals/adopted' do
  @pets = Pet.adopted
  erb(:adopted)
end

get '/animals/:id' do
  @pet = Pet.find(params[:id])
  erb(:show)
end

get '/owners' do
  @owners = Owner.all
  erb(:owners)
end
