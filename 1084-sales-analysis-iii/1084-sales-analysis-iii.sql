# Write your MySQL query statement below
SELECT p.product_id, p.product_name
FROM Product P
LEFT JOIN Sales S
ON p.product_id = s.product_id
GROUP BY p.product_id
HAVING sum(s.sale_date BETWEEN '2019-01-01' AND '2019-03-31') = COUNT(s.sale_date)