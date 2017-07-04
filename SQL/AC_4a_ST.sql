/*
Strother Troiano
Final Project
View #4
This view summarizes all of the nutrition for each person.
It only pulls meals with a larger than average serving size, and
foods with higher than average calorie OR sugar content,
*/

USE FoodDB

IF OBJECT_ID('TotNutrition') IS NOT NULL
DROP VIEW TotNutrition
GO

CREATE VIEW TotNutrition
AS
SELECT p.PersonID, FirstName + ' ' + LastName AS Name,
	SUM(Calories) AS TotCals, SUM(Protein) AS TotProtein, SUM(Fat) AS TotFat,
	SUM(Cholesterol) AS TotCholesterol, SUM(Sugar) AS TotSugar, SUM(Fiber) AS TotFiber,
	SUM(Sodium) AS TotSodium, 

	--IIF function here
	IIF(SUM(Calories) < 1000, 'Underweight',IIF(SUM(Calories) > 2500, 'Overweight','Medium Weight')) AS Weight
FROM People p JOIN Meals m
	ON p.PersonID = m.PersonID
	JOIN Nutrition n
	ON m.FoodID = n.FoodID
WHERE ServingSizeMeal > (SELECT AVG(ServingSizeMeal)
						FROM Meals) AND
		Calories > (SELECT AVG(Calories)
					FROM Nutrition) OR
		Sugar > (SELECT AVG(Sugar)
				FROM Nutrition)

GROUP BY p.PersonID, FirstName, LastName