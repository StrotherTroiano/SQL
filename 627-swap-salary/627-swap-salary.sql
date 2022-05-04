/* Write your T-SQL query statement below */
UPDATE Salary
SET Sex = CASE WHEN Sex = 'f' THEN 'm'
               WHEN Sex = 'm' THEN 'f'
           END
