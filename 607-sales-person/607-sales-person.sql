/* Write your T-SQL query statement below */
SELECT Name
FROM SalesPerson
WHERE sales_id NOT IN (SELECT sales_id
                    FROM Orders
                    INNER JOIN Company
                    ON Company.com_id = Orders.com_id
                    WHERE Company.Name = 'RED')