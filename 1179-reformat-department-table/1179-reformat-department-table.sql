/* Write your T-SQL query statement below */
SELECT
    ID AS id,
    JAN AS 'Jan_Revenue', FEB AS 'Feb_Revenue', MAR AS 'Mar_Revenue', APR AS 'Apr_Revenue', MAY AS 'May_Revenue', JUN AS 'Jun_Revenue', JUL AS 'Jul_Revenue',
    AUG AS 'Aug_Revenue', SEP AS 'Sep_Revenue', OCT AS 'Oct_Revenue', NOV AS 'Nov_Revenue', DEC AS 'Dec_Revenue'
FROM (
    SELECT
        *
    FROM
        DEPARTMENT
) A
PIVOT (
    SUM(REVENUE) FOR MONTH IN (JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC)
) PVT