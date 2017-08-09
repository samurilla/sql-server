USE AdventureWorks2014
Go

CREATE PROC dbo.uspGetAddress @City nvarchar(30)
AS
SELECT * FROM Person.Address
Where City = @City
GO




/*Wildcard procedure*/
USE AdventureWorks2014
Go

CREATE PROC dbo.uspGetAddress @City nvarchar(30)
AS
SELECT * FROM Person.Address
Where City LIKE @City + '%'
GO




/*Stored procedure with or without parameters. Return null in the city column.*/
USE AdventureWorks2014
Go

CREATE PROC dbo.uspGetAddress @City nvarchar(30) = NULL
AS
SELECT * FROM Person.Address
Where City = @City
GO




/*Stored procedure with or without parameters. Return everything in the city column.*/
USE AdventureWorks2014
Go

CREATE PROC dbo.uspGetAddress @City nvarchar(30) = NULL
AS
SELECT * FROM Person.Address
Where City = ISNULL(@City,City)
GO



/*Executing the procedure*/
EXEC dbo.uspGetAddress @City = 'New York'






/*Stored procedure with or without parameters. Return everything in the city column.*/
USE AdventureWorks2014
Go

CREATE PROC dbo.uspGetAddress @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT * FROM Person.Address
Where City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1, AddressLine1) + '%'
GO



/*Executing a multiple parameter procedure*/
EXEC dbo.uspGetAddress @City = 'New York'
/*or*/
EXEC dbo.uspGetAddress @City = 'New York', @AddressLine1 = '123'
/*or*/
EXEC dbo.uspGetAddress @AddressLine1 = '123'