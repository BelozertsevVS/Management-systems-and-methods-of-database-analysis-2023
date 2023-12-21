CREATE DATABASE STUDENTS; -- ��������� ���� ����� "STUDENTS"
GO

USE STUDENTS; -- ������� �� ���� ����� "STUDENTS"
GO

--�������� ������� "PersonalInfo"
CREATE TABLE PersonalInfo (

StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        DateOfBirth DATE
);
GO

--�������� ������� "AcademicInfo"
CREATE TABLE AcademicInfo (

RecordID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Faculty NVARCHAR(100),
        Curator NVARCHAR(100),
        EnrollmentYear INT
    );
GO

--�������� ������� "ContactInfo"
CREATE TABLE ContactInfo (

        ContactID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Email NVARCHAR(100),
        PhoneNumber NVARCHAR(15)
    );
GO

--�������� � ���������� ������� "ContactInfo"

--������ �������� "Address"

 ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
 GO

 --�������� �������� "PhoneNamber"

 ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;
 GO

 --������ ����� ������� "Email" �� "EmailAddress"

 EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';
 GO

--������� ���� ����� �������

--������ ��� ����� ��� ������� "Faculty" � ������� "AcademicInfo" �� NVARCHAR(150)

 ALTER TABLE AcademicInfo ALTER COLUMN Faculty NVARCHAR(150);
 GO

 --������ ���� ������� "Extracurricular"

 CREATE TABLE Extracurricular (
        ActivityID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        ActivityName NVARCHAR(100),
        JoinDate DATE
    );
GO

-- ϳ��� �������� ����, �� ������� ���� �������� ���������, �������� ��

 DROP TABLE Extracurricular;
 GO

 --�������� ���� ����� "Teacher"

 CREATE DATABASE Teacher
 GO

 --ϳ��� �������� �������� ���� ����� "Teacher"

 DROP DATABASE Teacher
 GO

 --������������ �� ������� ���� �����

 USE STUDENTS
 GO

 --������ ��� ����� ����� �� ������� "PersonalInfo"

 INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, '���������', '������', '2000-05-15'),
    (2, '����', '��������', '2001-03-22'),
    (3, '������', '���������', '1999-10-10');
 GO