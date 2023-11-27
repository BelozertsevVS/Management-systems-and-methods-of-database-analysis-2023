USE [LAB2];--����������� ���� ����� LAB2

GO

CREATE SCHEMA TELIK;

GO

CREATE TABLE TELIK.DATATYPES ( --�������� �������
       ID  BIGINT, -- Unique identifier of an entity
	   AGE TINYINT -- Number of years
);

-- ���������� ������� ������
INSERT INTO TELIK.DATATYPES(ID, AGE)
VALUES(10000, 34);

INSERT INTO TELIK.DATATYPES(ID, AGE)
VALUES(10001, 32);

-- Implicit data type conversion
INSERT INTO TELIK.DATATYPES(ID, AGE)
VALUES(10002, 32);

-- Implicit data type conversion
INSERT INTO TELIK.DATATYPES(ID, AGE)
VALUES(10003, 35);

-- Implicit data type conversion
INSERT INTO TELIK.DATATYPES(ID, AGE)
VALUES(1970, 35);

-- Implicit data type conversion IS NOT WORKING!
INSERT INTO TELIK.DATATYPES(ID, AGE)
VALUES(1970-01-01, 35);

SELECT *

FROM TELIK.DATATYPES;