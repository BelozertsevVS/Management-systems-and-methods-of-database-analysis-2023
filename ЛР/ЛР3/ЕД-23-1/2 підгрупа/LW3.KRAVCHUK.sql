/*
 Створення бази даних "STUDENTS":
 */
  CREATE DATABASE STUDENTS; 
  /*
  Переходимо до бази даних "STUDENTS"
  */
  USE STUDENTS;

  
  
  
  /*
    a. Створюємо таблицю "PersonalInfo":
 */
 CREATE TABLE PersonalInfo ( 

        StudentID INT PRIMARY KEY, 

        FirstName NVARCHAR(50), 

        LastName NVARCHAR(50), 

        DateOfBirth DATE
	); 


	/*
	b. Створюємо таблицю "AcademicInfo": 
	*/
	   CREATE TABLE AcademicInfo ( 

        RecordID INT PRIMARY KEY, 

        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID), 

        Faculty NVARCHAR(100), 

        Curator NVARCHAR(100), 

        EnrollmentYear INT 

    );


	/*
    c. Створюємо таблицю "ContactInfo": 
	*/
	CREATE TABLE ContactInfo ( 

        ContactID INT PRIMARY KEY, 

        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID), 

        Email NVARCHAR(100), 

        PhoneNumber NVARCHAR(15) 

    ); 


	/*
	3. Операції зі структурою таблиці "ContactInfo": 
    a. Додаємо стовбець "Address": 
	*/
	 ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

	 /*
	  b. Видаляємо стовбець "PhoneNumber":
	 */
	  ALTER TABLE ContactInfo DROP COLUMN PhoneNumber; 

	  /*
	   c. Змінюємо ім'я стовбця "Email" на "EmailAddress": 
	  */
	   EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN'; 


	   /*
	   4. Змінюємо типу даних стовбця: 
	   Змінюємо тип даних для стовбця "Faculty" у таблиці "AcademicInfo" на NVARCHAR(150): 
	   */
	   ALTER TABLE AcademicInfo 

       ALTER COLUMN Faculty NVARCHAR(150); 


	   /*
	   5. Додаємо нову таблицю "Extracurricular":
	   */
	    CREATE TABLE Extracurricular ( 

        ActivityID INT PRIMARY KEY, 

        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID), 

        ActivityName NVARCHAR(100), 

        JoinDate DATE 

    ); 

	/*
	 Після перевірки того, що таблиця була створена правильно, видаляємо її: 
	*/
	 DROP TABLE Extracurricular; 



	 /*
	 6. Створення бази даних "TEACHER": 
	 */
	  CREATE DATABASE TEACHER; 

	  /*
	  Після перевірки видаляємо базу даних: 
	  */
	   DROP DATABASE TEACHER;



