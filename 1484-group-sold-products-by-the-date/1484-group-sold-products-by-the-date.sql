/* Write your T-SQL query statement below */
WITH CTE
AS
(
SELECT DISTINCT sell_date, product
FROM Activities
)

SELECT sell_date, COUNT(product) as num_sold,STRING_AGG(product,',') WITHIN GROUP (ORDER BY product ASC) AS products
FROM CTE
GROUP BY CTE.sell_date
ORDER BY CTE.sell_date