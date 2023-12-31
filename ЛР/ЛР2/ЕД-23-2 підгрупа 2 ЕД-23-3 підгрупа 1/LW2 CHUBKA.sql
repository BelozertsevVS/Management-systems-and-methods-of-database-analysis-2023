USE [WebStor];

GO
CREATE SCHEMA CHUBKAVA; 
GO

CREATE TABLE CHUBKAVA.DATATYPES (

ID BIGINT,

AGE TINYINT

);

INSERT INTO CHUBKAVA.DATATYPES(ID, AGE)

VALUES(10000, 34);

INSERT INTO CHUBKAVA.DATATYPES(ID, AGE)

VALUES(10001, 32);

-- Implicit data type conversion

INSERT INTO CHUBKAVA.DATATYPES(ID, AGE)

VALUES('10002', 32);

-- Implicit data type conversion

INSERT INTO CHUBKAVA.DATATYPES(ID, AGE)

VALUES('10003', '35');

-- Implicit data type conversion

INSERT INTO CHUBKAVA.DATATYPES(ID, AGE)

VALUES('19700101', '35');

-- Implicit data type conversion IS NOT WORKING!

INSERT INTO CHUBKAVA.DATATYPES(ID, AGE)

VALUES('19700102', '35');

SELECT *
FROM CHUBKAVA.DATATYPES;
