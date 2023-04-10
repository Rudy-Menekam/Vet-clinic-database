/* Populate database with sample data. */

-- INSERT INTO animals (name) VALUES ('Luna');
-- INSERT INTO animals (name) VALUES ('Daisy');
-- INSERT INTO animals (name) VALUES ('Charlie');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11),
('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-09-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species(name) Values('Pokemon');
INSERT INTO species(name) Values('Digimon');

-- insert data into the vets table
INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

-- insert data into the specializations table
insert into specializations(vet_id, specie_id)
values 
    (1, 1),
    (3, 2),
    (3, 1),
    (4, 1);

insert into visits(vet_id, animal_id, date_of_visit)
VALUES
(1, 1, '2020-05-24'),
(3, 2, '2020-07-22'),
(4, 3, '2021-02-02'),
(2, 4, '2020-02-02'),
(2, 4, '2020-05-08'),
(2, 4, '2020-05-14'),
(3, 5, '2021-05-04'),
(4, 6, '2021-02-24'),
(2, 7, '2019-12-21'),
(1, 7, '2020-08-10'),
(2, 7, '2021-04-07'),
(3, 8, '2019-09-29'),
(4, 9, '2020-10-03'),
(4, 9, '2020-11-04'),
(2, 10, '2019-01-24'),
(2, 10, '2019-05-15'),
(2, 10, '2020-02-27'),
(2, 10, '2020-08-03'),
(3, 11, '2020-05-24'),
(1, 11, '2021-01-11');

 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), 
 (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), 
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Gabumon'), 
 (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), 
 (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), 
 (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), 
 (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Devimon'), 
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04');
 INSERT INTO visits (vet_id, animal_id, date_of_visit)
 VALUES ((SELECT id FROM animals WHERE name = 'Charmander'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), 
 (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), 
 (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), 
 (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), 
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), 
 (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), 
 (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), 
 (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), 
 (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), 
 (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), 
 (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24');
 INSERT INTO visits (vet_id, animal_id, date_of_visit) 
 VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), 
 (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');
 

-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
-- All other animals are Pokemon
UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
-- Update Sam Smith owns Agumon
UPDATE animals SET owner_id = 1 WHERE name LIKE 'Agumon';
-- Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals SET owner_id = 2 WHERE name LIKE 'Gabumon';
-- Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals SET owner_id = 2 WHERE name LIKE 'Pikachu';
-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = 3 WHERE name LIKE 'Devimon';
-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = 3 WHERE name LIKE 'Plantmon';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Charmander';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Squirtle';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = 4 WHERE name LIKE 'Blossom';
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = 5 WHERE name LIKE 'Angemon';
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = 5 WHERE name LIKE 'Boarmon';

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) 
SELECT * FROM (SELECT id FROM animals) animal_ids, 
(SELECT id FROM vets) vets_ids, 
generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') 
visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) 
select 'Owner ' || generate_series(1,2500000), 
'owner_' || generate_series(1,2500000) || '@mail.com';