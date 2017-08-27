require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("./models/pet.rb")
require_relative("./models/owner.rb")
also_reload("./models/*")

get '/' do
  erb(:home)
end
