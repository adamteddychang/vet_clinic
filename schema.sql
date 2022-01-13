/* Database schema to keep the structure of entire database. */
-- \i 'C:/Users/adamc/Documents/GitHub/vet_clinic/schema.sql'
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id int,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals 
ADD species varchar(100);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(100),
    age int
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(100)
);

ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
ADD id SERIAL PRIMARY KEY;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id int;

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owners_id int;

ALTER TABLE animals
ADD FOREIGN KEY (owners_id) REFERENCES owners(id);


CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    age int,
    date_of_graduation date
);

CREATE TABLE specializations (
    species_id int,
    vets_id int,
    CONSTRAINT fk_species 
     FOREIGN KEY(species_id) 
      REFERENCES species(id),
    CONSTRAINT fk_vets 
     FOREIGN KEY(vets_id) 
      REFERENCES vets(id)
);

CREATE TABLE visits (
    animals_id int,
    vets_id int,
    date_of_visit date,
    CONSTRAINT fk_animals 
     FOREIGN KEY(animals_id) 
       REFERENCES animals(id),
    CONSTRAINT fk_vets 
     FOREIGN KEY(vets_id) 
       REFERENCES vets(id)
);