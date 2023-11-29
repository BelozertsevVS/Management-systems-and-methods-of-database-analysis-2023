USE [WebStor];


GO

CREATE SCHEMA STRONGIN; -- ���� �������

GO


-- Create a simple table to demonstrate data types

CREATE TABLE STRONGIN.DATATYPES (

ID BIGINT, -- Unique identifier of an entity

AGE TINYINT -- Number of years

);

INSERT INTO STRONGIN.DATATYPES(ID, AGE)

VALUES(10000, 34);

INSERT INTO STRONGIN.DATATYPES(ID, AGE)

VALUES(10001, 32);

-- Implicit data type conversion

INSERT INTO STRONGIN.DATATYPES(ID, AGE)

VALUES('10002', 32);

-- Implicit data type conversion

INSERT INTO STRONGIN.DATATYPES(ID, AGE)

VALUES('10003', '35');

-- Implicit data type conversion

INSERT INTO STRONGIN.DATATYPES(ID, AGE)

VALUES('19700101', '35');

-- Implicit data type conversion IS NOT WORKING!

INSERT INTO STRONGIN.DATATYPES(ID, AGE)

VALUES('1970-01-01', '35');


-- Let's take a look on the data

SELECT *

FROM STRONGIN.DATATYPES;