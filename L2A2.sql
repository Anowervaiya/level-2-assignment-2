CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    ranger_name TEXT NOT NULL,
    region TEXT NOT NULL
);

INSERT INTO rangers (ranger_id, ranger_name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status TEXT NOT NULL
);

INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');



CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location TEXT NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
);

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


SELECT * FROM rangers;

-- problem 1
INSERT INTO rangers (ranger_id, ranger_name, region) VALUES
(4, 'Derek Fox', 'Coastal Plains');

-- problem 2

SELECT  count(DISTINCT species_id) as unique_species_count FROM sightings ;

--problem 3

SELECT * FROM sightings WHERE location LIKE '%Pass%';

--problem 4 

SELECT ranger_name as name , count(ranger_id) as total_sightings from rangers 
   JOIN sightings USING(ranger_id)
   GROUP BY ranger_name;

--problem 5

SELECT common_name FROM species
 left JOIN sightings USING(species_id)
 WHERE sighting_id is NULL 
 ; 

--  problem 6

SELECT common_name, sighting_time, ranger_name FROM species
  JOIN sightings USING(species_id)
  JOIN rangers USING (ranger_id) ORDER BY sighting_time DESC LIMIT 2;


--problem 7

SELECT * FROM species;

ALTER Table species 
 ADD COLUMN status TEXT 
  ;

UPDATE species
SET status = 'Historic'
WHERE discovery_date < '1800-01-01';

-- problem 8

SELECT 
    sighting_id,
   CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings 

;

-- problem 9 

DELETE  from rangers 
 where  not EXISTS
  (
    SELECT *
    FROM sightings
    WHERE sightings.ranger_id = rangers.ranger_id
    )


SELECT * FROM rangers;