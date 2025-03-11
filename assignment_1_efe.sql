-- Create Database.
CREATE DATABASE EMU415_SSEU DEFAULT CHARACTER SET utf8; 

-- Use the database that we created for further operations.
USE EMU415_SSEU;

-- Create the table called "team_members".
CREATE TABLE team_members (
	member_id INT ,
    first_name VARCHAR(128) ,
    last_name VARCHAR(128) ,
    student_id VARCHAR(128) , 
    email VARCHAR(128),
    nationality VARCHAR(128) ,
    advisor_name VARCHAR(128) ,
    birthdate DATE ,
    join_year INT ,
    biography TEXT ,
    website_url VARCHAR(255)
    ); 

-- Insert team member's data to the table.

INSERT INTO team_members (
	member_id,
	first_name,
    last_name,
    student_id,
    email,
    nationality,
    advisor_name,
    birthdate,
    join_year,
    biography,
    website_url
) VALUES (
	1,
    'Efe',
    'Taşdelen',
    '2210469051',
    'efetasdelen@hacettepe.edu.tr',
    'Turkish',
    'Banu Yüksel Özkaya',
    '2003-09-12',
    2021,
    'Efe Taşdelen is a 4th-year Industrial Engineering student at Hacettepe University. A graduate of Büyük Fen Lisesi (Science High School), Efe has a strong interest in data analysis. Having recently started his journey in data analysis by learning Python and SQL, Efe is working on various projects to improve his skills in this field. In his free time, Efe enjoys playing football and traveling. He is known for his teamwork skills and analytical thinking abilities.',
    'https://www.linkedin.com/in/efe-taşdelen-a41273219/'
    );
    
INSERT INTO team_members (
	member_id,
	first_name,
    last_name,
    student_id,
    email,
    nationality,
    advisor_name,
    birthdate,
    join_year,
    biography,
    website_url
) VALUES (
	2,
    'Abdullah Safa',
    'Yaşar',
    '2210469086',
    'abdullahsafayasarasy@gmail.com',
    'Turkish',
    'Kağan Gökbayrak',
    '2002-06-03',
    2021,
    'Abdullah Safa Yaşar was born in Trabzon and is the youngest of three siblings. He is a final-year Industrial Engineering student at Hacettepe University and currently works at Havelsan.',
    'https://www.linkedin.com/in/abdullahsafayaşar/'
    );

INSERT INTO team_members (
	member_id,
	first_name,
    last_name,
    student_id,
    email,
    nationality,
    advisor_name,
    birthdate,
    join_year,
    biography,
    website_url
) VALUES (
	3,
    'Mustafa Umut',
    'Tayar',
    '2200469007',
    'umuttayar@hacettepe.edu.tr',
    'Turkish',
    'Kağan Gökbayrak',
    '2002-04-13',
    '2020',
    'Mustafa Umut Tayar was born in Trabzon and is the elder of two siblings. He is a final-year Industrial Engineering student at Hacettepe University and currently works at MKE.',
    'https://www.linkedin.com/in/mustafa-umut-tayar-aa9a23275/'
    );

INSERT INTO team_members (
	member_id,
	first_name,
    last_name,
    student_id,
    email,
    nationality,
    advisor_name,
    birthdate,
    join_year,
    biography,
    website_url
) VALUES (
	4,
    'Süleyman',
    'Çelik',
    '2200469040',
    'suleymancelikk064@gmail.com',
    'Turkish',
    'Kağan Gökbayrak',
    '2002-07-17',
    '2020',
    'Süleyman ÇELİK was born in Denizli. He is a final-year Industrial Engineering student at Hacettepe University and currently works at Petlas.',
    'https://www.linkedin.com/in/süleyman-çelik-989009225/'
    );

    

SHOW DATABASES;
SELECT * FROM team_members;

    


    