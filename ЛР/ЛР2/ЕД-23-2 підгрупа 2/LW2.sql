USE WebStor;





INSERT INTO SNIHURSKA.DATATYPES(ID, AGE)
VALUES(10000, 34);

INSERT INTO SNIHURSKA.DATATYPES(ID, AGE)
VALUES(10001, 32);

-- Implicit data type conversion
INSERT INTO SNIHURSKA.DATATYPES(ID, AGE)
VALUES('10002', 32);

-- Implicit data type conversion
INSERT INTO SNIHURSKA.DATATYPES(ID, AGE)
VALUES('10003', '35');

-- Implicit data type conversion
INSERT INTO SNIHURSKA.DATATYPES(ID, AGE)
VALUES('19700101', '35');

-- Implicit data type conversion IS NOT WORKING!
INSERT INTO SNIHURSKA.DATATYPES(ID, AGE)
VALUES('19700101', '35');

SELECT * 
  FROM SNIHURSKA.DATATYPES;