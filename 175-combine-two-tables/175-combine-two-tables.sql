/* Write your T-SQL query statement below */
SELECT firstName, lastName, city, state
FROM Person P
LEFT JOIN Address A
ON A.PersonID = P.PersonID
