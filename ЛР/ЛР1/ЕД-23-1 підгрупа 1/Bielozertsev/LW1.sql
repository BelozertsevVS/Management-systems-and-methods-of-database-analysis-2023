﻿INSERT INTO BOJKO.DATATYPES(ID, AGE)
VALUES(10000, 34);

INSERT INTO BOJKO.DATATYPES(ID, AGE)
VALUES(10001, 32);

-- Implicit data type conversion
INSERT INTO BOJKO.DATATYPES(ID, AGE)
VALUES('10002', 32);

-- Implicit data type conversion
INSERT INTO BOJKO.DATATYPES(ID, AGE)
VALUES('10003', '35');

-- Implicit data type conversion
INSERT INTO BOJKO.DATATYPES(ID, AGE)
VALUES('19700101', '35');

-- Implicit data type conversion IS NOT WORKING!
INSERT INTO BOJKO.DATATYPES(ID, AGE)
VALUES('1970-01-01', '35');
