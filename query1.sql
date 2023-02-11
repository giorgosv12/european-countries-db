-- Για έναν ταξιδιώτη υποθέτουμε ότι θέλει να επισκεφθεί το αρχαιότερο μνημείο
-- της Ευρώπης(το μνημείο που τελείωσε την κατασκευή του πιο νωρίς)

 SELECT * FROM
 (SELECT attraction_name 
FROM monument)b WHERE attraction_name NOT IN

(SELECT attraction_name FROM (
SELECT *
FROM (
SELECT is_UNESCO AS Dis_UNESCO , start_construction_year AS Dstart_construction_year , 
end_construction_year AS Dend_construction_year , attraction_name AS Dattraction_name
FROM monument)D
JOIN monument
WHERE end_construction_year>Dend_construction_year)mon)

