/*
Strother Troiano 
Final Project
Stored Procedure
*/


USE FoodDB

DECLARE @Count bigint
EXEC spCalCount @Count OUTPUT, 'Grain', 'Jason'
--SELECT @Count AS TotalCalories

PRINT 'Jason has gotten ' + CONVERT(varchar,@Count,1) + ' calories from grains.'

EXEC spCalCount @Count OUTPUT, 'Grain'

PRINT 'Grains have provided a total of ' + CONVERT(varchar,@Count,1) + ' calories.'