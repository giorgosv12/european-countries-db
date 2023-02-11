-- Έστω ένας Έλληνας επιδημιολόγος θέλει να συγκρίνει την επιδημιολογική
-- κατάσταση της Ελλάδας με χώρες με παρόμοιο πληθυσμό (± 10%) για την
-- ημερομηνία (24-11-2021)

SELECT country_name,country_population,num_daily_cases,date
FROM (
SELECT country_code,country_name,country_population
FROM european_country)eur JOIN
(SELECT country_code,num_daily_cases,date
FROM covid19_cases)cov ON eur.country_code=cov.country_code
WHERE (country_population<1.1*(SELECT country_population FROM european_country WHERE country_name = 'Greece')
AND country_population>0.9*(SELECT country_population FROM european_country WHERE country_name = 'Greece')
AND date='2021-11-24')
