/*
Strother Troiano
Final Project
User Defined Function
This function takes a PersonID and outputs
All of their meals
This takes advantage of the CalsPerMeal View
*/

USE FoodDB
GO

IF OBJECT_ID('fnPersonMeals') IS NOT NULL
DROP FUNCTION fnPersonMeals
GO

CREATE FUNCTION fnPersonMeals (@PersonID int)
RETURNS @OutTable table
	(ID int, Name varchar(50), FoodName varchar(25), Servings decimal(28,6),
	CalCount decimal(28,6))
BEGIN
	INSERT @OutTable
		SELECT PersonID, Name, FoodName, Servings, MealCalories
		FROM CalsPerMeal
		WHERE PersonID LIKE @PersonID
		ORDER BY CAST(MealCalories AS int) DESC
	RETURN
END