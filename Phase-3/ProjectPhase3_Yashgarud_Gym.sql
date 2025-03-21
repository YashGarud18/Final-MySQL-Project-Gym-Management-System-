/*                                                                   Project Phase-3
													              Gym Management System
*/

## (10A<Joins<SQ<Fun<B&UD)
-- 10 joins queries
-- 10 subqueries
-- 10 user-define & build-In functions

-- Use the created database
use gym;

#####################
-- 1. Joins Queries
#####################

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

-- 6. Join Users and Memberships to get user membership details
SELECT u.first_name, u.last_name, m.membership_name
FROM Users u
JOIN User_Memberships um ON u.user_id = um.user_id
JOIN Memberships m ON um.membership_id = m.membership_id;

-- 7. Join Users, Classes, and Trainers to get class and trainer info
SELECT u.first_name, c.class_name, t.first_name AS trainer_name
FROM Users u
JOIN User_Classes uc ON u.user_id = uc.user_id
JOIN Classes c ON uc.class_id = c.class_id
JOIN Trainers t ON c.trainer_id = t.trainer_id;

-- 8. Join Payments and Promotions to see discounts applied
SELECT p.amount, pr.promo_code, pr.discount_percentage
FROM Payments p
JOIN User_Promotions up ON p.user_id = up.user_id
JOIN Promotions pr ON up.promo_id = pr.promo_id;

-- 9. Join Equipment and Maintenance Logs
SELECT e.name AS equipment_name, ml.maintenance_date, ml.description
FROM Equipment e
JOIN Maintenance_Logs ml ON e.equipment_id = ml.equipment_id;

-- 10.  Join Events and User Events to see participants
SELECT e.event_name, u.first_name, u.last_name
FROM Events e
JOIN User_Events ue ON e.event_id = ue.event_id
JOIN Users u ON ue.user_id = u.user_id;


###########################
-- 2. Subqueries Queries
###########################

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

-- 6. Find users who made payments greater than the average payment amount.
SELECT first_name, last_name FROM Users 
WHERE user_id IN (SELECT user_id FROM Payments WHERE amount > (SELECT AVG(amount) FROM Payments));

-- 7. Get the names of users who registered for a class that has more than 10 participants.
SELECT first_name, last_name FROM Users 
WHERE user_id IN (SELECT user_id FROM User_Classes GROUP BY class_id HAVING COUNT(user_id) > 10);

-- 8. Find classes with no registered users.
SELECT class_name FROM Classes 
WHERE class_id NOT IN (SELECT DISTINCT class_id FROM User_Classes);

-- 9. List users who haven't made any payments.
SELECT first_name, last_name FROM Users 
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM Payments);


######################################################
-- 3. User-Defined Functions & Build-In function
######################################################

-- 1. Get User Full Name
DELIMITER //
CREATE FUNCTION get_full_name(userId INT) RETURNS VARCHAR(100)
BEGIN
    DECLARE fullName VARCHAR(100);
    SELECT CONCAT(first_name, ' ', last_name) INTO fullName FROM Users WHERE user_id = userId;
    RETURN fullName;
END //
DELIMITER ;

-- 2. Calculate Total Payments for a User
DELIMITER //
CREATE FUNCTION total_payments(userId INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(amount) INTO total FROM Payments WHERE user_id = userId;
    RETURN total;
END //
DELIMITER ;

-- 3. Check if User has Paid
DELIMITER //
CREATE FUNCTION has_paid(userId INT) RETURNS BOOLEAN
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM Payments WHERE user_id = userId;
    RETURN count > 0;
END //
DELIMITER ;

-- 4. Calculate BMI
DELIMITER //
CREATE FUNCTION calculate_bmi(weight DECIMAL(5, 2), height DECIMAL(5, 2)) RETURNS DECIMAL(5, 2)
BEGIN
    RETURN weight / (height * height);
END //
DELIMITER ;

-- 5. Get Last Payment Date
DELIMITER //
CREATE FUNCTION last_payment_date(userId INT) RETURNS DATE
BEGIN
    DECLARE lastDate DATE;
    SELECT MAX(payment_date) INTO lastDate FROM Payments WHERE user_id = userId;
    RETURN lastDate;
END //
DELIMITER ;

-- 6. Count User Classes
DELIMITER //
CREATE FUNCTION count_user_classes(userId INT) RETURNS INT
BEGIN
    DECLARE classCount INT;
    SELECT COUNT(*) INTO classCount FROM User_Classes WHERE user_id = userId;
    RETURN classCount;
END //
DELIMITER ;

-- 7. Calculate Discounted Amount
DELIMITER //
CREATE FUNCTION discounted_amount(amount DECIMAL(10, 2), discount DECIMAL(5, 2)) RETURNS DECIMAL(10, 2)
BEGIN
    RETURN amount - (amount * discount / 100);
END //
DELIMITER ;

-- 8. Get User Email
DELIMITER //
CREATE FUNCTION get_user_email(userId INT) RETURNS VARCHAR(100)
BEGIN
    DECLARE email VARCHAR(100);
    SELECT email INTO email FROM Users WHERE user_id = userId;
    RETURN email;
END //
DELIMITER ;

-- 9. Count Total Payments
DELIMITER //
CREATE FUNCTION count_total_payments() RETURNS INT
BEGIN
    DECLARE totalPayments INT ;
    SELECT COUNT(*) INTO totalPayments FROM Payments;
    RETURN totalPayments;
END //
DELIMITER ;

-- 10. Get Earliest Payment Date
DELIMITER //
CREATE FUNCTION earliest_payment_date(userId INT) RETURNS DATE
BEGIN
    DECLARE firstDate DATE;
    SELECT MIN(payment_date) INTO firstDate FROM Payments WHERE user_id = userId;
    RETURN firstDate;
END //
DELIMITER ;



-- 1. Get the total number of users.
SELECT COUNT(*) AS total_users FROM Users;

-- 2. Find the average payment amount.
SELECT AVG(amount) AS average_payment FROM Payments;

-- 3. Get the highest payment made.
SELECT MAX(amount) AS max_payment FROM Payments;

-- 4. Find the earliest payment date.
SELECT MIN(payment_date) AS earliest_payment FROM Payments;

-- 5. Concatenate first and last name of users.
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Users;

-- 6. Get the length of each user's email.
SELECT email, CHAR_LENGTH(email) AS email_length FROM Users;

-- 7. Extract the year from payment dates.
SELECT payment_date, YEAR(payment_date) AS payment_year FROM Payments;

-- 8. Calculate total payments per user and round to 2 decimal places.
SELECT user_id, ROUND(SUM(amount), 2) AS total_payments FROM Payments GROUP BY user_id;

-- 9. Replace part of the email domain with 'example.com'.
SELECT email, REPLACE(email, SUBSTRING_INDEX(email, '@', -1), 'example.com') AS updated_email FROM Users;

-- 10. Format the payment date in 'DD-MM-YYYY' format.
SELECT payment_date, DATE_FORMAT(payment_date, '%d-%m-%Y') AS formatted_date FROM Payments;


#################################
-- 10 queries for functions
#################################

-- 1. Calculate the total payments, replacing NULL values with 0.
SELECT IFNULL(SUM(amount), 0) AS total_payments FROM Payments;

-- 2. Find the first name in uppercase.
SELECT UPPER(first_name) AS upper_first_name FROM Users;

-- 3. Show the last name in lowercase.
SELECT LOWER(last_name) AS lower_last_name FROM Users;

-- 4. Find the difference in days between the earliest and latest payment.
SELECT DATEDIFF(MAX(payment_date), MIN(payment_date)) AS days_between_payments FROM Payments;

-- 5. Round the average payment to the nearest integer.
SELECT ROUND(AVG(amount)) AS rounded_avg_payment FROM Payments;

-- 6. Get the current date and time.
SELECT NOW() AS current_datetime;

-- 7. Extract the month from payment dates.
SELECT payment_date, MONTH(payment_date) AS payment_month FROM Payments;

-- 8. Pad user IDs with zeros to make them 5 digits long.
SELECT LPAD(user_id, 5, '0') AS padded_user_id FROM Users;

-- 9. Get the length of class descriptions.
SELECT class_name, CHAR_LENGTH(description) AS description_length FROM Classes;

-- 10. Replace spaces in class names with underscores.
SELECT REPLACE(class_name, ' ', '_') AS formatted_class_name FROM Classes;