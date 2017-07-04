/*
Strother Troiano 
Final Project
User Defined Function View
*/


USE FoodDB

PRINT 'Person 1 eats an average of ' + CONVERT(varchar, 
dbo.fnAvgCals(1), 1) + ' calories per meal.'
PRINT 'Person 10 eats an average of ' + CONVERT(varchar, 
dbo.fnAvgCals(10), 1) + ' calories per meal.'