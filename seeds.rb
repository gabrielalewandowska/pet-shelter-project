require_relative("models/pet.rb")
require_relative("models/owner.rb")
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
    "status" => "waiting for adoption",
    "admission_date" => "01-08-2017",
    "photo" => "/images/dog1.jpeg"
    })

    dog1.save

  cat1 = Pet.new ({
    "name" => "Nala",
    "species" => "cat",
    "breed" => "Maine Coon",
    "age" => 3,
    "size" => "small",
    "sex" => "female",
    "status" => "adopted",
    "admission_date" => "10-08-2017",
    "photo" => "/images/cat1.jpeg"
    })

  cat1.save

  dog2 = Pet.new ({
    "name" => "Ruby",
    "species" => "dog",
    "breed" => "Pit Bull",
    "age" => 5,
    "size" => "large",
    "sex" => "female",
    "status" => "waiting for adoption",
    "admission_date" => "20-08-2017",
    "photo" => "/images/dog2.jpg"
    })

  dog2.save

  cat2 = Pet.new ({
    "name" => "Charlie",
    "species" => "cat",
    "breed" => "Domestic Short Hair",
    "age" => 1,
    "size" => "small",
    "sex" => "male",
    "status" => "waiting for adoption",
    "admission_date" => "15-08-2017",
    "photo" => "/images/cat2.jpeg"
    })
  cat2.save

  dog3 = Pet.new ({
    "name" => "Bubbles",
    "species" => "dog",
    "breed" => "Golden Retriever",
    "age" => 1,
    "size" => "large",
    "sex" => "male",
    "status" => "waiting for adoption",
    "admission_date" => "26-08-2017",
    "photo" => "/images/dog3.jpeg"
    })

    dog3.save

    cat3 = Pet.new ({
      "name" => "Maurice",
      "species" => "cat",
      "breed" => "Dragon Li",
      "age" => 3,
      "size" => "small",
      "sex" => "male",
      "status" => "in vet care/ training",
      "admission_date" => "11-08-2017",
      "photo" => "/images/cat3.jpeg"
      })

    cat3.save

    dog4 = Pet.new ({
      "name" => "Waffles",
      "species" => "dog",
      "breed" => "Highland Terrier",
      "age" => 4,
      "size" => "small",
      "sex" => "male",
      "status" => "adopted",
      "admission_date" => "16-08-2017",
      "photo" => "/images/dog4.jpeg"
      })
      dog4.save

    cat4 = Pet.new ({
      "name" => "Lucy",
      "species" => "cat",
      "breed" => "European Shorthair",
      "age" => 2,
      "size" => "small",
      "sex" => "female",
      "status" => "waiting for adoption",
      "admission_date" => "22-08-2017",
      "photo" => "/images/cat4.jpg"
      })

    cat4.save

    dog5 = Pet.new ({
      "name" => "Rufus",
      "species" => "dog",
      "breed" => "Mongrel",
      "age" => 7,
      "size" => "medium",
      "sex" => "male",
      "status" => "adopted",
      "admission_date" => "20-07-2017",
      "photo" => "/images/dog5.jpeg"
      })

    dog5.save

    cat5 = Pet.new ({
      "name" => "Fergus",
      "species" => "cat",
      "breed" => "Domestic Shorthair",
      "age" => 1,
      "size" => "small",
      "sex" => "male",
      "status" => "in vet care/ training",
      "admission_date" => "01-08-2017",
      "photo" => "/images/cat5.jpeg"
      })
    cat5.save

    owner1 = Owner.new ({
      "first_name" => "Lucy",
      "last_name" => "Findlay",
      "address" => "67 Holyrood Road, Edinburgh EH8 8AU",
      "pet_id" => cat1.id
      })

    owner1.save

    owner2 = Owner.new ({
      "first_name" => "Angus",
      "last_name" => "McDonald",
      "address" => "22 Blackness Road, Linlithgow EH49 7HU",
      "pet_id" => dog4.id
      })

    owner2.save

    owner3 = Owner.new ({
      "first_name" => "Rebecca",
      "last_name" => "Fraser",
      "address" => "6 Eastfield Drive, Penicuik EH26 8AF",
      "pet_id" => dog5.id
      })

    owner3.save

binding.pry
nil
