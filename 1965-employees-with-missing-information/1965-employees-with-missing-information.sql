/* Write your T-SQL query statement below */
SELECT E.Employee_id
FROM Employees E
LEFT JOIN Salaries S
ON E.Employee_id = S.Employee_id
WHERE Salary IS NULL 
UNION
SELECT S.Employee_id
FROM Employees E
RIGHT JOIN Salaries S
ON E.Employee_id = S.Employee_id
WHERE Name IS NULL
ORDER BY Employee_id