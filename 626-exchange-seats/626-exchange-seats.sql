/* Write your T-SQL query statement below */
SELECT ID, ISNULL(CASE WHEN t.rn % 2 = 0 THEN LAG(student) OVER (ORDER BY ID) ELSE LEAD(student) OVER (ORDER BY ID) END, student) AS student
FROM (
  SELECT ID, student, ROW_NUMBER() OVER (ORDER BY ID) AS rn 
  FROM Seat
) t
