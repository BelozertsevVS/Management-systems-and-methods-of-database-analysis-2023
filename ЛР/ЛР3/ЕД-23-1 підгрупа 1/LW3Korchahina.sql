﻿/* 
Створюємо базу даних
*/

CREATE DATABASE STUDENTSS;

USE STUDENTSS;

/* 
Створюємо таблицю PersonalInfo
*/

CREATE TABLE PersonalInfo (
 StudentID INT PRIMARY KEY,
 FirstName NVARCHAR(50),
 LastName NVARCHAR(50),
 DateOfBirth DATE
 );

 CREATE TABLE AcademicInfo (
 RecordID INT PRIMARY KEY,
 StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
 Faculty NVARCHAR(100),
 Curator NVARCHAR(100),
 EnrollmentYear INT
 );

 CREATE TABLE ContactInfo (
 ContactID INT PRIMARY KEY,
 StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
 Email NVARCHAR(100),
 PhoneNumber NVARCHAR(15)
 );

 
/* 
Змінюємо таблицю ContactInfo
*/

ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

 ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

 EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';


 /* 
Змінюємо тип даних стовбця
*/

ALTER TABLE AcademicInfo
 ALTER COLUMN Faculty NVARCHAR(150);


 /* 
Додаємо таблицю 
*/


 CREATE TABLE Extracurricular (
 ActivityID INT PRIMARY KEY,
 StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
 ActivityName NVARCHAR(100),
 JoinDate DATE
 );


 /* 
Видаляємо таблицю 
*/

DROP TABLE Extracurricular;



/* 
Створюємо базу даних
*/

CREATE DATABASE TEACHER;

 DROP DATABASE TEACHER;

 /* 
 Переключаемось на іншу базу даних
*/

 USE STUDENTSS;

 INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES
 (1, 'Олександр', 'Петров', '2000-05-15'),
 (2, 'Марія', 'Іваненко', '2001-03-22'),
 (3, 'Василь', 'Коваленко', '1999-10-10');