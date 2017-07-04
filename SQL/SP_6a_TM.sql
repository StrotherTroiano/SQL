/*
Strother Troiano
Final Project
View #3
This view calculates the number of servings from each meal and
calculates the number of calories
*/

USE FoodDB

IF OBJECT_ID('CalsPerMeal') IS NOT NULL
DROP VIEW CalsPerMeal
GO

CREATE VIEW CalsPerMeal
AS
SELECT m.MealID, p.PersonID, CONCAT(FirstName,' ',LastName) AS Name, 
		ServingSizeMeal / CAST(ServingSizeFood AS decimal(4,1)) AS Servings, 
		(ServingSizeMeal / CAST(ServingSizeFood AS decimal(4,1)) * Calories) AS MealCalories,
		FoodName,FoodGroup
FROM People p JOIN Meals m
	ON p.PersonID = m.PersonID
	JOIN Nutrition n
	ON m.FoodID = n.FoodID
GROUP BY m.MealID, p.PersonID, p.LastName, p.FirstName, 
	ServingSizeMeal, ServingSizeFood, n.Calories,
	FoodName,FoodGroup
GO
