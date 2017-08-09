-- Stored procedure with (# row(s) affected).
USE AdventureWorks2014
GO

CREATE PROC dbo.uspGetAddress @City nvarchar(30)
AS
SELECT *
FROM Person.Address
WHERE City = @City
GO




-- Stored procedure without (# row(s) affected).
USE AdventureWorks2014
GO

CREATE PROC dbo.uspGetAddress @City nvarchar(30)
AS
SET NOCOUNT ON	--This can be set on or off by changing ON to OFF
SELECT *
FROM Person.Address
WHERE City = @City
GO




-- Stored procedure without (# row(s) affected), but with @@ROWCOUNT to return just the number of rows affected.
USE AdventureWorks2014
GO

CREATE PROC dbo.uspGetAddress @City nvarchar(30)
AS
SET NOCOUNT ON	--This can be set on or off by changing ON to OFF
SELECT *
FROM Person.Address
WHERE City = @City
PRINT @@ROWCOUNT
GO


EXEC dbo.uspGetAddress 'New York'