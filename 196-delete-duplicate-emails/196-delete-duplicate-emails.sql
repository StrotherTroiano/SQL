/* 
 Please write a DELETE statement and DO NOT write a SELECT statement.
 Write your T-SQL query statement below
 */
DELETE P
FROM Person P
INNER JOIN Person DUP
ON P.Email = DUP.Email
WHERE P.Id > DUP.Id