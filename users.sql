# Create user admin that can perform select,insert,update and delete queries in the DB but only from the server of the DB (localhost)
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'superpass';
GRANT ALL PRIVILEGES ON europeancountriesdb.* TO 'admin'@'localhost';


# Create user country_health_supervisor that can perform select,insert,update queries in the the covid19cases and 
# covid19_vaccinations tables in the DB but only remotely
CREATE USER 'country_health_supervisor'@'%' IDENTIFIED BY 'healthpass';
GRANT SELECT,INSERT,UPDATE ON europeancountriesdb.covid19cases  TO 'country_health_supervisor'@'%';
GRANT SELECT,INSERT,UPDATE ON europeancountriesdb.covid19_vaccinations TO 'country_health_supervisor'@'%';


# Create user world_health_supervisor that can perform select,update queries in the the covid19cases and 
# covid19_vaccinations tables in the DB but only remotely
CREATE USER 'world_health_supervisor'@'%' IDENTIFIED BY 'worldhealthpass';
GRANT SELECT,UPDATE ON europeancountriesdb.covid19cases  TO 'world_health_supervisor'@'%';
GRANT SELECT,UPDATE ON europeancountriesdb.covid19_vaccinations TO 'world_health_supervisor'@'%';


# Create user country_transport_supervisor that can perform select,insert,update,delete queries in the the port,airport, 
# high_speed_railway_station and connects_through_line in the DB but only remotely
CREATE USER 'country_transport_supervisor'@'%' IDENTIFIED BY 'transpass';
GRANT SELECT,INSERT,UPDATE,DELETE ON europeancountriesdb.port TO 'country_transport_supervisor'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE ON europeancountriesdb.airport TO 'country_transport_supervisor'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE ON europeancountriesdb.high_speed_railway_station TO 'country_transport_supervisor'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE ON europeancountriesdb.connects_through_line TO 'country_transport_supervisor'@'%';


# Create user tourist_ministry_employee that can perform select,insert,update,delete queries in the the city_many_visitors,tourist_attraction ,
# monument and museum in the DB but only remotely
CREATE USER 'tourist_ministry_employee'@'%' IDENTIFIED BY 'tourpass';
GRANT SELECT,INSERT,UPDATE,DELETE ON europeancountriesdb.city_many_visitors TO 'tourist_ministry_employee'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE ON europeancountriesdb.tourist_attraction TO 'tourist_ministry_employee'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE ON europeancountriesdb.monument TO 'tourist_ministry_employee'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE ON europeancountriesdb.museum TO 'tourist_ministry_employee'@'%';


# Create user guestuser that can perform select queries in the DB
CREATE USER 'guestuser'@'localhost' IDENTIFIED BY 'guestpassword';
CREATE USER 'guestuser'@'%' IDENTIFIED BY 'guestpassword';
GRANT SELECT ON europeancountriesdb.* TO 'guestuser'@'localhost';
GRANT SELECT ON europeancountriesdb.* TO 'guestuser'@'%';