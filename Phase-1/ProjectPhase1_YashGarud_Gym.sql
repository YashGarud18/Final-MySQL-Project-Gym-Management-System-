/*                                                                   Project Phase-1
													              Gym Management System
*/

-- ----Create Database 
CREATE DATABASE IF NOT EXISTS gym;

-- ----Use the created database
use gym;

-- ----Creating tables for Gym Management System
-- Table-1 Gym_detail table
CREATE TABLE gym_detail(
Id int primary key AUTO_INCREMENT,
Gym_Name varchar(50) not null,
Location varchar(50),
Fees int,
open_time time not null,
close_time time
);

-- Insert values into table
INSERT INTO gym_detail (Gym_Name, Location, Fees, open_time, close_time)
VALUES
('Sculpt Gym','Kalyan (E), Mumbai',700,'06:00:00','22:00:00'),
('Muscle Gym','Kalyan (W), Mumbai',900,'06:00:00','22:00:00'),
('Emty Gym','Thane, Mumbai',800,'06:00:00','23:00:00'),
('Fitness Gym','Kalyan (W), Mumbai',700,'06:00:00','22:00:00'),
('Workout Gym','Diva, Mumbai',500,'07:00:00','22:00:00'),
('Fit Gym','Alibaug',1000,'06:00:00','22:00:00'),
('0Size','NewYork',3000,'07:00:00','22:00:00'),
('Legend','New Delhi',2000,'05:00:00','22:00:00'),
('Passion Gym','Mumbai',700,'06:00:00','21:00:00'),
('Fidonal Gym','Navi Mumbai',5000,'08:00:00','20:00:00')
;

-- Table-2 users table
create table user (
user_id int primary key auto_increment,
name varchar(50),
email varchar(50),
phoneNo varchar(50),
role varchar(50)
);

-- insert values into table
 INSERT INTO User (user_id, name, email, phone, role)
 VALUES
(1, 'John Doe', 'john.doe@example.com', '1234567890', 'admin'),
(2, 'Alice Smith', 'alice.smith@example.com', '0987654321', 'trainer'),
(3, 'Bob Johnson', 'bob.johnson@example.com', '1112223333', 'member');