/*
Strother Troiano 
Final Project
View #2
This view shows above-average calorie food meals
*/

USE FoodDB
GO

IF OBJECT_ID('HighCalFoods') IS NOT NULL
DROP VIEW HighCalFoods
GO

CREATE VIEW HighCalFoods
AS
SELECT m.MealID, CONCAT(FirstName,' ',LastName) AS Name, 
	FoodName, Calories AS CalsPerServing, ServingSizeMeal AS MealServing,
	ServingSizeFood AS RegServingSize
FROM People p JOIN Meals m
	ON p.PersonID = m.PersonID
	JOIN Nutrition n
	ON m.FoodID = n.FoodID

--SubQuery here
WHERE Calories > (SELECT AVG(Calories)
				FROM Nutrition)

GROUP BY m.MealID, p.FirstName, p.LastName, FoodName,
		Calories, ServingSizeMeal, ServingSizeFood
GO
