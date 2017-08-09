USE AdventureWorks2014
Go

CREATE PROC dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO



EXEC dbo.uspGetAddress