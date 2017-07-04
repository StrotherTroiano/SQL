/*
Strother Troiano
Final Project
Stored Procedure
This procedure lets you input the size and price, 
and outputs  the number shirts that match the inputs
*/

USE FoodDB
GO

IF OBJECT_ID('spPriceSize') IS NOT NULL
DROP PROC spPriceSize
GO

CREATE PROC spPriceSize
	@DesiredPrice money = '%',
	@DesiredSize varchar(50) = '%'
AS

--This conditional checks if the user put a wildcard in the parameter
--If not, one is appended to the end
IF @Name  NOT LIKE '%[%]%'
	SET @Name = @Name + '%'

DECLARE @CalsTable table
(Name varchar(200), MealCalories decimal(26,8), FoodGroup varchar(200))
INSERT INTO @CalsTable
SELECT FirstName + ' ' + LastName AS Name, 
	(ServingSizeMeal / CAST(ServingSizeFood AS decimal(28,6)) * Calories) AS MealCalories,
	FoodGroup
FROM People p JOIN Meals m
	ON p.PersonID = m.PersonID
	JOIN Nutrition n
	ON m.FoodID = n.FoodID

SELECT @NumCalories = SUM(CAST(MealCalories AS int))
					FROM @CalsTable
					WHERE Name LIKE @Name
					AND FoodGroup LIKE @FoodGroup
