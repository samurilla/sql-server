-- Base stored procedure
Use AdventureWorks2014
GO

CREATE PROC dbo.uspGetAddress @City nvarchar(30)
AS
SELECT *
FROM Person.Address
WHERE City = @City
GO




-- Altering the above procedure
ALTER PROC dbo.uspGetAddress @City nvarchar(30)
AS
SELECT *
FROM Person.Address
WHERE City LIKE @City + '%'
GO


EXEC dbo.uspGetAddress 'New '