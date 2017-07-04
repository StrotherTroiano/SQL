/*
Strother Troiano 
Final Project
User Defined Function
This function takes a PersonID and outputs
the average calories per meal
*/

USE FoodDB
GO

IF OBJECT_ID('fnAvgCals') IS NOT NULL
DROP FUNCTION fnAvgCals
GO

CREATE FUNCTION fnAvgCals 
(@PersonID int)
	RETURNS int
BEGIN
	RETURN
		(SELECT AVG((ServingSizeMeal / CAST(ServingSizeFood AS decimal(28,6)) * Calories))
		FROM Meals m JOIN Nutrition n
		ON m.FoodID = n.FoodID
		WHERE PersonID = @PersonID)
END