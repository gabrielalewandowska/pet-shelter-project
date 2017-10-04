require("sinatra")
require('sinatra/contrib/all') if development?
require_relative("./models/pet.rb")
require_relative("./models/owner.rb")

get '/' do
  erb(:home)
end

get '/search_database' do
  erb(:search_database)
end

post '/search' do
  @pets = Pet.search_database(params)
  if @pets == []
     erb(:not_found)
   else
     erb(:search_result)
 end
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
  pet = Pet.new(params)
  pet.save
  erb(:create)
end

get '/adoption' do
  @pets = Pet.adoptable
  erb(:adoption)
end

post '/adoption' do
  owner = Owner.new(params)
  owner.save
  pet = Pet.find(params['pet_id'])
  pet.update_status("adopted")
  redirect to("/owners")
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

get '/animals/:id/edit' do
  @pet = Pet.find(params[:id])
  erb(:edit)
end

post '/animals/:id/delete' do
  @pet = Pet.find(params[:id])
  @pet.delete
  redirect to ("/animals")
end

post '/animals/:id' do
  pet = Pet.new(params)
  pet.update
  redirect to('/animals')
end

get '/animals/:id' do
  @pet = Pet.find(params[:id])
  erb(:show)
end

get '/owners' do
  @owners = Owner.all
  erb(:owners)
end
