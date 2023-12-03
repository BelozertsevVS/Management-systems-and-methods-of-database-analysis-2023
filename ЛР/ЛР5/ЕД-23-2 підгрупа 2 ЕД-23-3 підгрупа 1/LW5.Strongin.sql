--Block 1

CREATE DATABASE UniversityDB;
Go
USE UniversityDB;

CREATE TABLE Departments (

DepartmentID INT NOT NULL,

DepartmentName VARCHAR(100)

);

CREATE TABLE Professors (

ProfessorID INT NOT NULL,

FirstName VARCHAR(50),

LastName VARCHAR(50),

Age TINYINT,

DepartmentID INT,

Email VARCHAR(100)

);

ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);

ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);

ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);

ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age > = 20);

ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;

ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;

INSERT INTO Departments (DepartmentID) VALUES (1); -- ����������� DEFAULT �������� 'General'

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email)

VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

--INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email)

--VALUES (2, 'Jane', 'Doe', 1, 35, 'john.smith@university.com'); -- �� ������� ������� ����� UNIQUE ���������

--INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Email)

--VALUES (3, 'Bob', 'Doe', 1, 17, 'bob@university.com'); -- �� ������� ������� ����� CHECK ��������

DROP TABLE Professors;

DROP TABLE Departments;
USE master;
DROP DATABASE UniversityDB;

--Block 2

CREATE DATABASE CompanyDB;
GO
USE CompanyDB;

CREATE TABLE Employees (

EmployeeID INT PRIMARY KEY,

FirstName VARCHAR(50) NOT NULL,

LastName VARCHAR(50) NOT NULL,

Email VARCHAR(100) UNIQUE,

Position VARCHAR(50) DEFAULT 'Junior Developer'

);

CREATE TABLE Departments (

DepartmentID INT PRIMARY KEY,

DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''),

Budget DECIMAL(10, 2) CHECK (Budget > 0),

DefaultRoomNumber INT DEFAULT 101

);

CREATE TABLE Assignments (

AssignmentID INT PRIMARY KEY,

EmployeeID INT NOT NULL,

DepartmentID INT NOT NULL,

AssignmentDate DATE DEFAULT GETDATE(),

FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),

FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)

);

INSERT INTO Departments (DepartmentID, DepartmentName, Budget)

VALUES (1, 'Human Resources', 50000);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email)

VALUES (1, 'John', 'Smith', 'john.smith@company.com');

INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)

VALUES (1, 1, 1);

--INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID)

--VALUES (2, 999, 1); -- �� ������� ������� ����� FOREIGN KEY ���������

DROP TABLE Assignments;

DROP TABLE Employees;

DROP TABLE Departments;

USE master

DROP DATABASE CompanyDB;


/*
1. �� ���� ��������� PRIMARY KEY � �� �� ������ ����� ���� ���������?

��������� ���� - �� �������� ���� (��� ����� ����) � ������� ���� �����, ��� ���������� ����� �����/�����. ���� ������� ���� ������ � ����, ��� ����������� ���������� �� ������������� ������ � �������. ������ �����, �� ���� ���������: ���������� (����� �������� �� ������������ � ����� ���) �� ��������� (�� ������� �������� NULL).

2. �� �������� ��������� PRIMARY KEY? ������� ������� ���� T-SQL.

� T-SQL ����� �������� ��������� ����, �������� ����� �������� ��� PRIMARY KEY:

CREATE TABLE Table (
    Column_1 INT,
    Column_2 INT,
    CONSTRAINT PK_Table PRIMARY KEY (Column_1, Column_2)
);

3. �������, �� ���� FOREIGN KEY �� �� �� ��������� �������� ����� �� ���������.

FOREIGN KEY - �� ���� ��� ����� ����, ��� ���������� �� PRIMARY KEY ���� �������.
³� ��������� �������� �����, ��������� �������� � ��� ���������� ����� ����� ���� ����������,
�� ��� ������� � ���������� ��� PRIMARY KEY � ��'����� �������.

4. �� ���������, ���� �� �������� �������� ��� � �������, �� ��������� FOREIGN KEY ���������?

���� �������� ��� ��������� FOREIGN KEY ���������, �� �������� ������� ���� ��������,
������� �������� �������� �� ���� � ��'����� �������.

5. �������, ��� ���� ��������������� UNIQUE ��������� � ��� ���� ����������� �� PRIMARY KEY.

UNIQUE ��������� ������� ���������� ������� � ��� �� ���� ����, ��� ���� ������ ������ �������� NULL.
PRIMARY KEY ����� ������� ����������, ��� �� ������� �������� NULL.

6. ������� ������� ���� T-SQL, ���� ���� ��������� CHECK �� ������� �������.

ALTER TABLE Persons
ADD CONSTRAINT CHK_Age CHECK (Age >= 18);

7. �� ����� ��������������� DEFAULT ��������� ��� �������� ���� �������? ����� �������.

��� �������� ���� ������� �� ������ ��������������� DEFAULT ��� ������������ �������� �� ������������� ��� ������� �������:

CREATE TABLE Table (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT DEFAULT 18
);

8. ��� ��������� �� � �����������, ��� �����������, �� ������� `Email` � ������� `Customers` ������ ������ �������� ��������?

J�������� UNIQUE

9. �� 䳿 �� ������ ��������, ���� ������� ������ ��� �������� ���������, ��� ��� ���� ����������� �� �������?

��� ���� ��� ��������� ���������, ��� ����������� �� �������, ����� ��������������� ������� ALTER TABLE ��� ����
��� DROP CONSTRAINT ��� ���������.

10. ���� ������� ������������� ��������� �������� ����� � ��� �����?

��������� �������� ����� ����������� ����������� ����������� �� ������� ���� �����, �������� ����������� �����,
���������� ���������� ������ �� ������������ ��������������.

11. ��� ����������� ��������� NOT NULL �� ��������� CHECK?

NOT NULL �������, �� �������� � ��� �� ���� ���� NULL.
CHECK �������� ���������� �����, ��� ������� ���� �������� ��� �������� � ���.

12. �� ����� ������������ ��������� DEFAULT ��� ������� �������? ������� ������� T-SQL �������.

ALTER TABLE Persons
ALTER COLUMN Age SET DEFAULT 21;

13. �� ���� ������� �������� � �������� FOREIGN KEY �������� � �� �������� ������ ���� �������?

������� �������� (CASCADE) �������� ��� ����� �������� ���� 䳿 ����������� ��� ��� ��� �������� ������,
�� ���� ���������� ������� ����. �� ���� �������� �������� ��������� (CASCADE DELETE) ��� �������� ��������� 
(CASCADE UPDATE), �� �������� ����������� ���������� ��� �������� ������ ������ � ����� ��������.
*/