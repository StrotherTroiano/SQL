/*
Strother Troiano 
Final Project
Trigger
This trigger alters the case of the
food name entered in a new record so
that it starts with an uppercase letter
and is followed by all lowercase letters
*/


USE FoodDB
GO

IF OBJECT_ID('Nutrition_INSERT_UPDATE') IS NOT NULL
DROP TRIGGER Nutrition_INSERT_UPDATE
GO

CREATE TRIGGER Nutrition_INSERT_UPDATE
ON Nutrition
AFTER INSERT,UPDATE
AS
UPDATE Nutrition
SET FoodName = UPPER(LEFT(FoodName,1))+LOWER(SUBSTRING(FoodName,2,LEN(FoodName)))
WHERE FoodID IN (SELECT FoodID FROM inserted)