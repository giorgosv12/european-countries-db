-- Για έναν ταξιδιώτη υποθέτουμε ότι έχει φοβία για τα αεροπλάνα και θέλει να
-- ταξιδέψει σε κάποια Ευρωπαϊκή χώρα που έχει τουλάχιστον ένα λιμάνι ή ένα
-- σιδηροδρομικό σταθμό

DROP TABLE IF EXISTS A ;
DROP TABLE IF EXISTS B;
DROP TABLE IF EXISTS C;

CREATE TEMPORARY TABLE A AS
SELECT COUNT(*) AS Ports, country_code
FROM port
GROUP BY country_code;

CREATE TEMPORARY TABLE B AS
SELECT COUNT(*) AS Stations, country_code
FROM high_speed_railway_station
GROUP BY country_code;

CREATE TEMPORARY TABLE C AS
SELECT country_code 
FROM B 
WHERE Stations >= 1
UNION 
SELECT country_code 
FROM A 
WHERE Ports >= 1;

SELECT country_name
FROM european_country JOIN C 
ON c.country_code= european_country.country_code