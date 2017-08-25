require_relative( '../db/sql_runner' )

class Pet

  attr_reader(:id)
  attr_accessor(:name, :species, :breed, :age, :size, :sex, :adoptable, :admission_date, :photo)
  def initialize(params)
    @id = params["id"].to_i
    @name = params["name"]
    @species = params["species"]
    @breed = params["breed"]
    @age = params["age"].to_i
    @size = params["size"]
    @sex = params["sex"]
    @adoptable = params["adoptable"]
    @admission_date = params["admission_date"]
    @photo = params["photo"]
  end

  def save
    sql = "INSERT INTO pets
    (name, species, breed, age, size, sex, adoptable, admission_date, photo)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING *;"
    values = [@name, @species, @breed, @age, @size, @sex, @adoptable, @admission_date, @photo]
    pet = SqlRunner.run(sql, values)
    @id = pet.first["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM pets;"
    pets = SqlRunner.run(sql, [])
    pets_objects = pets.map {|pet| Pet.new(pet)}
    return pets_objects
  end

  def update
    sql = "UPDATE pets SET
    (name, species, breed, age, size, sex, adoptable, admission_date, photo)
    = ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id= $10;"
    values = [@name, @species, @breed, @age, @size, @sex, @adoptable, @admission_date, @photo]
    SqlRunner.run(sql, values)
  end
end
