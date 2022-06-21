/* Write your T-SQL query statement below */
SELECT DISTINCT v.author_id AS id
FROM Views V
INNER JOIN Views DUP
ON v.author_id = dup.author_id
WHERE v.author_id = dup.viewer_id
ORDER BY v.author_id