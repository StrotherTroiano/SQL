/* Write your T-SQL query statement below */
SELECT Name AS Customers
FROM Customers
WHERE Id NOT IN (SELECT CustomerID
                    FROM Orders)