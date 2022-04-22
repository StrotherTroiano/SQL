/* Write your T-SQL query statement below */
SELECT e.name AS Employee
FROM Employee E
LEFT JOIN Employee EM
ON e.managerid = em.id
WHERE e.salary > em.salary
