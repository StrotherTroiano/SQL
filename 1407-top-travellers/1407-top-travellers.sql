/* Write your T-SQL query statement below */
SELECT name, ISNULL(SUM(distance), 0) AS travelled_distance
FROM Users LEFT JOIN Rides
ON Users.id = Rides.user_id
GROUP BY name, Users.id
ORDER BY travelled_distance DESC, name