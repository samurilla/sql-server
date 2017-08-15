CREATE DATABASE db_library
GO
USE db_library
GO

------------------------------------------------------------------------------------------------------------------------------------------------
												--RUN THESE LAST--


-- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
EXEC dbo.uspSharpstownTribe


-- How many copies of the book titled "The Lost Tribe" are owned by each library branch?
EXEC dbo.uspTribeCount


-- Retrieve the names of all borrowers who do not have any books checked out.
EXEC dbo.uspNoBooks


-- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
EXEC dbo.uspSharpstownDueDate


-- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
EXEC dbo.uspLibraryLoaned


-- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
EXEC dbo.uspCheckedOutMoreThan5


-- For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
EXEC dbo.uspFindKing

------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PUBLISHER (
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);




CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);



CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);



CREATE TABLE BOOK (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(75) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_BOOK_Name FOREIGN KEY REFERENCES PUBLISHER(Name) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_BOOK_AUTHORS_BookID FOREIGN KEY REFERENCES BOOK(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);



CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BOOK_COPIES_BookID FOREIGN KEY REFERENCES BOOK(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BOOK_COPIES_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
);



CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_BOOK_LOANS_BookID FOREIGN KEY REFERENCES BOOK(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BOOK_LOANS_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_BOOK_LOANS_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);


------------------------------------------------------------------------------------------------------------------------------------------------



INSERT INTO PUBLISHER
	(Name, Address, Phone)
	VALUES
	('Signet Books', 'New York City, New York', '745-089-2345'),
	('Picador USA', '175 5th Ave, New York, NY 10010', '800-221-7945'),
	('Tor Books', '175 5th Ave, New York, NY 10010', '800-239-5952'),
	('Bantam Spectra', 'New York City, New York', '800-256-6364'),
	('Penguin Random House', '1745 Broadway, New York, NY 10106', '212-782-9000'),
	('Disney Lucasfilm Press', 'Glendale, California', '800-524-9235')
;



INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
	('Sharpstown', '801 SW 10th Ave, Portland, OR 97205'),
	('Central', '802 SW 10th Ave, Portland, OR 97205'),
	('Downtown', '803 SW 10th Ave, Portland, OR 97205'),
	('PSU', '804 SW 10th Ave, Portland, OR 97205')
;




INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('Jamie Parker', '178 Winifred Way, Shirley, IN 47384', '765-737-7408'),
	('Dirk Grissom', '2822 Court Street, Saint Louis, MO 63146', '636-695-6938'),
	('Margarita Martone', '923 Charmaine Lane, Quitaque, TX 79255', '806-455-8312'),
	('David Landry', '2000 Bassell Avenue, Hot Springs, AR 71901', '501-763-5048'),
	('Cheryl McDaniel', '2459 Melm Street, West Warwick, RI 2893', '401-293-3730'),
	('Teresa Square', '2475 Richards Avenue, Stockton, CA 95202', '209-817-0029'),
	('Rene Ramos', '051 Goff Avenue, Kalamazoo, MI 49007', '269-635-9208'),
	('Nadine Jones', '1839 Peck Court, Rancho Santa Margarita, CA 92688', '949-546-8633'),
	('Leslie Maynard', '2253 Wetzel Lane, Grand Rapids, MI 49508', '231-344-2574'),
	('Alfred Gibbons', '2216 Capitol Avenue, Indianapolis, IN 46214', '765-505-5463'),
	('Dale Hagberg', '4862 Franklin Street, Phenix City, AL 36867', '334-732-6761'),
	('Judith Bergman', '37 Trouser Leg Road, Agawam, MA 1001', '413-822-7042'),
	('Gregory Freeman', '3555 Dancing Dove Lane, New York, NY 10011', '347-436-2159'),
	('Sarah Alcocer', '3133 O Conner Street, Pascagoula, MS 39567', '228-994-9589'),
	('Lonnie Lumpkin', '3798 Jacobs Street, Pittsburgh, PA 15238', '412-340-3989'),
	('Bert Friend', '728 Lady Bug Drive, Colorado Springs, CO 80907', '719-200-1821'),
	('Carolyn Warren', '4903 Francis Mine, Sacramento, CA 95814', '530-219-5734'),
	('Betty Stewart', '1090 Star Route Burr, Ridge, IL 60527', '708-644-4796'),
	('Stella Hudson', '3448 Brooklyn Street, Corvallis, OR 97330', '541-207-1073'),
	('Jarvis Cunningham', '2856 Walnut Drive, Willow City, ND 58384', '701-366-0250'),
	('Olga Yazzie', '1009 Morris Street, Victoria, TX 77901', '830-371-2080'),
	('Sara Cary', '298 Sand Fork Road, Burrows, IN 46916', '574-652-8941'),
	('Michelle Kinney', '1594 Pearl Street, Folsom CA, 95630', '916-294-2290'),
	('Janice Alford', '1630 Rollins Road, Saint Paul, NE 68873', '308-754-6424'),
	('Lloyd Merchant', '4476 Haymond Rocks, Road Silver Lake, OR 97638', '541-576-8660'),
	('Joseph Harrington', '1410 Dogwood Lane, Tucson, AZ 85701', '520-620-9655'),
	('Bobby Szymanski', '4425 Tecumsah Lane, Cotton Port, LA 71327', '318-876-3542'),
	('Corine Colunga', '4698 Cheshire Road, Hartford, CT 6182', '203-427-1137'),
	('Adolph Koury', '3661 Buffalo Creek Road, Madison, TN 37115', '615-868-7585'),
	('Carole Hancock', '2747 Glen Street, Gilbertsville, KY 42044', '270-362-4463')
;





INSERT INTO BOOK
	(Title, PublisherName)
	VALUES
	('The Green Mile', 'Signet Books'),--Stephen King
	('The Lost Tribe', 'Picador USA'),--Mark Lee
	('Ender''s Game', 'Tor Books'),--Orson Scott Card
	('Ender''s Shadow', 'Tor Books'),--Orson Scott Card
	('Ender in Exile', 'Tor Books'),--Orson Scott Card
	('Shadow of the Giant', 'Tor Books'),--Orson Scott Card
	('Shadow of the Hegemon', 'Tor Books'),--Orson Scott Card
	('Shadow Puppets', 'Tor Books'),--Orson Scott Card
	('Children of the Mind', 'Tor Books'),--Orson Scott Card
	('Xenocide', 'Tor Books'),--Orson Scott Card
	('Speaker for the Dead', 'Tor Books'),--Orson Scott Card
	('A Game of Thrones', 'Bantam Spectra'),--George R. R. Martin
	('A Clash of Kings', 'Bantam Spectra'),--George R. R. Martin
	('A Storm of Swords', 'Bantam Spectra'),--George R. R. Martin
	('A Feast for Crows', 'Bantam Spectra'),--George R. R. Martin
	('A Dance with Dragons', 'Bantam Spectra'),--George R. R. Martin
	('The Winds of Winter', 'Bantam Spectra'),--George R. R. Martin
	('A Dream of Spring', 'Bantam Spectra'),--George R. R. Martin
	('Ahsoka', 'Disney Lucasfilm Press'),--E.K. Johnston
	('Star Wars Rebels: Rise of the Rebels', 'Disney Lucasfilm Press'),--Michael Kogge
	('Rogue One: A Star Wars Story - A Junior Novel', 'Disney Lucasfilm Press'),--Matt Forbeck
	('A New Hope: The Princess, the Scoundrel, and the Farm Boy', 'Disney Lucasfilm Press'),--Alexandra Bracken
	('The Empire Strikes Back: So You Want to Be a Jedi?', 'Disney Lucasfilm Press'),--Adam Gidwitz
	('Adventures of Huckleberry Finn', 'Penguin Random House'),--Mark Twain
	('The Adventures of Tom Sawyer', 'Penguin Random House')--Mark Twain
;





INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	('1', 'Stephen King'),
	('2', 'Mark Lee'),
	('3', 'Orson Scott Card'),
	('4', 'Orson Scott Card'),
	('5', 'Orson Scott Card'),
	('6', 'Orson Scott Card'),
	('7', 'Orson Scott Card'),
	('8', 'Orson Scott Card'),
	('9', 'Orson Scott Card'),
	('10', 'Orson Scott Card'),
	('11', 'Orson Scott Card'),
	('12', 'George R. R. Martin'),
	('13', 'George R. R. Martin'),
	('14', 'George R. R. Martin'),
	('15', 'George R. R. Martin'),
	('16', 'George R. R. Martin'),
	('17', 'George R. R. Martin'),
	('18', 'George R. R. Martin'),
	('19', 'E.K. Johnston'),
	('20', 'Michael Kogge'),
	('21', 'Matt Forbeck'),
	('22', 'Alexandra Bracken'),
	('23', 'Adam Gidwitz'),
	('24', 'Mark Twain'),
	('25', 'Mark Twain')
;




INSERT INTO BOOK_COPIES
	(BookID, BranchID, No_Of_Copies)
	VALUES
	('1', '1', '7'),
	('2', '1', '2'),
	('3', '1', '8'),
	('4', '1', '10'),
	('5', '1', '4'),
	('6', '1', '4'),
	('7', '1', '2'),
	('8', '1', '8'),
	('9', '1', '10'),
	('10', '1', '10'),
	('11', '1', '9'),
	('12', '1', '9'),
	('13', '1', '13'),
	('14', '1', '4'),
	('15', '1', '12'),
	('16', '1', '4'),
	('17', '1', '8'),
	('18', '1', '10'),
	('19', '1', '10'),
	('20', '1', '7'),
	('21', '1', '12'),
	('22', '1', '11'),
	('23', '1', '6'),
	('24', '1', '9'),
	('25', '1', '12'),
	('1', '2', '6'),
	('2', '2', '10'),
	('3', '2', '9'),
	('4', '2', '12'),
	('5', '2', '3'),
	('6', '2', '2'),
	('7', '2', '9'),
	('8', '2', '5'),
	('9', '2', '6'),
	('10', '2', '13'),
	('11', '2', '5'),
	('12', '2', '8'),
	('13', '2', '10'),
	('14', '2', '8'),
	('15', '2', '9'),
	('16', '2', '12'),
	('17', '2', '13'),
	('18', '2', '3'),
	('19', '2', '8'),
	('20', '2', '10'),
	('21', '2', '13'),
	('22', '2', '10'),
	('23', '2', '7'),
	('24', '2', '5'),
	('25', '2', '9'),
	('1', '3', '12'),
	('2', '3', '6'),
	('3', '3', '7'),
	('4', '3', '10'),
	('5', '3', '13'),
	('6', '3', '3'),
	('7', '3', '9'),
	('8', '3', '6'),
	('9', '3', '12'),
	('10', '3', '12'),
	('11', '3', '10'),
	('12', '3', '10'),
	('13', '3', '13'),
	('14', '3', '6'),
	('15', '3', '9'),
	('16', '3', '7'),
	('17', '3', '4'),
	('18', '3', '4'),
	('19', '3', '5'),
	('20', '3', '4'),
	('21', '3', '7'),
	('22', '3', '5'),
	('23', '3', '9'),
	('24', '3', '2'),
	('25', '3', '10'),
	('1', '4', '6'),
	('2', '4', '12'),
	('3', '4', '9'),
	('4', '4', '11'),
	('5', '4', '12'),
	('6', '4', '9'),
	('7', '4', '7'),
	('8', '4', '12'),
	('9', '4', '4'),
	('10', '4', '13'),
	('11', '4', '11'),
	('12', '4', '7'),
	('13', '4', '3'),
	('14', '4', '9'),
	('15', '4', '9'),
	('16', '4', '12'),
	('17', '4', '5'),
	('18', '4', '2'),
	('19', '4', '9'),
	('20', '4', '7'),
	('21', '4', '6'),
	('22', '4', '4'),
	('23', '4', '2'),
	('24', '4', '8'),
	('25', '4', '12')
;




INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DueDate)
	VALUES
	('24', '1', '1', '2017-07-16', '2017-08-15'),
	('25', '1', '1', '2017-07-20', '2017-08-14'),
	('5', '3', '2', '2017-07-18', '2017-08-16'),
	('2', '4', '3', '2017-07-23', '2017-08-21'),
	('7', '1', '4', '2017-07-18', '2017-08-11'),
	('12', '2', '5', '2017-07-28', '2017-08-15'),
	('13', '2', '6', '2017-07-22', '2017-08-11'),
	('7', '4', '7', '2017-07-24', '2017-08-18'),
	('18', '2', '8', '2017-07-17', '2017-08-14'),
	('1', '1', '9', '2017-07-19', '2017-08-14'),
	('2', '1', '9', '2017-07-24', '2017-08-12'),
	('19', '1', '9', '2017-07-29', '2017-08-11'),
	('3', '4', '10', '2017-08-04', '2017-08-16'),
	('4', '4', '10', '2017-07-30', '2017-08-21'),
	('5', '4', '10', '2017-07-21', '2017-08-16'),
	('6', '4', '10', '2017-07-15', '2017-08-12'),
	('7', '4', '10', '2017-08-06', '2017-08-21'),
	('8', '4', '10', '2017-07-21', '2017-08-14'),
	('9', '4', '10', '2017-08-07', '2017-08-11'),
	('10', '4', '10', '2017-07-27', '2017-08-16'),
	('11', '4', '10', '2017-07-17', '2017-08-13'),
	('4', '4', '12', '2017-07-28', '2017-08-13'),
	('16', '4', '12', '2017-07-21', '2017-08-15'),
	('23', '2', '13', '2017-07-24', '2017-08-18'),
	('7', '3', '14', '2017-08-04', '2017-08-20'),
	('3', '3', '15', '2017-07-22', '2017-08-19'),
	('4', '3', '15', '2017-07-26', '2017-08-15'),
	('19', '1', '16', '2017-07-15', '2017-08-18'),
	('22', '3', '17', '2017-08-09', '2017-08-18'),
	('23', '3', '17', '2017-07-22', '2017-08-21'),
	('8', '2', '18', '2017-08-03', '2017-08-21'),
	('15', '2', '19', '2017-07-26', '2017-08-20'),
	('13', '3', '20', '2017-07-20', '2017-08-19'),
	('22', '3', '21', '2017-07-23', '2017-08-14'),
	('1', '3', '22', '2017-08-08', '2017-08-18'),
	('17', '3', '22', '2017-08-05', '2017-08-16'),
	('2', '1', '23', '2017-07-17', '2017-08-14'),
	('9', '1', '24', '2017-07-14', '2017-08-20'),
	('6', '2', '25', '2017-07-18', '2017-08-13'),
	('18', '4', '26', '2017-07-23', '2017-08-19'),
	('5', '4', '27', '2017-08-09', '2017-08-15'),
	('9', '4', '28', '2017-07-20', '2017-08-20'),
	('2', '2', '29', '2017-07-22', '2017-08-13'),
	('12', '1', '30', '2017-07-14', '2017-08-15'),
	('13', '1', '30', '2017-07-13', '2017-08-20'),
	('14', '1', '30', '2017-08-02', '2017-08-21'),
	('15', '1', '30', '2017-07-26', '2017-08-20'),
	('16', '1', '30', '2017-08-08', '2017-08-17'),
	('18', '1', '30', '2017-08-05', '2017-08-21'),
	('19', '1', '30', '2017-07-18', '2017-08-19')
;

-----------------------------------------------------------------------------------------------------------------------------------------------------------

--How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
CREATE PROC dbo.uspSharpstownTribe
AS
	SELECT 
		BOOK.Title, BOOK_COPIES.No_Of_Copies, LIBRARY_BRANCH.BranchName
		FROM BOOK
		INNER JOIN BOOK_COPIES ON BOOK_COPIES.BookID = BOOK.BookID
		INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
		WHERE BOOK.Title = 'The Lost Tribe' AND LIBRARY_BRANCH.BranchName = 'Sharpstown'
	;
GO



--How many copies of the book titled "The Lost Tribe" are owned by each library branch?
CREATE PROC dbo.uspTribeCount
AS
	SELECT 
		Book.Title, BOOK_COPIES.No_Of_Copies, LIBRARY_BRANCH.BranchName
		FROM BOOK
		INNER JOIN BOOK_COPIES ON BOOK_COPIES.BookID = BOOK.BookID
		INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
		WHERE BOOK.Title = 'The Lost Tribe'
	;
GO



--Retrieve the names of all borrowers who do not have any books checked out.
CREATE PROC dbo.uspNoBooks
AS
	SELECT BORROWER.CardNo, BORROWER.Name
		FROM BOOK_LOANS 
		FULL OUTER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo
		WHERE BOOK_LOANS.CardNo IS NULL
	;
GO



--For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
CREATE PROC dbo.uspSharpstownDueDate
AS
	DECLARE @today VARCHAR(15) = CONVERT (DATE, GETDATE());
	SELECT 
		BOOK.Title, LIBRARY_BRANCH.BranchName, BORROWER.Name, BORROWER.Address
		FROM BOOK_LOANS
		INNER JOIN BOOK ON BOOK.BookID = BOOK_LOANS.BookID
		INNER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo
		INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
		WHERE DueDate = @today and LIBRARY_BRANCH.BranchName = 'Sharpstown'
	;
GO



--For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
CREATE PROC dbo.uspLibraryLoaned
AS
	SELECT COUNT(BookID) AS 'Number of Books', LIBRARY_BRANCH.BranchName
		FROM BOOK_LOANS 
		INNER JOIN LIBRARY_BRANCH ON BOOK_LOANS.BRANCHID = LIBRARY_BRANCH.BRANCHID
		GROUP BY LIBRARY_BRANCH.BranchName
	;
GO



--Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
CREATE PROC dbo.uspCheckedOutMoreThan5
AS
	SELECT COUNT(BookID) AS 'Books Checked Out', BORROWER.Name, BORROWER.Address
		FROM BOOK_LOANS 
		INNER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo
		GROUP BY BORROWER.Name, BORROWER.Address
		HAVING COUNT(BookID) >= 5
	;
GO



--For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
CREATE PROC dbo.uspFindKing
AS
	SELECT BOOK.Title, BOOK_AUTHORS.AuthorName, BOOK_COPIES.No_Of_Copies, LIBRARY_BRANCH.BranchName
		FROM BOOK
		INNER JOIN BOOK_AUTHORS ON BOOK_AUTHORS.BookID = BOOK.BookID
		INNER JOIN BOOK_COPIES ON BOOK_COPIES.BookID = BOOK.BookID
		INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BookID
		WHERE AuthorName = 'Stephen King'
	;
GO