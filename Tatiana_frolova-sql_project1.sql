CREATE SCHEMA hospital1;
USE hospital1;

CREATE TABLE Diagnosis(
Diagnosis_id INT auto_increment PRIMARY KEY,
Diagnosis_name VARCHAR(50));

CREATE TABLE Patient_status(
Hospital_status_id INT auto_increment PRIMARY KEY,
Admission DATETIME NOT NULL,
Discharge DATETIME NOT NULL,
Diagnosis_id INT,
Restrictions VARCHAR(3) DEFAULT 'No',
CONSTRAINT Diagnosis_id_FK 
FOREIGN KEY (Diagnosis_id) REFERENCES Diagnosis(Diagnosis_id) On DELETE SET NULL);

-- DROP TABLE Patient_status;

CREATE TABLE Balance(
Balance_id INT auto_increment PRIMARY KEY,
Total_bill DECIMAL(10, 2),
Current_bill DECIMAL(7, 2),
Bill_status ENUM('Unpaid', 'Pending', 'Paid'));

-- DROP TABLE Balance;

CREATE TABLE Patient_Primary_Contact(
Primary_contact_id INT auto_increment PRIMARY KEY,
First_name VARCHAR(25),
Last_name VARCHAR(25),
Email_address VARCHAR(100),
Phone_number INT NOT NULL,
Relation_to_patient VARCHAR(20),
Hipaa ENUM('Yes', 'No')); 

-- DROP TABLE Patient_Primary_Contact;

CREATE TABLE Nurse(
Nurse_id INT auto_increment PRIMARY KEY,
First_name VARCHAR(25) NOT NULL,
Last_name VARCHAR(25) NOT NULL,
License_number INT,
Address VARCHAR(50),
City VARCHAR(25),
State VARCHAR(2) DEFAULT 'OH',
Zip_code INT,
Phone_number INT NOT NULL,
Email_address VARCHAR(50));

-- DROP TABLE Nurse;

CREATE TABLE Physician(
Physician_id INT auto_increment PRIMARY KEY,
First_name VARCHAR(25) NOT NULL,
Last_name VARCHAR(25) NOT NULL,
Category VARCHAR(25),
License_number INT, 
Address VARCHAR(50),
City VARCHAR(25),
State VARCHAR(2) DEFAULT 'OH',
Zip_code INT,
Phone_number INT NOT NULL,
Email_address VARCHAR(50));

-- DROP TABLE Physician;

CREATE TABLE Insurance(
Insurance_id INT auto_increment PRIMARY KEY,
Insurance_name VARCHAR(25) NOT NULL,
Insurance_holder_first_name VARCHAR(25) NOT NULL, 
Insurance_holder_last_name VARCHAR(25) NOT NULL,
Group_number INT,
Group_name VARCHAR(50),
Start_date DATE,
End_date DATE);

-- DROP TABLE Insurance;

CREATE TABLE Patient(
Patient_id INT auto_increment PRIMARY KEY,
First_name VARCHAR(25) NOT NULL,
Last_name VARCHAR(25) NOT NULL,
Birthdate DATE,
Address VARCHAR(50),
City VARCHAR(25),
State VARCHAR(2) DEFAULT 'OH',
Zip_code INT,
Phone_number INT NOT NULL,
Email_address VARCHAR(50),
Room INT,
Hospital_status_id INT, 
Balance_id INT,
Primary_contact_id INT,
Nurse_id INT,
Physician_id INT,
Insurance_id INT,
CONSTRAINT Hospital_status_id_FK
FOREIGN KEY (Hospital_status_id)
REFERENCES Patient_status(Hospital_status_id) ON DELETE CASCADE,
CONSTRAINT Balance_id_FK
FOREIGN KEY (Balance_id)
REFERENCES Balance(Balance_id) ON DELETE SET NULL,
CONSTRAINT Primary_contact_id_FK
FOREIGN KEY (Primary_contact_id)
REFERENCES Patient_Primary_Contact(Primary_contact_id) ON DELETE SET NULL,
CONSTRAINT Nurse_id_FK
FOREIGN KEY (Nurse_id)
REFERENCES Nurse(Nurse_id) ON DELETE SET NULL,
CONSTRAINT Physician_id_FK
FOREIGN KEY (Physician_id)
REFERENCES Physician(Physician_id) ON DELETE SET NULL,
CONSTRAINT Insurance_id_FK
FOREIGN KEY (Insurance_id)
REFERENCES Insurance(Insurance_id) ON DELETE SET NULL);

-- DROP TABLE Patient;

-- Diagnosis table;

INSERT INTO Diagnosis(Diagnosis_name)
VALUES('Rhinovirus infection'),
('Rheumatism'),
('Graves disease'),
('Viral meningitis'),
('Neuronal neuropathies'),
('Hepatitis B'),
('Undifferentiated connective tissue disease'),
('Loiasis'),
('Autoimmune retinopathy'),
('Swine influenza'),
('Lyme disease'),
('Anemia'),
('Influenzae infection'),
('Chlamydophila pneumoniae'),
('Mycoplasma pneumonia');

-- Patient_status; 

INSERT INTO Patient_status( Admission, Discharge, Diagnosis_id, Restrictions)
VALUES('2021-12-16 22:37:33', '2021-12-26 12:37:33', 1, 'Yes'),
('2022-08-03 19:58:17', '2022-08-15 10:58:17', 2, 'No'),
('2022-03-29 12:45:04', '2022-04-29 12:00:04', 3, 'No'),
('2022-06-11 03:04:47', '2022-06-21 10:04:47', 4, 'Yes'),
('2022-04-10 18:22:37', '2022-04-30 10:22:37', 1, 'Yes'),
('2021-10-26 17:51:34', '2021-11-06 15:51:34', 6, 'Yes'),
('2022-04-20 16:36:07', '2022-04-30 11:36:07', 7, 'No'),
('2022-03-04 06:02:09', '2022-03-14 10:02:09', 13, 'No'),
('2022-06-27 18:14:16', '2022-07-4 13:14:16', 9, 'No'),
('2022-10-05 03:54:40', '2022-10-15 13:54:40', 10, 'Yes'),
('2022-01-02 20:14:46', '2022-01-12 10:14:46', 11, 'Yes'),
('2022-09-13 11:00:36', '2022-09-23 12:00:36', 12, 'Yes'),
('2022-09-30 10:45:04', '2022-09-30 10:45:04', 13, 'No'),
('2021-11-17 18:50:31', '2021-11-25 18:50:31', 14, 'No'),
('2022-09-22 07:02:13', '2022-09-22 07:02:13', 1, 'Yes');

-- Balance table;

INSERT INTO Balance(Total_bill, Current_bill, Bill_status)
VALUES(1201.48, 391.73, 'Unpaid'),
(0, 0, 'Paid'), 
(18.75, 126.83, 'Pending'),
(0, 286.04, 'Unpaid'),
(0, 602.05, 'Paid'),
(730.64, 316.97, 'Unpaid'),
(1349.96, 545.96, 'Unpaid'),
(0, 0, 'Paid'),
(0, 717.53, 'Paid'),
(574.90, 575.96, 'Pending'),
(476.62, 666.86, 'Unpaid'),
(309.75, 805.41,'Pending'),
(0, 0, 'Paid'),
(77.75, 202.64, 'Pending'),
(134.08, 95.08, 'Unpaid');

-- Patient_Primary_Contact table;

INSERT INTO Patient_Primary_Contact( First_name, Last_name, Email_address, Phone_number, Relation_to_patient, Hipaa)
VALUES('Patsy', 'Fay', 'Patsy.Fay@hotmail', 468862004, 'Spouse', 'Yes'),
('Pat', 'Graham', 'Pat.Graham@gmail.com', 295775159, NULL, 'Yes'),
('Evan', 'Pacoca', 'Evan.Pacoca@gmail.com', 653826185, 'Parent', 'No'),
('Roxanne', 'Balistreri', 'RoxanneBalistreri@hotmail', 985687025, 'Spouse', 'Yes'),
('Tiffany', 'Moen', 'TiffanyMoen@gmail.com', 28729614, 'Spouse', 'Yes'),
('Emmett', 'Zboncak', 'EmmettZboncak@gmail.com', 985837025, 'Parent', 'Yes'),
('Janice', 'Halvorson', 'JaniceHalvorson@gmail.com', 272978614, NULL, 'Yes'),
('Rossie', 'Red', 'Rossie55@gmail.com', 997730171, 'Spouse', 'No'),
('Adonis', 'Schuppe', 'Adonis_Schuppe@hotmail.com', 792728337, 'Parent', 'Yes'),
('Deon', 'Wolff', 'Deon.Wolff@hotmail.com', 704459077, NULL, 'Yes'),
('Doris', 'Morissette', 'Doris.Morissette@gmail.com', 426119006, 'Spouse', 'Yes'),
('Eloy', 'Pagac', 'Eloy.Pagac17@gmail.com', 407943241, 'Spouse', 'Yes'),
('Wendell', 'Rice', 'Wendell.Rice@gmail.com', 425040279, 'Parent', 'No'),
('Romaine', 'Harris', 'Romaine_Harris76@hotmail.com', '827973974', 'Spouse', 'Yes'),
('Kaylin', 'Schmeler', 'Kaylin.Schmeler89@yahoo.com', 851615319, NULL, 'Yes');


-- Nurse table;

INSERT INTO Nurse(First_name, Last_name, License_number, Address, City, State, Zip_code, Phone_number, Email_address)
VALUES('Alycia', 'Rutherford', 61988, '949 Manley Lock', 'Dayton', 'OH', 43000, 1469268922, 'Alycia.Rutherford14@yhospital.com'),
('Alycia', 'Bredford', 77810, '70620 Leuschke Extension', 'Dayton', 'OH', 43001, 1742792633, 'AlyciaBredford@hospital.com'),
('Carli', 'Shields', 90213, '70620 Leuschke Extension', 'Dayton', 'OH', 43045, 1338568204, 'Carli.Shields@hospital.com'),
('Ashly', 'Rice', 15678, '70945 Maximillian Rest', 'Dayton', 'OH', 43040, 1950541304, 'Ashly.Rice@hospital.com'),
('Rhoda', 'Nader', 90256, '07848 Russel Villages', 'Dayton', 'OH', 43061, 705785315, 'Rhoda.Nader@hospital.com'),
('Lora', 'Brekke', 77810, '757 Clark Lane', 'Dayton', 'OH', 43064, 1317280871, 'Lora.Brekke@hospital.com'),
('Denise', 'Shields', 90713, '19601 Berniece Burgs', 'Dayton', 'OH', 43044, 1932511853, 'Denise.Shields@hospital.com'),
('Stephen', 'Mayert', 76290, '92681 Lind Turnpike', 'Dayton', 'OH', 43015, 1932511853, 'Stephen.Mayert@hospital.com'),
('Darlene', 'Ortiz', 88201, '743 Paucek Lane', 'Dayton', 'OH', 43011, 1783795556, 'Darlene.Ortiz@hospital.com'),
('Brian', 'Upton', 29820, '958 Keeling Port', 'Dayton', 'OH', 43017, 959337500, 'Brian.Upton@hospital.com');

-- Physician table;

INSERT INTO Physician(First_name, Last_name, Category, License_number, Address, City, State, Zip_code, Phone_number, Email_address)
VALUES('Brian', 'Upton', 'Dermatologist', 99108, '2642 Fabian Groves','Dayton', 'OH', 43000, 73254992, 'Brian.Upton@hospital.com'),
('Myrtle', 'Prohaska', 'Dermatologist', 87109, '45368 Adriana Route', 'Dayton', 'OH', 43010, 571629430, 'Myrtle.Prohaska@hospital.com'),
('Lora', 'Jacobson', 'Cardiologist', 15178,'31627 Patsy Shoals', 'Dayton', 'OH', 43005, 501617613,  'Lora.Jacobson@hospital.com'),
('Lee', 'Swift', 'Anaesthesiologist', 78190, '835 Marcus Turnpike', 'Dayton', 'OH', 43011, 654269852,  'Lee.Swift@hospital.com'),
('Luther', 'Metz', 'Allergist', 45019, '8819 Mayer Drive', 'Dayton', 'OH', 43030, 338568063, 'Luther.Metz@hospital.com'),
('Ricardo', 'Skiles', 'Dietitian', 81093, '934 Keefe Views', 'Dayton', 'OH', 43035, 562966715,  'Ricardo.Skiles@hospital.com'),
('George', 'Keeper', 'Dermatologist', 910458, '337 Mandy Point', 'Dayton', 'OH', 43066, 580188035, 'George.Keeper@hospital.com');


-- Insurance table;

INSERT INTO Insurance(Insurance_name, Insurance_holder_first_name, Insurance_holder_last_name, Group_number, Group_name, Start_date, End_date)
VALUES('Priority Health', 'Annie', 'Blanda', 7380171, 'Macejkovic Inc', '2022-03-10', '2023-03-10'),
('Care Sourse', 'Gregory', 'Hermann', 241831, 'Farrell Group', '2022-09-11', '2022-09-11' ),
('Aetna', 'Brandy', 'Crooks', 795957,'Douglas, Bahringer and Hills', '2022-01-22', '2022-01-22'),
('Humana', 'Cora', 'Kovacek', 827937, 'Zemlak - DuBuque', '2022-03-12', '2023-03-12'),
('Blue Cross', 'Milton', 'Grimes', 796752, 'Farrell Group', '2022-02-10', '2023-02-10'),
('Monolina', 'Inez', 'Sawayn', 692722, 'Macejkovic Inc', '2021-12-23', '2022-12-23'),
('eHealthInsurance', 'Guy', 'Block', 758337, 'Streich Connelly', '2022-10-07', '2023-10-07');

-- Patient table;

INSERT INTO Patient(First_name, Last_name, Birthdate, Address, City, State, Zip_code, Phone_number, Email_address, Room,
Hospital_status_id, Balance_id, Primary_contact_id, Nurse_id, Physician_id, Insurance_id)
VALUES('Michele', 'Fay', '1978-04-24', '068 Collier Keys', 'Dayton', 'OH', 43010, 710877133, 'MicheleFay@gmail.com', 7024, 1, 1, 1, 1, 4, 1),
('Oliver', 'Adams', '1957-08-14', '1164 Rashad Brook', 'Dayton', 'OH', 43034, 655023048, 'OliverAdams@gmail.com', 2701, 2, 2, 2, 2, 3, 2),
('Ignacio', 'Hoeger', '1987-07-04', '562 Murazik Inlet', 'Dayton', 'OH', 43030, 852477832, 'IgnacioHoeger@gmail.com', 1122, 3, 3, 3, 5, 3, 3),
('Mack', 'Runte', '1946-02-06', '4169 Leonora Shores', 'Dayton', 'OH', 43031, 423619240, 'MackRunte@gmail.com', 2288, 4, 4, 4, 2, 1, 4),
('Candace', 'Mayer', '1960-11-27', '31149 Gutmann Skyway', 'Dayton', 'OH', 43010, 272371076, 'CandaceMayer@gmail.com', 5071, 5, 5, 5, 3, 5, 5),
('Seth', 'Schmitt', '1996-03-06', '725 West Crossing', 'Dayton', 'OH', 43014, 644270696, 'SethSchmitt@gmail.com', 5301, 6, 6, 6, 6, 4, 6),
('Alan', 'Walter', '1973-05-04', '3306 Sage Prairie', 'Dayton', 'OH', 430310, 482177428, 'Alan.Walter@gmail.com', 2130, 7, 7, 7, 4, 4, 7),
('Camille', 'Koss', '1964-10-29', '84137 Hermann Islands', 'Dayton', 'OH', 43037, 373858751, 'CamilleKoss@gmail.com', 3307, 8, 8, 8, 10, 2, 7),
('Ira', 'Doyle', '1996-01-20', '817 Adams Parks', 'Dayton', 'OH', 43064, 402535828, 'IraDoyle@gmail.com', 4021, 9, 9, 9, 4, 1, 1),
('Drew', 'Stehr', '2000-08-03', '1724 Kelli Circles', 'Dayton', 'OH', 430360, 484573953, 'DrewStehr@gmail.com', 6601, 10, 10, 10, 4, 3, 2),
('Alan', 'Lind', '1954-12-17', '12894 Shayna Viaduct', 'Dayton', 'OH', 430360, 828507016, 'Alan.Lind@gmail.com', 6210, 11, 11, 11, 4, 2, 1),
('Chad', 'Kuhic', '2004-08-05', '52006 Jarred Lane', 'Dayton', 'OH', 430330, 324558675, 'Chad.Kuhic@hotmail.com', 3402, 12, 12, 12, 3, 4, 7),
('Ruth', 'Hegmann', '1994-05-16', '34359 Felipa Lake', 'Dayton', 'OH', 430366, 322242709, 'Ruth.Hegmann@hotmail.com', 5287, 13, 13, 13, 9, 6, 6),
('Nettie', 'Roob', '1958-02-25', '12708 Wisozk Hills', 'Dayton', 'OH', 430310, 1516366652, 'Nettie.Roob@gmail.com', 2109, 14, 14, 14, 9, 3, 7),
('Tanya', 'Dickens', '1980-04-16', '97481 Ullrich Pine', 'Dayton', 'OH', 43019, 23859193, 'TanyaDickens@gmail.com', 7201, 15, 15, 15, 2, 3, 2);


DESCRIBE Diagnosis;
DESCRIBE Patient_primary_contact;
DESCRIBE Balance;
DESCRIBE Patient_status;
DESCRIBE Nurse;
DESCRIBE Physician;
DESCRIBE Insurance;
DESCRIBE Patient;

SELECT * FROM Diagnosis;
SELECT * FROM Patient_primary_contact;
SELECT * FROM Balance;
SELECT * FROM Patient_status;
SELECT * FROM Nurse;
SELECT * FROM Physician;
SELECT * FROM Insurance;
SELECT * FROM Patient;

-- Queries

-- Tables;

SHOW tables;

-- Add at least 2 different defaults;

DESCRIBE Patient_status;
DESCRIBE Patient;
DESCRIBE Nurse;
DESCRIBE Physician;

-- Constraints. Add a not null constraint;

DESCRIBE Patient_status;
DESCRIBE Physician;

-- Constraints. Add at least 1 check constraints using ENUM or check constraint;

DESCRIBE Patient_primary_contact;
DESCRIBE Balance;

-- Constraints. Each table should have a primary key and 4 of the tables should have foreign keys;

DESCRIBE Diagnosis;
DESCRIBE Patient_primary_contact;
DESCRIBE Balance;
DESCRIBE Patient_status;
DESCRIBE Nurse;
DESCRIBE Physician;
DESCRIBE Insurance;
DESCRIBE Patient;

-- Tables;

--  Create a table from another table – structure and data;

CREATE TABLE Diagnosis_copy AS SELECT * FROM Diagnosis;

--  Drop the created table;

DROP TABLE Diagnosis_copy;


-- Insert at least 10 records into 3 of the tables; 
-- Use the follow at least once VARCHAR, INT, DATE, FLOAT/DECIMAL/DOUBLE;

SELECT * FROM Diagnosis;
SELECT * FROM Patient_primary_contact;
SELECT * FROM Balance;
SELECT * FROM Patient_status;
SELECT * FROM Patient;

-- Data Update at least 3 records;
 
SET sql_safe_updates = 0; 

SELECT * FROM Insurance WHERE Insurance_name  =  'Blue Cross';

UPDATE Insurance SET Insurance_name  =  'Blue Cross Blue Shield'
WHERE Insurance_name  =  'Blue Cross';


SELECT * FROM Physician WHERE Category = 'Dermatologist';

UPDATE Physician SET Category =  'DM Dermatologist'
WHERE Category = 'Dermatologist';

SELECT * FROM Physician WHERE Category = 'DM Dermatologist';

SELECT First_name, last_name, Zip_code FROM Patient
WHERE First_name = 'Alan' AND last_name = 'Walter' 
OR First_name = 'Drew' AND last_name = 'Stehr' 
OR First_name = 'Alan' AND last_name = 'Lind' 
OR First_name = 'Chad' AND last_name = 'Kuhic' 
OR First_name = 'Ruth' AND last_name = 'Hegmann' 
OR First_name = 'Nettie' AND last_name = 'Roob';


UPDATE Patient SET zip_code = 43000 
WHERE First_name = 'Alan' AND last_name = 'Walter' 
OR First_name = 'Drew' AND last_name = 'Stehr' 
OR First_name = 'Alan' AND last_name = 'Lind' 
OR First_name = 'Chad' AND last_name = 'Kuhic' 
OR First_name = 'Ruth' AND last_name = 'Hegmann' 
OR First_name = 'Nettie' AND last_name = 'Roob';

--  Functions;
--  sum and average;

SELECT SUM(total_bill) AS 'Total Patients Debt',
AVG(total_bill) AS 'Average of Total Debd'
 FROM Balance;

-- count;

SELECT COUNT(*)AS 'No debt' FROM Balance
WHERE total_bill = 0.00;

-- min and max -  use group by and having;

SELECT Current_bill, Bill_status,
MIN(Current_bill) AS 'Lowest bill',
MAX(Current_bill) AS 'Highest bill'
FROM Balance 
GROUP BY Bill_status
Having Current_bill > 0;

-- Queries; Queries to restrict rows using criteria and compound criteria;
-- Range criteria (between);

SELECT Current_bill, First_name, Last_name
FROM Balance JOIN Patient USING( Balance_id)
WHERE Current_bill between 1 and 500
ORDER BY Current_bill ASC;

-- Using IN operator;

SELECT First_name, Last_name
FROM Patient
WHERE state IN ('OH', 'KY')
ORDER BY first_name;

-- Using LIKE operator with wildcards;

SELECT First_name, Last_name
FROM Patient 
WHERE First_name LIKE 'A%'
UNION 
SELECT First_name, Last_name
FROM Physician
WHERE First_name LIKE 'B%';

-- Use column alias;

SELECT Diagnosis_name  AS 'Mistery of L' FROM Diagnosis 
WHERE Diagnosis_name LIKE 'L%';

-- Perform basic arithmetic operations;

SELECT Total_bill + Current_bill  AS 'New Total' 
FROM Balance;

SELECT Total_bill - Current_bill  AS 'New Total' 
FROM Balance;

SELECT Total_bill / Current_bill AS 'Bill division'
FROM Balance;

SELECT (Total_bill + Current_bill) * 0.10 AS 'Penalty fee'
FROM Balance;

-- Concatenate when reporting data;

SELECT CONCAT(First_name, ' ', Last_name, ' is ', Category, ' nice to meet you!') AS 'Welcome'
FROM Physician;

-- Use Distinct keyword;

SELECT DISTINCT First_name
FROM Nurse;

-- Order the output;

SELECT Insurance_name, First_name, Last_name 
FROM Insurance JOIN Patient USING(Insurance_id)
Order by Insurance_name ASC;

-- List all the records with null values;

SELECT First_name, last_name, Relation_to_patient FROM Patient_primary_contact
WHERE Relation_to_patient IS NULL;

-- Extract the month from the date;

SELECT First_name, Last_name, MONTH(Birthdate) AS 'Patinets Birthday Month' 
FROM Patient;

-- Use SUBSTR to pull out something;

SELECT first_name, last_name, CONCAT(SUBSTR(first_name, 1, 1), ' .', 
SUBSTR(last_name, 1, 1)) AS 'Patient name abbreviation'
FROM Patient;

-- Create a column that provides the length of one of your columns;

SELECT LENGTH(first_name) FROM Patient;

-- Round output from one of your columns to 1 digit;

SELECT Total_bill, ROUND(Total_bill, 1) AS 'Round Bill'
FROM Balance; 

-- Query If/Case and IFNULL statement;

-- Use an if/case statement;

SELECT First_name, Last_name, Total_bill, balance_id, 
CASE
WHEN (Total_bill) > 0 THEN 'Send mail with total bill'
WHEN (Total_bill) = 0 THEN ' No action'
WHEN (Current_bill) > 0 THEN 'Send main with current balnce'
WHEN (Current_bill) = 0 THEN 'No action'
END AS 'Balance Action Needed'
FROM Balance JOIN Patient USING(Balance_id);

--  Use IFNULL;

SELECT First_name, Last_name,
IFNULL(Relation_to_patient, 'Send to Patient form for request additional information') 
AS 'Patient Relation to Primary Contact'
FROM Patient_primary_contact;

--  Joins;
-- Query that joins 3 tables and limits output in order to see Patients diagnosis name;

SELECT First_name, Last_name, Diagnosis_name
FROM Patient 
INNER JOIN Patient_status 
ON Patient.Hospital_status_id = Patient_status.Hospital_status_id
INNER JOIN Diagnosis
ON Patient_status.Diagnosis_id = Diagnosis.Diagnosis_id
LIMIT 5;

-- Query with a left outer join to see Nurses shitfs

SELECT CONCAT(p.First_name, ' ', p.Last_name, ' has nurse ', 
n.First_name, ' ', n.Last_name, ' today on ', CURDATE()) AS "Today's Nurse shift"
FROM Patient p
Left OUTER JOIN Nurse n 
ON p.Nurse_id = n.Nurse_id;

-- Query with a right outer join in order to show Physician name and their patients;

SELECT CONCAT(ph.First_name, ' ', ph.Last_name) AS 'Phisician full name',
CONCAT(p.First_name, ' ', p.Last_name) AS 'Patient full name'
FROM Patient p
RIGHT OUTER JOIN Physician ph 
ON p.Physician_id = ph.Physician_id
ORDER BY ph.first_name;

-- Query using a set operation (Union, union all);

SELECT First_name, Last_name
FROM Patient 
WHERE First_name LIKE 'A%'
UNION 
SELECT First_name, Last_name
FROM Physician
WHERE First_name LIKE 'B%';

-- UNION ALL;

SELECT First_name, Last_name
FROM Patient 
UNION ALL
SELECT First_name, Last_name
FROM Physician;






