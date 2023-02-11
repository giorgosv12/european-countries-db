-- Για έναν ταξιδιώτη υποθέτουμε ότι θέλει να επισκεφθεί το μουσείο τέχνης με την
-- μεγαλύτερη επισκεψιμότητα στην Ευρώπη

SELECT attraction_name
FROM museum
WHERE num_visitors_per_year_latest=
(SELECT highest_visited_museum
FROM
(SELECT MAX(num_visitors_per_year_latest) AS highest_visited_museum, museum_type
FROM museum 
GROUP BY museum_type)a 
WHERE museum_type="art")