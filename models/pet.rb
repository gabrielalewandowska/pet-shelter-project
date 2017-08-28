require_relative( '../db/sql_runner' )
require_relative("owner")

class Pet

  attr_reader(:id)
  attr_accessor(:name, :species, :breed, :age, :size, :sex, :status, :admission_date, :photo)
  def initialize(params)
    @id = params["id"].to_i if params["id"]
    @name = params["name"]
    @species = params["species"]
    @breed = params["breed"]
    @age = params["age"].to_i
    @size = params["size"]
    @sex = params["sex"]
    @status = params["status"]
    @admission_date = params["admission_date"]
    @photo = params["photo"]
  end

  def save
    sql = "INSERT INTO pets
    (name, species, breed, age, size, sex, status, admission_date, photo)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING *;"
    values = [@name, @species, @breed, @age, @size, @sex, @status, @admission_date, @photo]
    pet = SqlRunner.run(sql, values)
    @id = pet.first["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM pets;"
    pets = SqlRunner.run(sql, [])
    pets_objects = pets.map {|pet| Pet.new(pet)}
    return pets_objects
  end

  def self.delete_all
    sql = "DELETE FROM pets;"
    SqlRunner.run(sql, [])
  end

  def update
    sql = "UPDATE pets SET
    (name, species, breed, age, size, sex, status, admission_date, photo)
    = ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id= $10;"
    values = [@name, @species, @breed, @age, @size, @sex, @status, @admission_date, @photo]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM pets WHERE id = $1;"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE id = $1;"
    value = [id]
    pet_hash = SqlRunner.run(sql, value).first
    pet_object = Pet.new(pet_hash) if pet_hash
    return pet_object
  end

  def self.adoptable
    sql = "SELECT * FROM pets WHERE status = $1;"
    value = ["waiting for adoption"]
    pets_hash = SqlRunner.run(sql, value)
    pet_objects = pets_hash.map {|hash| Pet.new(hash)}
    return pet_objects
  end

  def self.training_or_vet
    sql = "SELECT * FROM pets where status = $1;"
    value = ["in vet care/ training"]
    pets_hash = SqlRunner.run(sql, value)
    pet_objects = pets_hash.map {|hash| Pet.new(hash)}
    return pet_objects
  end

  def self.adopted
    sql = "SELECT * FROM pets where status = $1;"
    value = ["adopted"]
    pets_hash = SqlRunner.run(sql, value)
    pet_objects = pets_hash.map {|hash| Pet.new(hash)}
    return pet_objects
  end
end
