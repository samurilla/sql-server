/*VIDEO 1*/


USE db_zoo;


CREATE TABLE tbl_animalia (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animalia_type VARCHAR(50) NOT NULL
);


INSERT INTO tbl_animalia
	(animalia_type)
	VALUES
	('vertebrate'),
	('invertebrate')
;


SELECT * FROM tbl_animalia;


CREATE TABLE tbl_class(
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL
);


SELECT * FROM tbl_class;


INSERT INTO tbl_class
	(class_type)
	VALUES
	('bird'),
	('reptilian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm')
;

SELECT * FROM tbl_class;



UPDATE tbl_class SET class_type = 'bird' WHERE class_type = 'birds';

SELECT * FROM tbl_class;



SELECT REPLACE(class_type, 'birds', 'bird' ) FROM tbl_class;


SELECT class_type FROM tbl_class WHERE class_type = 'bird';
SELECT class_id, class_type FROM tbl_class WHERE class_type = 'bird';
SELECT COUNT(class_type) FROM tbl_class WHERE class_type = 'bird';
SELECT UPPER(class_type) FROM tbl_class WHERE class_type = 'bird';








/*VIDEO 2*/

CREATE TABLE tbl_persons (
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_persons
	(persons_fname, persons_Lname, persons_contact)
	VALUES
	('bob', 'smith', '123-824-9142'),
	('mary', 'ann', '123-824-9142'),
	('tex', 'burns', '123-824-9142'),
	('gerry', 'kerns', '123-824-9142'),
	('sally', 'fields', '123-824-9142')
;

SELECT * FROM tbl_persons;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_id BETWEEN 3 AND 5;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE 'ke%';

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE '_u%s';


UPDATE tbl_persons SET persons_fname = 'mars' WHERE persons_fname = 'bob';

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname DESC;

SELECT persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone' FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname DESC;



DELETE FROM tbl_persons WHERE persons_lname = 'smith';

SELECT * FROM tbl_persons;



DROP TABLE tbl_persons;

SELECT * FROM tbl_persons;








/*Video3*/


CREATE TABLE tbl_order (
	order_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	order_type VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_care (
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	care_specialist INT NOT NULL
);
	

CREATE TABLE tbl_nutrition (
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY(2200,1),
	nutrition_type VARCHAR(50) NOT NULL,
	nutrition_cost MONEY NOT NULL
);


CREATE TABLE tbl_habitat (
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY(5000,1),
	habitat_type VARCHAR(50) NOT NULL,
	habitat_cost MONEY NOT NULL
);

CREATE TABLE tbl_specialist (
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lastname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL
);




INSERT INTO tbl_order
	(order_type)
	VALUES
	('carnivore'),
	('herbivore'),
	('omnivore')
;

SELECT * FROM tbl_order;



INSERT INTO tbl_care
	(care_id, care_type, care_specialist)
	VALUES
	('care_0', 'replace the straw', 1),
	('care_1', 'repair or replace broken toys', 4),
	('care_2', 'bottle feed vitamins', 1),
	('care_3', 'human contact_pet subject', 2),
	('care_4', 'clean up animal waste', 1),
	('care_5', 'move subject to exercise pen', 3),
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;

SELECT * FROM tbl_care;



INSERT INTO tbl_nutrition
	(nutrition_type, nutrition_cost)
	VALUES
	('raw fish',  1500),
	('living rodents', 600),
	('mixture of fruit and rive', 800),
	('warm bottle of milk', 600),
	('syringe feed broth', 600),
	('lard and seed mix', 300),
	('aphids', 150),
	('vitamins and marrow', 3500)
;

SELECT * FROM tbl_nutrition;



INSERT INTO tbl_habitat
	(habitat_type, habitat_cost)
	VALUES
	('tundra', 40000),
	('grassy gnll with trees', 12000),
	('10 ft pond and rocks', 30000),
	('icy aquarium with snowy facade', 50000),
	('short grass, shade, and moat', 50000),
	('netted froest atrium', 10000),
	('jungle vines and winding branches', 15000),
	('cliff with shaded cave', 15000)
;

SELECT * FROM tbl_habitat;



INSERT INTO tbl_specialist
	(specialist_fname, specialist_lastname, specialist_contact)
	VALUES
	('margret', 'nyguen', '584-334-2366'),
	('mary', 'fischer', '289-725-2956'),
	('arnold', 'holden', '802-234-7234'),
	('ken', 'byesan', '819-394-3423'),
	('delmonte', 'fyedo', '732-234-2340')
;

SELECT * FROM tbl_special




CREATE TABLE tbl_species (
	species_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	species_name VARCHAR(50) NOT NULL,
	species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO tbl_species
	(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	VALUES
	('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
	('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
	('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
	('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
	('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
	('panda', 1, 102, 3, 5001, 2202, 'care_4'),
	('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
	('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
;
SELECT * FROM tbl_species







/*Video4 - Joins*/


SELECT * FROM tbl_species WHERE species_name = 'chicken';


SELECT 
	a1.species_name, a2.animalia_type,
	a3.class_type, a4.order_type, a5.habitat_type,
	a6.nutrition_type, a7.care_type
	FROM tbl_species AS a1
	INNER JOIN tbl_animalia AS a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN tbl_class AS a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order AS a4 ON a4.order_id = a1.species_order
	INNER JOIN tbl_habitat AS a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition AS a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tbl_care AS a7 ON a7.care_id = a1.species_care
	/*WHERE species_name = 'brown bear'*/
;



SELECT 
	a1.species_name, a2.habitat_type, a2.habitat_cost,
	a3.nutrition_type, a3.nutrition_cost
	FROM tbl_species a1
	INNER JOIN tbl_habitat a2 ON a2.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
	WHERE species_name = 'ghost bat'
;






UPDATE  tbl_nutrition SET nutrition_type = 'syringe feed broth' WHERE nutrition_type LIKE 'sy%';
select * from tbl_nutrition;








/*Video 5*/



PRINT 'Hello World!'


DECLARE @myVariable INT
SET @myVariable = 6
PRINT @myVariable


DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5

PRINT CHAR(9) + 'I have ' + CONVERT(varchar(50),@var1) + CHAR(13) +  ' dollars...'



DECLARE @var3 INT, @var4 INT
SET @var3 = 3
SET @var4 = 5

PRINT 'Variable 3 = ' + CONVERT(varchar(50),@var3) + CHAR(13) + 'Variable 4 = ' + CONVERT(VARCHAR(50),@var4)



DECLARE @var5 INT, @var6 INT
SET @var5 = 7
SET @var6 = 5

PRINT 'Variable5 = ' + CONVERT(VARCHAR(5),@var5) + CHAR(13)
	+ 'Variable6 = ' + CONVERT(VARCHAR(5),@var6) + CHAR(13)


IF @var5 = @var6
	BEGIN
		PRINT 'Variable5 is ' + CONVERT(VARCHAR(5),@var6) + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable5 is not ' + CONVERT(VARCHAR(1),@var6) + CHAR(13)
	END





DECLARE @var7 INT, @var8 INT
SET @var7 = 2
SET @var8 = 5

PRINT 'Variable7 = ' + CONVERT(VARCHAR(5),@var7) + CHAR(13)
	+ 'Variable8 = ' + CONVERT(VARCHAR(5),@VAR8) + CHAR(13)

IF @var7 < 2
	BEGIN
		PRINT 'var7 is less than 2'
	END
ELSE IF @var7 > 1 AND @var7 < 3
	BEGIN
		PRINT 'Var7 is greater than 1 and less than 3'
	END
ELSE IF @var7 = 4 OR @var7 < 6
	BEGIN
		PRINT 'Var7 is equal to 4 or less than 6'
	END
ELSE
	PRINT 'Var7 does not qualify!'



















/* Video 6*/


USE db_zoo2
GO


CREATE PROC CreateZooDB
AS
BEGIN


	CREATE TABLE tbl_animalia (
		animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		animalia_type VARCHAR(50) NOT NULL
	);


	INSERT INTO tbl_animalia
		(animalia_type)
		VALUES
		('vertebrate'),
		('invertebrate')
	;


	CREATE TABLE tbl_class(
		class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		class_type VARCHAR(50) NOT NULL
	);

	INSERT INTO tbl_class
		(class_type)
		VALUES
		('bird'),
		('reptilian'),
		('mammal'),
		('arthropod'),
		('fish'),
		('worm'),
		('cnidaria'),
		('echinoderm')
	;



	CREATE TABLE tbl_order (
		order_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		order_type VARCHAR(50) NOT NULL
	);


	CREATE TABLE tbl_care (
		care_id VARCHAR(50) PRIMARY KEY NOT NULL,
		care_type VARCHAR(50) NOT NULL,
		care_specialist INT NOT NULL
	);
	

	CREATE TABLE tbl_nutrition ( 
		nutrition_id INT PRIMARY KEY NOT NULL IDENTITY(2200,1),
		nutrition_type VARCHAR(50) NOT NULL,
		nutrition_cost MONEY NOT NULL
	);


	CREATE TABLE tbl_habitat (
		habitat_id INT PRIMARY KEY NOT NULL IDENTITY(5000,1),
		habitat_type VARCHAR(50) NOT NULL,
		habitat_cost MONEY NOT NULL
	);

	CREATE TABLE tbl_specialist (
		specialist_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		specialist_fname VARCHAR(50) NOT NULL,
		specialist_lastname VARCHAR(50) NOT NULL,
		specialist_contact VARCHAR(50) NOT NULL
	);




	INSERT INTO tbl_order
		(order_type)
		VALUES
		('carnivore'),
		('herbivore'),
		('omnivore')
	;

	SELECT * FROM tbl_order;



	INSERT INTO tbl_care
		(care_id, care_type, care_specialist)
		VALUES
		('care_0', 'replace the straw', 1),
		('care_1', 'repair or replace broken toys', 4),
		('care_2', 'bottle feed vitamins', 1),
		('care_3', 'human contact_pet subject', 2),
		('care_4', 'clean up animal waste', 1),
		('care_5', 'move subject to exercise pen', 3),
		('care_6', 'drain and refill aquarium', 1),
		('care_7', 'extensive dental work', 3)
	;

	SELECT * FROM tbl_care;



	INSERT INTO tbl_nutrition
		(nutrition_type, nutrition_cost)
		VALUES
		('raw fish',  1500),
		('living rodents', 600),
		('mixture of fruit and rive', 800),
		('warm bottle of milk', 600),
		('syringe feed broth', 600),
		('lard and seed mix', 300),
		('aphids', 150),
		('vitamins and marrow', 3500)
	;

	SELECT * FROM tbl_nutrition;



	INSERT INTO tbl_habitat
		(habitat_type, habitat_cost)
		VALUES
		('tundra', 40000),
		('grassy gnll with trees', 12000),
		('10 ft pond and rocks', 30000),
		('icy aquarium with snowy facade', 50000),
		('short grass, shade, and moat', 50000),
		('netted froest atrium', 10000),
		('jungle vines and winding branches', 15000),
		('cliff with shaded cave', 15000)
	;

	SELECT * FROM tbl_habitat;



	INSERT INTO tbl_specialist
		(specialist_fname, specialist_lastname, specialist_contact)
		VALUES
		('margret', 'nyguen', '584-334-2366'),
		('mary', 'fischer', '289-725-2956'),
		('arnold', 'holden', '802-234-7234'),
		('ken', 'byesan', '819-394-3423'),
		('delmonte', 'fyedo', '732-234-2340')
	;

	SELECT * FROM tbl_specialist




	CREATE TABLE tbl_species (
		species_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		species_name VARCHAR(50) NOT NULL,
		species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
	);


	INSERT INTO tbl_species
		(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
		VALUES
		('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
		('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
		('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
		('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
		('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
		('panda', 1, 102, 3, 5001, 2202, 'care_4'),
		('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
		('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
	SELECT * FROM tbl_species


	SELECT * FROM tbl_species WHERE species_name = 'chicken';


	SELECT 
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		FROM tbl_species AS a1
		INNER JOIN tbl_animalia AS a2 ON a2.animalia_id = a1.species_animalia
		INNER JOIN tbl_class AS a3 ON a3.class_id = a1.species_class
		INNER JOIN tbl_order AS a4 ON a4.order_id = a1.species_order
		INNER JOIN tbl_habitat AS a5 ON a5.habitat_id = a1.species_habitat
		INNER JOIN tbl_nutrition AS a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN tbl_care AS a7 ON a7.care_id = a1.species_care
		WHERE species_name = 'brown bear'
	;



	SELECT 
		a1.species_name, a2.habitat_type, a2.habitat_cost,
		a3.nutrition_type, a3.nutrition_cost
		FROM tbl_species a1
		INNER JOIN tbl_habitat a2 ON a2.habitat_id = a1.species_habitat
		INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
		WHERE species_name = 'ghost bat'
	;
END










/* getAnimal_Info V1*/
USE db_zoo2
GO
CREATE PROC getAnimal_Info
 
 @animalName VARCHAR(50)
 AS
 BEGIN
	SELECT 
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		FROM tbl_species AS a1
		INNER JOIN tbl_animalia AS a2 ON a2.animalia_id = a1.species_animalia
		INNER JOIN tbl_class AS a3 ON a3.class_id = a1.species_class
		INNER JOIN tbl_order AS a4 ON a4.order_id = a1.species_order
		INNER JOIN tbl_habitat AS a5 ON a5.habitat_id = a1.species_habitat
		INNER JOIN tbl_nutrition AS a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN tbl_care AS a7 ON a7.care_id = a1.species_care
		WHERE species_name = @animalName
	;
END





/* getAnimal_Info V2*/
USE db_zoo2
GO
CREATE PROC getAnimal_Info2
	@animalName VARCHAR(50)
AS
BEGIN

	DECLARE @errorString VARCHAR(100)
	DECLARE @results VARCHAR(5)
	SET @errorString = 'There are no "' + @animalName + 's" found at the zoo.'

	BEGIN TRY
		SET @results = (SELECT COUNT(tbl_species.species_name) FROM tbl_species WHERE species_name = @animalName)
			IF @results = 0
				BEGIN
					/*raiserror not raise error*/
					RAISERROR(@errorString, 16, 1)
					RETURN
				END
			ELSE IF  @results = 1
				BEGIN
					SELECT 
					a1.species_name, a2.animalia_type, 
					a3.class_type, a4.order_type, a5.habitat_type,
					a6.nutrition_type, a7.care_type
					FROM tbl_species AS a1
					INNER JOIN tbl_animalia AS a2 ON a2.animalia_id = a1.species_animalia
					INNER JOIN tbl_class AS a3 ON a3.class_id = a1.species_class
					INNER JOIN tbl_order AS a4 ON a4.order_id = a1.species_order
					INNER JOIN tbl_habitat AS a5 ON a5.habitat_id = a1.species_habitat
					INNER JOIN tbl_nutrition AS a6 ON a6.nutrition_id = a1.species_nutrition
					INNER JOIN tbl_care AS a7 ON a7.care_id = a1.species_care
					WHERE species_name = @animalName
					;
				END
	END TRY
	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		/*raiserror not raise error*/
		RAISERROR (@errorString, 10, 1)
	END CATCH
END






/*Using a stored procedure*/
USE db_zoo2
GO
EXECUTE [dbo].[getAnimal_Info] 'jaguar'









USE db_zoo2
GO


/*	CONVERT(VARCHAR(50),@totalHub) = This is converting the data type from MONEY to STRING Characters
	char(9) = Line Break
	char(13) = Tab Key
*/
DECLARE @totalHab MONEY;
DECLARE @totalNut MONEY;
DECLARE @results MONEY;
SET @totalHab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
SET @results = (@totalHab + @totalNut)
PRINT (
	CONVERT(VARCHAR(50),@totalHab) + char(9) + ' - The Total Habitat Cost' + char(13) + '  ' +
	CONVERT(VARCHAR(50),@totalNut) + char(9) + ' - The Total Habitat Cost ' + char(13) + '--------- ' + char(13) +
	CONVERT(VARCHAR(50),@results)
);

















/*Drills*/




SELECT
	tbl_species.species_name AS 'Species Name:' 
	tbl_nutrition.nutrition_type AS 'Nutition Type:'
	FROM tbl_species
	INNER JOIN tbl_nutrition ON tbl_nutrition.nutrition_id = tbl_species.species_nutrition;



	SELECT * FROM tbl_species;

				SELECT 
					a1.species_name, a2.animalia_type, 
					a3.class_type, a4.order_type, a5.habitat_type,
					a6.nutrition_type, a7.care_type
					FROM tbl_species AS a1
					INNER JOIN tbl_animalia AS a2 ON a2.animalia_id = a1.species_animalia
					INNER JOIN tbl_class AS a3 ON a3.class_id = a1.species_class
					INNER JOIN tbl_order AS a4 ON a4.order_id = a1.species_order
					INNER JOIN tbl_habitat AS a5 ON a5.habitat_id = a1.species_habitat
					INNER JOIN tbl_nutrition AS a6 ON a6.nutrition_id = a1.species_nutrition
					INNER JOIN tbl_care AS a7 ON a7.care_id = a1.species_care;












/*From the specialist table, retrieve the first and last name and contact number of those that provide care for the penguins from the species table.*/


SELECT * FROM tbl_specialist;
SELECT * FROM tbl_care;
SELECT * FROM tbl_species;


USE db_zoo
Go

SELECT
	tbl_species.species_name AS 'Species Name:',
	tbl_nutrition.nutrition_type AS 'Nutition Type:'
	FROM tbl_species
	INNER JOIN tbl_nutrition ON tbl_nutrition.nutrition_id = tbl_species.species_nutrition;


USE db_zoo2


SELECT
	tbl_species.species_name,
	tbl_specialist.specialist_fname,
	tbl_specialist.specialist_lastname,
	tbl_specialist.specialist_contact
	FROM tbl_species
	right JOIN tbl_care ON tbl_species.species_care = tbl_care.care_id
	right JOIN tbl_specialist ON tbl_specialist.specialist_ID = tbl_care.care_specialist
	;
SELECT * FROM tbl_species;

	SELECT
	tbl_specialist.specialist_fname,
	tbl_specialist.specialist_lastname,
	tbl_specialist.specialist_contact
	FROM tbl_species
	INNER JOIN tbl_care ON tbl_species.species_care = tbl_care.care_id
	INNER JOIN tbl_specialist ON tbl_specialist.specialist_id = tbl_care.care_specialist
	WHERE tbl_species.species_name = 'penguin';









/*From the specialist table, retrieve the first and last name and contact number of those that provide care for the penguins from the species table.*/

create database db_zooTest2
use db_zooTest2
GO


CREATE TABLE tbl_specialist (
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lastname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_specialist
	(specialist_fname, specialist_lastname, specialist_contact)
	VALUES
	('margret', 'nyguen', '584-334-2366'),
	('mary', 'fischer', '289-725-2956'),
	('arnold', 'holden', '802-234-7234'),
	('ken', 'byesan', '819-394-3423'),
	('delmonte', 'fyedo', '732-234-2340')
;

CREATE TABLE tbl_care (
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	care_specialist INT NOT NULL
);

INSERT INTO tbl_care
	(care_id, care_type, care_specialist)
	VALUES
	('care_0', 'replace the straw', 1),
	('care_1', 'repair or replace broken toys', 4),
	('care_2', 'bottle feed vitamins', 1),
	('care_3', 'human contact_pet subject', 2),
	('care_4', 'clean up animal waste', 1),
	('care_5', 'move subject to exercise pen', 3),
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;

CREATE TABLE tbl_species (
	species_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	species_name VARCHAR(50) NOT NULL,
	species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_species
	(species_name, species_care)
	VALUES
	('brown bear', 'care_1'),
	('jaguar', 'care_4'),
	('penguin', 'care_6'),
	('ghost bat', 'care_2'),
	('chicken', 'care_0'),
	('panda', 'care_4'),
	('bobcat', 'care_5'),
	('grey wolf', 'care_4')
;

	SELECT
	tbl_specialist.specialist_fname,
	tbl_specialist.specialist_lastname,
	tbl_specialist.specialist_contact
	FROM tbl_species
	INNER JOIN tbl_care ON tbl_species.species_care = tbl_care.care_id
	INNER JOIN tbl_specialist ON tbl_specialist.specialist_id = tbl_care.care_specialist
	WHERE tbl_species.species_name = 'penguin';


	SELECT
	tbl_specialist.specialist_fname,
	tbl_specialist.specialist_lastname,
	tbl_specialist.specialist_contact
	FROM tbl_specialist
	INNER JOIN tbl_care ON tbl_care.care_specialist = tbl_specialist.specialist_id
	INNER JOIN tbl_species ON tbl_species.species_care = tbl_care.care_id
	WHERE tbl_species.species_name = 'penguin';






/*➤ Create a database with two tables. Assign a foreign key constraint on one table that shares related data with the
primary key on the second table. Finally, create a statement that queries data from both tables.*/


CREATE DATABASE db_artists
Go
USE db_artists
Go

CREATE TABLE tbl_name (
	name_id	INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	name_fname VARCHAR(50) NOT NULL,
	name_lname VARCHAR(50) NOT NULL
);

INSERT INTO tbl_name
	(name_fname, name_lname)
	VALUES
	('Art', 'Garfunkel'),
	('Paul', 'Simon')
;

CREATE TABLE tbl_contact (
	contact_id	INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	contact_number VARCHAR(50) NOT NULL,
	contact_name INT NOT NULL CONSTRAINT fk_name_id FOREIGN KEY REFERENCES tbl_name(name_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT INTO tbl_contact
	(contact_number, contact_name)
	VALUES
	('324-952-9234', 1),
	('482-293-9923', 2)
;

SELECT 
	tbl_name.name_fname, tbl_name.name_lname, tbl_contact.contact_number
	FROM tbl_contact
	INNER JOIN tbl_name ON tbl_name.name_id = tbl_contact.contact_name
;