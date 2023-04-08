/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
escape_attempts INTEGER NOT NULL,
neutered BOOLEAN NOT NULL,
weight_kg DECIMAL(5,2) NOT NULL
);

ALTER TABLE animals
ADD species VARCHAR(50);

ALTER TABLE animals
DROP COLUMN species;

CREATE TABLE owners (
id SERIAL PRIMARY KEY,
full_name VARCHAR(50) NOT NULL,
age INTEGER NOT NULL
);

CREATE TABLE species (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

CREATE TABLE vets (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INTEGER NOT NULL,
date_of_graduation DATE NOT NULL
);

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals 
ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

ALTER TABLE animals 
ADD FOREIGN KEY (species_id) REFERENCES species (id);

CREATE TABLE specializations (
  PRIMARY KEY (specie_id, vet_id),
  specie_id integer REFERENCES species (id), 
  vet_id integer REFERENCES vets (id)
);

CREATE TABLE visits (
  animal_id INT NOT NULL,
  vet_id INT NOT NULL,
  date_of_visit DATE NOT NULL,
  CONSTRAINT fk_visits_animals FOREIGN KEY (animal_id) REFERENCES animals (id),
  CONSTRAINT fk_visits_vets FOREIGN KEY (vet_id) REFERENCES vets (id)
);

