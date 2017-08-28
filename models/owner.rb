require_relative( '../db/sql_runner' )
require_relative("pet")

class Owner

  attr_reader(:id)
  attr_accessor(:first_name, :last_name, :address, :pet_id)

  def initialize(params)
    @id = params["id"].to_i
    @first_name = params["first_name"]
    @last_name = params["last_name"]
    @address = params["address"]
    @pet_id = params["pet_id"].to_i
  end

  def save
    sql = "INSERT INTO owners
    (first_name, last_name, address, pet_id)
    VALUES ($1, $2, $3, $4)
    RETURNING *;"
    values = [@first_name, @last_name, @address, @pet_id]
    owner = SqlRunner.run(sql, values)
    @id = owner.first["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM owners;"
    owners_hashes = SqlRunner.run(sql, [])
    owners_objects = owners_hashes.map {|hash| Owner.new(hash)}
    return owners_objects
  end

  def delete
    sql = "DELETE FROM owners WHERE id = $1;"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.delete_all
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql, [])
  end

  def update
    sql = "UPDATE owners SET (first_name, last_name, address, pet_id)
    = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@first_name, @last_name, @address, @pet_id, @id]
    SqlRunner.run(sql, values)
  end

  def pet
    sql = "SELECT * FROM PETS where id = $1;"
    value = [@pet_id]
    pet_hash = SqlRunner.run(sql, value)
    pet_object = Pet.new(pet_hash.first)
    return pet_object.name
  end

  def adopt(pet)
    sql = "UPDATE owners SET (pet_id) = $1 WHERE id = $2;"
    values = [pet.id, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1;"
    value = [id]
    owner_hash = SqlRunner.run(sql, value)
    owner_object = Owner.new(owner_hash.first)
    return owner_object
  end

  def find_pet_name(pet_id)
    sql = "SELECT * FROM pets WHERE id = $1;"
    value = [pet_id]
    pet_hash = SqlRunner.run(sql, value)
    pet_object = Pet.new(pet_hash.first)
    return pet_object.name
  end
end
