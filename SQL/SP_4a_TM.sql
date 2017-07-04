/*
Strother Troiano 
Final Project
View #1
This view shows the total number of (large) fruit-based meals for each person
*/

USE FoodDB

IF OBJECT_ID('Num_Meals') IS NOT NULL
DROP VIEW Num_Meals
GO

CREATE VIEW Num_Meals
AS
SELECT p.PersonID, CONCAT(FirstName,' ',LastName) AS Name,
		COUNT(MealID) AS NumFruitMeals 
FROM People p JOIN Meals m
	ON p.PersonID = m.PersonID
WHERE (FoodID = 1 OR FoodID = 2 OR FoodID = 8 
		OR FoodID = 17  OR FoodID = 18) AND ServingSizeMeal > 100
GROUP BY p.PersonID, p.LastName, p.FirstName
GO




