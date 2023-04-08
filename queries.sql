/*Queries that provide answers to the questions from all projects.*/

-- SELECT * from animals WHERE name = 'Luna';

-- Find all animals whose name ends in "mon":
SELECT * FROM animals WHERE name LIKE '%mon';
-- List the name of all animals born between 2016 and 2019
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
-- Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = true;
-- Find all animals not named Gabumon.
SELECT * FROM animals WHERE name != 'Gabumon';
-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT * FROM animals WHERE species = 'unspecified';


-- start transaction
BEGIN;
-- update the animals table by setting the species column to unspecified
UPDATE animals
SET species = 'unspecified';
-- Verify that change was made
SELECT 
 species
FROM 
animals;
-- roll back the transaction
ROLLBACK;
SELECT 
 species
FROM 
animals;


-- start transaction
BEGIN;
-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals
SET species = 'digimon' 
WHERE name LIKE '%mon';
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
-- Commit the transaction.
COMMIT;
-- Verify that change was made and persists after commit.
SELECT * FROM animals;
-- delete all records in the animals table
DELETE * FROM animals;
SELECT * FROM animals;
-- roll back the transaction
ROLLBACK;

-- start transaction
BEGIN;
-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
-- create savepoint
SAVEPOINT save_1;
-- update all animals' weight to be their weight multiplied by -1
UPDATE animals SET weight_kg = (weight_kg * -1);
-- Rollback to the savepoint
ROLLBACK TO save_1;
-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
-- commit transaction
COMMIT;
SELECT * FROM animals;

-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, AVG(escape_attempts) AS escapes FROM animals GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS minimum_weight, MAX(weight_kg) AS maximum_weight 
FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) 
FROM animals 
WHERE EXTRACT(YEAR FROM date_of_birth) 
BETWEEN 1990 AND 2000 
GROUP BY species;

-- Write queries (using JOIN) to answer the following questions:
-- What animals belong to Melody Pond?
SELECT owners.full_name, animals.name FROM owners JOIN animals ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
-- Update List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE animals.species_id = 1;
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners FULL OUTER JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species
SELECT COUNT(species_id), (species.name)  FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- Update List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name, species.name, animals.name
FROM owners
INNER JOIN animals
ON owners.owner_id = animals.owner_id
INNER JOIN species
ON animals.species_id = species.species_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- Update List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name, full_name FROM animals
FULL OUTER JOIN owners ON animals.owner_id = owners.id
WHERE escape_attempts = 0 AND owner_id = 5;

-- Who owns the most animals?
SELECT full_name, COUNT(owner_id) AS Total_animals FROM owners
JOIN animals ON  owners.id = animals.owner_id
GROUP BY full_name
ORDER BY COUNT(name) DESC;


DELETE FROM species
WHERE id = 3;


UPDATE TABLE specializations
SET specie_id = 2 
WHERE specie_id = 3;

-- What was the last animal seen by William Tatcher?
SELECT vets.name AS vets, animals.name AS last_Visit_by
FROM animals
  JOIN visits ON visits.animal_id = animals.species_id
  JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC;

-- How many different animals did Stephanie Mendez see?
SELECT animals.name, COUNT(*) FROM visits 
  JOIN animals ON  visits.animal_id = animals.id
  JOIN vets ON visits.vet_id = vets.id
  WHERE vets.name = 'Stephanie Mendez'
  GROUP BY animals.name;


-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name AS vet, species.name AS specializations
FROM vets
  JOIN specializations ON vet_id = vets.id
  JOIN species ON specie_id = species.id
ORDER BY
  vets.name;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT animals.name AS animals FROM visits 
  JOIN animals ON  visits.animal_id = animals.id
  JOIN vets ON visits.vet_id = vets.id
  WHERE vets.name = 'Stephanie Mendez' AND (visits.date_of_visit BETWEEN 'April 1, 2020' AND 'August 30, 2020'); 

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) AS visits FROM visits
  JOIN animals ON  visits.animal_id = animals.id
  GROUP BY animals.name
  ORDER BY visits DESC
  LIMIT 1;


-- Who was Maisy Smith's first visit?
SELECT animals.name, date_of_visit FROM visits 
  JOIN animals  ON  visits.animal_id = animals.id
  JOIN vets ON visits.vet_id = vets.id
  WHERE vets.name = 'Maisy Smith'
  ORDER BY date_of_visit
  LIMIT 1;


-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name AS animal, vets.name AS vet, visits.date_of_visit
FROM animals
JOIN visits ON visits.animal_id = animals.species_id
JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.date_of_visit DESC
LIMIT 1;


-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits JOIN vets ON visits.vet_id = vets.id
JOIN specializations ON vets.id = specializations.vet_id
JOIN species ON specializations.specie_id = species.id
JOIN animals ON visits.animal_id = animals.id
WHERE species.id != animals.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(*) AS specialty FROM visits
  JOIN animals ON  visits.animal_id = animals.id
  JOIN vets ON visits.vet_id = vets.id
  JOIN species ON animals.species_id = species.id
  WHERE vets.name = 'Maisy Smith'
  GROUP BY species.name
  ORDER BY specialty DESC
  LIMIT 1;