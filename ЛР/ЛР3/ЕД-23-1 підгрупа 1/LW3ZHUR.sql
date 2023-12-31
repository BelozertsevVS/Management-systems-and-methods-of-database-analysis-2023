﻿--Створення бази даних "STUDENTS":
   CREATE DATABASE STUDENTS;
      Перейдіть до бази даних "STUDENTS":
      USE STUDENTS;
 --Перейдіть до бази даних "STUDENTS":
      USE STUDENTS;
	  
	  
-- Створення таблиці "PersonalInfo"
CREATE TABLE PersonalInfo ( 

        StudentID INT PRIMARY KEY, 

        FirstName NVARCHAR(50), 

        LastName NVARCHAR(50), 

        DateOfBirth DATE 

    ); 
-- Створення таблиці "AcademicInfo"
  CREATE TABLE AcademicInfo ( 

        RecordID INT PRIMARY KEY, 

        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID), 

        Faculty NVARCHAR(100), 

        Curator NVARCHAR(100), 

        EnrollmentYear INT 

    ); 
-- Створення таблиці "ContactInfo"
CREATE TABLE ContactInfo ( 

        ContactID INT PRIMARY KEY, 

        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID), 

        Email NVARCHAR(100), 

        PhoneNumber NVARCHAR(15) 

    ); 
/*
Операції зі структурою таблиці "ContactInfo": 
a. Додаємо стовбець "Address"
b. Видаляємо стовбець "PhoneNumber"
c. Змінюємо ім'я стовбця "Email" на "EmailAddress"
*/
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';
-- Змінюємо тип даних для стовбця "Faculty" у таблиці "AcademicInfo" на NVARCHAR(150)
ALTER TABLE AcademicInfo 
ALTER COLUMN Faculty NVARCHAR(150);
-- Додаємо нову таблицю "Extracurricular"
CREATE TABLE Extracurricular ( 

ActivityID INT PRIMARY KEY, 

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID), 

ActivityName NVARCHAR(100), 

JoinDate DATE 

    ); 
-- Видаляємо таблицю
DROP TABLE Extracurricular;
-- Створюємо базу даних TEACHER
CREATE DATABASE TEACHER;
USE TEACHER;
-- Видаляємо базу даних TEACHER
DROP DATABASE TEACHER;
-- Переходимо до бази даних STUDENTS
USE STUDENTS; 
-- Додаємо три рядки даних до таблиці "PersonalInfo"
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth) 

VALUES  

    (1, 'Олександр', 'Петров', '2000-05-15'), 

    (2, 'Марія', 'Іваненко', '2001-03-22'), 

    (3, 'Василь', 'Коваленко', '1999-10-10');