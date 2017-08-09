/*Stored procedure with a return value*/
USE AdventureWorks2014
GO

CREATE PROC dbo.uspGetAddressCount @City nvarchar(30), @AddressCount INT OUTPUT
AS
SELECT @AddressCount = COUNT(*)
FROM AdventureWorks2014.Person.Address
WHERE City = @City


/*Running the store procedure*/
DECLARE @AddressCount INT
EXEC [dbo].[uspGetAddressCount] @City = 'New York', @AddressCount = @AddressCount OUTPUT
SELECT @AddressCount