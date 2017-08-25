require_relative("models/pet.rb")
require ("pry")

Pet.delete_all
Owner.delete_all

  dog1 = Pet.new ({
    "name" => "Pepe",
    "species" => "dog",
    "breed" => "Chihuahua",
    "age" => 7,
    "size" => "small",
    "sex" => "male",
    "adoptable" => true,
    "admission_date" => "01-08-2017",
    "photo" => "../public/images/dog1.jpeg"
    })

    dog1.save

  cat1 = Pet.new ({
    "name" => "Nala",
    "species" => "cat",
    "breed" => "Maine Coon",
    "age" => 3,
    "size" => "small",
    "sex" => "female",
    "adoptable" => true,
    "admission_date" => "10-08-2017",
    "photo" => "../public/images/cat1.jpeg"
    })

  cat1.save

  owner1 = Owner.new ({
    "first_name" => "Lucy",
    "last_name" => "Findlay",
    "address" => "11 Castle Terrace, Edinburgh EH1 7QR",
    "pet_id" => cat1.id
    })

  owner1.save

binding.pry
nil
