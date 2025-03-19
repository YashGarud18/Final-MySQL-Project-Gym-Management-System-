/*                                                                   Project Phase-2
													              Gym Management System
*/


/*
1. Apply All Query Languages DDL, DML, DQL
2. Write all possible queries using Operators, clauses, alias,  functions
3. Joins & Subqueries
4.  Cascades (ON DELETE CASCADE, ON UPDATE CASCADE)
5. Write neat and clean queries within proper single or multi-line comments. 
*/

-- Use the created database
use gym;


-- --------------------------------------------
-- 1. DDL (Data Definition Language) Queries
-- --------------------------------------------

-- 1. Create Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2.Add Phone Number Column to Users Table
ALTER TABLE Users ADD phone_number VARCHAR(15);

-- 3. Rename Column in Users Table
ALTER TABLE Users RENAME COLUMN phone_number TO contact_number;

-- 4. Drop a Column from Users Table
ALTER TABLE Users DROP COLUMN contact_number;

-- 5. Create Classes Table
CREATE TABLE Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100),
    description TEXT
);

-- 6. Add Capacity Column to Classes Table
ALTER TABLE Classes ADD capacity INT;

-- 7. Rename Classes Table to Gym_Classes
ALTER TABLE Classes RENAME TO Gym_Classes;

-- 8. Drop Classes Table
DROP TABLE Gym_Classes;

-- 9. Create Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE
);

-- 10. Add Foreign Key Constraint
ALTER TABLE Payments ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users(user_id);


-- ---------------------------------------------
-- 2. DML (Data Manipulation Language) Queries
-- ---------------------------------------------

-- 1. Insert Data into Users
INSERT INTO Users (first_name, last_name, email) VALUES ('John', 'Doe', 'john.doe@example.com');

-- 2. Insert Multiple Records
INSERT INTO Users (first_name, last_name, email) VALUES
('Jane', 'Doe', 'jane.doe@example.com'),
('Sam', 'Smith', 'sam.smith@example.com');

-- 3. Update Email for a User
UPDATE Users SET email = 'john.doe@newmail.com' WHERE user_id = 1;

-- 4. Increase Payment Amount for Specific User
UPDATE Payments SET amount = amount + 10 WHERE user_id = 1;

-- 5. Delete a User
DELETE FROM Users WHERE user_id = 3;

-- 6. Delete All Payments for a User
DELETE FROM Payments WHERE user_id = 2;

-- 7. Insert Payment Record
INSERT INTO Payments (user_id, amount, payment_date) VALUES (1, 100.00, '2024-03-01');

-- 8. Insert Payment with Null Amount
INSERT INTO Payments (user_id, amount, payment_date) VALUES (2, NULL, '2024-03-05');

-- 9. Update User Names
UPDATE Users SET first_name = 'Mike' WHERE user_id = 2;

-- 10. Delete All Records from Payments
DELETE FROM Payments;


-- ---------------------------------------
-- 3. DQL (Data Query Language) Queries
-- ----------------------------------------

-- 1. Select All Users
SELECT * FROM Users;

-- 2. Select User by ID
SELECT * FROM Users WHERE user_id = 1;

-- 3. Get User Count
SELECT COUNT(*) AS total_users FROM Users;

-- 4. Get Payments Greater Than 50
SELECT * FROM Payments WHERE amount > 50;

-- 5. List Payments with User Names
SELECT u.first_name, u.last_name, p.amount, p.payment_date
FROM Payments p
JOIN Users u ON p.user_id = u.user_id;

-- 6. Get Total Payments Per User
SELECT user_id, SUM(amount) AS total_amount FROM Payments GROUP BY user_id;

-- 7. Find Latest Payment
SELECT * FROM Payments ORDER BY payment_date DESC LIMIT 1;

-- 8. Count Payments Over 100
SELECT COUNT(*) FROM Payments WHERE amount > 100;

-- 9. Get Average Payment
SELECT AVG(amount) AS avg_payment FROM Payments;

-- 10. Get Users with No Payments
SELECT * FROM Users WHERE user_id NOT IN (SELECT DISTINCT user_id FROM Payments);



-- ------------------
-- 4. Joins Queries
-- ------------------

-- 1. Join Users and Payments to get payment details
SELECT u.first_name, u.last_name, p.amount, p.payment_date
FROM Users u
JOIN Payments p ON u.user_id = p.user_id;

-- 2. Join Users and Classes to get class details
SELECT u.first_name, u.last_name, c.class_name
FROM Users u
JOIN User_Classes uc ON u.user_id = uc.user_id
JOIN Classes c ON uc.class_id = c.class_id;

-- 3. Join Users and Payments with LEFT JOIN to include users with no payments
SELECT u.first_name, u.last_name, p.amount
FROM Users u
LEFT JOIN Payments p ON u.user_id = p.user_id;

-- 4. Join Payments and Classes through User_Classes
SELECT u.first_name, c.class_name, p.amount
FROM Users u
JOIN User_Classes uc ON u.user_id = uc.user_id
JOIN Classes c ON uc.class_id = c.class_id
JOIN Payments p ON u.user_id = p.user_id;

-- 5. Self Join to compare users with same email domain
SELECT u1.first_name AS User1, u2.first_name AS User2, u1.email
FROM Users u1
JOIN Users u2 ON u1.email LIKE CONCAT('%@', SUBSTRING_INDEX(u2.email, '@', -1)) AND u1.user_id <> u2.user_id;

-- -----------------------
-- 5. Subqueries Queries
-- -----------------------

-- 1. Get users with highest payment
SELECT first_name, last_name FROM Users WHERE user_id = (SELECT user_id FROM Payments ORDER BY amount DESC LIMIT 1);

-- 2. Count users who have made payments
SELECT COUNT(*) FROM Users WHERE user_id IN (SELECT DISTINCT user_id FROM Payments);

-- 3. Get classes with no registered users
SELECT class_name FROM Classes WHERE class_id NOT IN (SELECT DISTINCT class_id FROM User_Classes);

-- 4. Find users who paid more than the average
SELECT first_name, last_name FROM Users WHERE user_id IN (SELECT user_id FROM Payments WHERE amount > (SELECT AVG(amount) FROM Payments));

-- 5. Get the latest payment for each user
SELECT user_id, MAX(payment_date) AS latest_payment FROM Payments GROUP BY user_id;



-- Queries with Operators, Clauses, Alias, and Functions

-- 1. Find users with emails ending in 'example.com'
SELECT * FROM Users WHERE email LIKE '%@example.com';

-- 2. Calculate total payments and label the result as 'Total_Payments'
SELECT SUM(amount) AS Total_Payments FROM Payments;

-- 3. Get users with payments greater than 50 and sort by amount descending
SELECT u.first_name, u.last_name, p.amount
FROM Users u
JOIN Payments p ON u.user_id = p.user_id
WHERE p.amount > 50
ORDER BY p.amount DESC;

-- 4. Get distinct class names
SELECT DISTINCT class_name FROM Classes;

-- 5. Count total payments per user, show only users with more than 1 payment
SELECT user_id, COUNT(payment_id) AS Payment_Count
FROM Payments
GROUP BY user_id
HAVING COUNT(payment_id) > 1;

-- 6. Calculate average payment per user and round to 2 decimal places
SELECT user_id, ROUND(AVG(amount), 2) AS Avg_Payment
FROM Payments
GROUP BY user_id;

-- 7. 
SELECT * FROM Users u
LEFT JOIN Payments p ON u.user_id = p.user_id
WHERE p.payment_id IS NULL;

-- 8. 
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name FROM Users;