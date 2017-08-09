-- Design a stored procedure that has at least two joins and two parameters.
USE AdventureWorks2014
GO

CREATE PROC dbo.uspUserEmail @fname nvarchar(30) = NULL,  @lname nvarchar(30) = NULL, @email nvarchar(30) = NULL
AS
SELECT Person.Person.FirstName, Person.Person.LastName, Person.EmailAddress.EmailAddress, Person.Password.PasswordHash
FROM Person.Person
INNER JOIN Person.EmailAddress ON Person.Emailaddress.BusinessEntityID = Person.Person.BusinessEntityID
INNER JOIN Person.Password ON Person.Password.BusinessEntityID = Person.Person.BusinessEntityID
WHERE FirstName LIKE ISNULL(@fname, FirstName) + '%'
AND LastName LIKE ISNULL(@lname, LastName) + '%'
AND EmailAddress LIKE '%' + ISNULL(@email, EmailAddress) + '%'
GO


EXEC dbo.uspUserEmail @fname = '', @lname = '', @email = ''
