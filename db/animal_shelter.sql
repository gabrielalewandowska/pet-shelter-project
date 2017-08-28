DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  breed VARCHAR(255),
  age INT,
  size VARCHAR(255),
  sex VARCHAR(255),
  status VARCHAR(255),
  admission_date VARCHAR(255),
  photo VARCHAR(255)
);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  pet_id INT REFERENCES pets(id) ON DELETE CASCADE,
  address VARCHAR(255)
);
