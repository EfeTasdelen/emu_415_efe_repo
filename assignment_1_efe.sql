-- STEP #1 - Create Database.
CREATE DATABASE EMU415_SSEU DEFAULT CHARACTER SET utf8; 

USE EMU415_SSEU;

-- STEP #2 - Create the table called "team_members".
CREATE TABLE team_members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,  -- member_id artık primary key ve auto_increment
    first_name VARCHAR(128) NOT NULL,         
    last_name VARCHAR(128) NOT NULL,          
    student_id VARCHAR(128) NOT NULL,         
    email VARCHAR(128) NOT NULL,              
    nationality VARCHAR(128) NOT NULL,        
    advisor_name VARCHAR(128) NOT NULL,      
    birthdate DATE NOT NULL,                  
    join_year INT NOT NULL,                   
    biography TEXT NOT NULL,                           
    website_url VARCHAR(255) NOT NULL                 
); 

-- STEP #3 - Insert team member's data to the table.

INSERT INTO team_members (
    first_name,  -- member_id artık otomatik olarak atanacak
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
    'Mustafa Umut',
    'Tayar',
    '2200469007',
    'umuttayar@hacettepe.edu.tr',
    'Turkish',
    'Kağan Gökbayrak',
    '2002-04-13',
    2020,
    'Mustafa Umut Tayar was born in Trabzon and is the elder of two siblings. He is a final-year Industrial Engineering student at Hacettepe University and currently works at MKE.',
    'https://www.linkedin.com/in/mustafa-umut-tayar-aa9a23275/'
);

INSERT INTO team_members (
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
    'Süleyman',
    'Çelik',
    '2200469040',
    'suleymancelikk064@gmail.com',
    'Turkish',
    'Kağan Gökbayrak',
    '2002-07-17',
    2020,
    'Süleyman ÇELİK was born in Denizli. He is a final-year Industrial Engineering student at Hacettepe University and currently works at Petlas.',
    'https://www.linkedin.com/in/süleyman-çelik-989009225/'
);

INSERT INTO team_members (
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
    'Necati Berkay',
    'Vural',
    '2210469064',
    'berkayvural@hacettepe.edu.tr',
    'Turkish',
    'Banu Yüksel Özkaya',
    '2001-10-19',
    2021,
    'Necati Berkay Vural is a senior Industrial Engineering student at Hacettepe University. He has an interest in 3D modeling and animation. He aims to enhance his skills in data analysis and optimization. He is particularly interested in the automotive industry and plans his career accordingly.',
    'https://www.linkedin.com/in/necati-berkay-vural-979839229/'
);

-- STEP 4 - Add Columns for Expected Graduation Year and Age Column.

-- Add Field "study_duration"
ALTER TABLE team_members
ADD COLUMN study_duration INT;
-- Calculate Values for every member by subtracting the starting year to program from the current year. 
UPDATE team_members
SET study_duration = YEAR(CURDATE()) - join_year
WHERE member_id > 0;

-- Add field "graduation_year"
ALTER TABLE team_members
ADD COLUMN graduation_year INT;
-- Calculate the values for every member by assuming a standard study duration of five years.
UPDATE team_members
SET graduation_year = join_year + 5
WHERE member_id > 0;

-- Add field "years_remaining"
ALTER TABLE team_members
ADD COLUMN years_remaining INT;
-- Calculate the values of expected years left to graduation for every member substracting the current year from graduation_year values. 
UPDATE team_members
SET years_remaining = graduation_year - YEAR(CURDATE())
WHERE member_id > 0;

-- STEP #5 - Perform SQL Queries for Team Statistics.

-- a) Find the total number of team members.
SELECT COUNT(member_id)
FROM team_members;

-- b) Retrieve a list of students sorted by join year, from the most recent to the earliest. 
SELECT * FROM team_members ORDER BY join_year;

-- c) Find the earliest and latest expected completion years among team members.

-- Earliest expected completion year among the members :
SELECT MIN(graduation_year)
FROM team_members;

-- Latest expected completion year among the members :
SELECT MAX(graduation_year)
FROM team_members;

-- d) List team members by age from oldest to youngest.
SELECT * FROM team_members ORDER BY  birthdate DESC;

-- e)  Analyze the distribution of team members across different joining years.
SELECT join_year , 
	COUNT(*) AS num_of_members
FROM team_members
GROUP BY join_year;

-- STEP #6 - Hash Identifier Generation
SELECT
(SELECT COUNT(member_id) FROM  team_members) AS total_members,
(SELECT MAX( graduation_year) FROM team_members) AS latest_expected_graduation_year,
(SELECT MIN(TIMESTAMPDIFF(YEAR,birthdate,CURDATE())) FROM team_members) AS youngest_members_age
;

SELECT SHA1(
	CONCAT(
		(SELECT COUNT(member_id) FROM  team_members), '-',
        (SELECT MAX( graduation_year) FROM team_members), '-',
        (SELECT MIN(TIMESTAMPDIFF(YEAR,birthdate,CURDATE())) FROM team_members)
        )
        ) AS team_statistics_hash;

-- Veritabanını ve tabloyu kontrol etme
SHOW DATABASES;
SELECT * FROM team_members;
