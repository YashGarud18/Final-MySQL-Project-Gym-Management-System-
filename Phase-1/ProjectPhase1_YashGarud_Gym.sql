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
('Fidonal Gym','Navi Mumbai',5000,'08:00:00','20:00:00');
select*from gym_details;



-- Table-2 users table
create table user(
user_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50),
email varchar (50) unique,
phoneNo varchar(15),
gender enum('Male', 'Female', 'Other'),
join_date date
);

-- insert values
insert into user (first_name,last_name,email,phoneNo,gender,join_date)
values
('John', 'Doe', 'johndoe@example.com', '555-1234', 'Male', '2025-01-01'),
('Jane', 'Smith', 'janesmith@example.com', '555-5678', 'Female', '2025-01-10'),
('Michael', 'Johnson', 'michaelj@example.com', '555-8765','Male', '2025-01-12'),
('Emily', 'Davis', 'emilydavis@example.com', '555-3456', 'Female', '2025-01-03'),
('Chris', 'Martinez', 'chrismartinez@example.com', '555-9632', 'Male', '2025-01-09'),
('Chris', 'Martinez', 'chrismartinez@example.com', '555-1487', 'Male', '2025-04-01'),
('mia', 'Malkova', 'miaM@example.com', '555-7114', 'Female', '2025-12-08'),
('ola', 'gauos', 'olaG@example.com', '555-7774', 'Female', '2025-11-12'),
('mazxi', 'jjij', 'jjij@example.com', '555-1235', 'Male', '2025-08-23');
select *from user;



-- table 3
CREATE TABLE Memberships (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_name VARCHAR(100),
    duration_months INT,
    price DECIMAL(10, 2),
    benefits TEXT
);

-- insert values
insert into memberships(membership_name,duration_months,price,benefits)
values
('Basic Plan', 1, 30.00, 'Access to gym facilities, Locker room access'),
('Standard Plan', 3, 80.00, 'Access to gym facilities, Locker room access, 1 personal training session'),
('Premium Plan', 6, 150.00, 'Access to gym facilities, Locker room access, Unlimited group classes, 3 personal training sessions'),
('Annual Plan', 12, 250.00, 'Full access to all facilities, Unlimited group classes, 5 personal training sessions, Nutrition consultation'),
('Student Plan', 3, 60.00, 'Access to gym facilities, Locker room access, Student discount applied'),
('Family Plan', 12, 400.00, 'Access for up to 4 family members, Full access to all facilities, Group classes included'),
('Yoga Only Plan', 3, 70.00, 'Unlimited access to yoga classes, Locker room access'),
('Weekend Warrior', 1, 20.00, 'Access on Saturdays and Sundays only, Locker room access'),
('Senior Citizen Plan', 12, 200.00, 'Access to gym facilities, Special senior classes, Locker room access'),
('Corporate Plan', 12, 500.00, 'Access for employees, Full facility access, Group classes, Nutrition consultation');
select * from memberships;



-- table 4
create table user_membership(
user_id int,
membership_id int,
start_date date,
end_date date,
foreign key (user_id) references user (user_id),
foreign key (membership_id) references memberships(membership_id)
);

-- insert values
insert into user_membership(user_id,membership_id,start_date,end_date)
values
(1, 1, '2025-01-01', '2025-02-01'),
(2, 2, '2025-01-10', '2026-01-10'),
(3, 2, '2025-01-12', '2025-07-12'),
(4, 4, '2025-01-03', '2025-04-03'),
(5, 6, '2025-01-09', '2027-01-09'),
(6, 5, '2024-01-01', '2024-04-01'),
(7, 8, '2024-02-15', '2024-08-15'),
(8, 7, '2024-03-10', '2024-04-10'),
(9, 10, '2024-01-20', '2025-01-20'),
(10, 9, '2024-05-01', '2025-05-01');
select * from user_membership;



-- table 5
CREATE TABLE Trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    certification VARCHAR(100),
    hire_date DATE,
    status ENUM('Active', 'Inactive')
);

-- insert values
INSERT INTO Trainers (first_name, last_name, email, phone, certification, hire_date, status)
VALUES
('David', 'Williams', 'davidwilliams@example.com', '555-9999', 'Certified Personal Trainer', '2024-12-01', 'Active'),
('Sarah', 'Brown', 'sarahbrown@example.com', '555-1122', 'Certified Yoga Instructor', '2024-08-15', 'Inactive'),
('James', 'Miller', 'jamesmiller@example.com', '555-3344', 'Certified Strength Coach', '2024-05-20', 'Active'),
('Olivia', 'Taylor', 'oliviataylor@example.com', '555-4455', 'Certified Nutritionist', '2024-11-01', 'Active'),
('Daniel', 'Wilson', 'danielwilson@example.com', '555-5566', 'Certified CrossFit Trainer', '2024-09-15', 'Active'),
('John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Certified Personal Trainer', '2022-05-10', 'Active'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 'Yoga Instructor Certification', '2021-09-15', 'Active'),
('Mark', 'Johnson', 'mark.johnson@example.com', '345-678-9012', 'Strength and Conditioning Specialist', '2023-01-20', 'On Leave'),
('Emily', 'Davis', 'emily.davis@example.com', '456-789-0123', 'Group Fitness Instructor', '2020-11-05', 'Active'),
('Chris', 'Wilson', 'chris.wilson@example.com', '567-890-1234', 'Cycling Instructor Certification', '2024-02-01', 'Probation');
select *from trainers;



-- table 6
CREATE TABLE Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100),
    description TEXT,
    class_type ENUM('Yoga', 'Aerobics', 'Cardio', 'Strength', 'Cycling'),
    capacity INT
);

-- insert values
INSERT INTO Classes (class_name, description, class_type, capacity)
VALUES
('Morning Yoga', 'A relaxing yoga session to start your day.', 'Yoga', 20),
('High-Intensity Cardio', 'Burn calories with high-energy cardio exercises.', 'Cardio', 30),
('Strength Training', 'Build muscle and increase strength.', 'Strength', 25),
('Spin Class', 'Intense cycling workout with motivating music.', 'Cycling', 15),
('Dance Aerobics', 'Fun dance moves combined with aerobic exercises.', 'Aerobics', 35),
('Sunrise Yoga', 'Gentle yoga session to wake up the body and mind.', 'Yoga', 20),
('Power Cardio', 'High-intensity cardio workout to boost endurance.', 'Cardio', 30),
('Strength Bootcamp', 'Full-body strength training for all levels.', 'Strength', 25),
('Spin & Sweat', 'High-energy cycling session with great music.', 'Cycling', 15),
('Dance Fusion', 'Fun aerobic dance routine to stay fit and energized.', 'Aerobics', 35);
select*from classes;



-- table 7
CREATE TABLE Class_Schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT,
    trainer_id INT,
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id)
);

-- insert values
INSERT INTO Class_Schedule (class_id, trainer_id, start_time, end_time)
VALUES
(1, 2, '2025-01-10 08:00:00', '2025-01-10 09:00:00'),
(2, 3, '2025-01-11 10:00:00', '2025-01-11 11:00:00'),
(3, 4, '2025-01-12 07:00:00', '2025-01-12 08:00:00'),
(4, 5, '2025-01-13 17:00:00', '2025-01-13 18:00:00'),
(5, 2, '2025-01-14 12:00:00', '2025-01-14 13:00:00'),
(6, 7, '2024-03-18 06:00:00', '2024-03-18 07:00:00'),
(7, 6, '2024-03-18 08:00:00', '2024-03-18 09:00:00'),
(8, 8, '2024-03-18 17:00:00', '2024-03-18 18:00:00'),
(9, 7, '2024-03-19 07:00:00', '2024-03-19 08:00:00'),
(10, 9, '2024-03-19 18:00:00', '2024-03-19 19:00:00');
select*from user_schedule;



-- table 8
CREATE TABLE User_Classes (
    user_id INT,
    class_id INT,
    schedule_id INT,
    registration_date DATE,
    PRIMARY KEY (user_id, class_id, schedule_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (schedule_id) REFERENCES Class_Schedule(schedule_id)
);

-- insert values
INSERT INTO User_Classes (user_id, class_id, schedule_id, registration_date)
VALUES
(1, 1, 101, '2024-03-01'),
(2, 1, 101, '2024-03-02'),
(3, 2, 102, '2024-03-05'),
(4, 3, 103, '2024-03-07'),
(5, 3, 103, '2024-03-08'),
(6, 4, 104, '2024-03-10'),
(7, 5, 105, '2024-03-12'),
(8, 5, 105, '2024-03-13'),
(9, 2, 102, '2024-03-15'),
(10, 4, 104, '2024-03-18');
select*from user_classes;




-- table 9
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method ENUM('Credit Card', 'Debit Card', 'Cash', 'Bank Transfer'),
    payment_status ENUM('Pending', 'Completed', 'Failed'),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- insert values
INSERT INTO Payments (user_id, amount, payment_date, payment_method, payment_status)
VALUES
(1, 50.00, '2025-01-05', 'Credit Card', 'Completed'),
(2, 120.00, '2025-01-12', 'Debit Card', 'Completed'),
(3, 500.00, '2025-01-11', 'Bank Transfer', 'Pending'),
(4, 60.00, '2025-01-06', 'Cash', 'Completed'),
(5, 300.00, '2025-01-09', 'Credit Card', 'Completed'),
(6, 80.00, '2024-01-01', 'Credit Card', 'Completed'),
(7, 150.00, '2024-02-15', 'PayPal', 'Completed'),
(8, 30.00, '2024-03-10', 'Debit Card', 'Completed'),
(9, 250.00, '2024-01-20', 'Credit Card', 'Pending'),
(10, 400.00, '2024-05-01', 'Bank Transfer', 'Completed');
select*from payments;


-- table 10
CREATE TABLE Equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    purchase_date DATE,
    status ENUM('In Use', 'Available', 'Under Maintenance', 'Out of Order')
);

-- insert values
INSERT INTO Equipment (name, description, purchase_date, status)
VALUES
('Treadmill', 'Electric treadmill for cardio exercises', '2024-06-01', 'Available'),
('Dumbbells', 'Adjustable weight dumbbells', '2024-07-15', 'In Use'),
('Exercise Bike', 'Indoor cycling bike', '2024-08-10', 'Under Maintenance'),
('Barbell', 'Olympic barbell for weightlifting', '2024-09-20', 'Available'),
('Yoga Mats', 'Non-slip yoga mats for group sessions', '2024-02-01', 'In Use'),
('Stationary Bike', 'Indoor cycling bike with resistance control', '2023-05-20', 'Maintenance'),
('Rowing Machine', 'Rowing machine for full-body workout', '2024-11-01', 'Available');
select*from equipment;


-- table 11
CREATE TABLE Equipment_Usage (
    usage_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT,
    user_id INT,
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- insert values
INSERT INTO Equipment_Usage (equipment_id, user_id, start_time, end_time)
VALUES
(1, 1, '2024-03-15 06:00:00', '2024-03-15 06:30:00'),
(2, 2, '2024-03-15 06:30:00', '2024-03-15 07:00:00'),
(3, 3, '2024-03-15 07:00:00', '2024-03-15 07:45:00'),
(4, 4, '2024-03-15 08:00:00', '2024-03-15 08:30:00'),
(5, 5, '2024-03-15 08:30:00', '2024-03-15 09:00:00'),
(1, 2, '2024-03-16 06:00:00', '2024-03-16 06:45:00'),
(2, 3, '2024-03-16 07:00:00', '2024-03-16 07:30:00'),
(3, 4, '2024-03-16 07:45:00', '2024-03-16 08:15:00'),
(4, 5, '2024-03-16 08:30:00', '2024-03-16 09:00:00'),
(5, 1, '2024-03-16 09:00:00', '2024-03-16 09:30:00');
select*from equipment_usage;



-- table 12
CREATE TABLE Nutrition_Plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    calories INT,
    proteins INT,
    carbs INT,
    fats INT
);

-- insert values
INSERT INTO Nutrition_Plans (name, description, calories, proteins, carbs, fats)
VALUES
('Weight Loss Plan', 'Low-calorie plan focused on fat loss and lean protein intake.', 1500, 100, 150, 40),
('Muscle Gain Plan', 'High-protein plan to support muscle growth and recovery.', 2800, 200, 300, 80),
('Balanced Diet', 'Well-rounded plan for maintaining overall health.', 2200, 150, 250, 70),
('Keto Plan', 'Low-carb, high-fat plan for ketosis and fat burning.', 1800, 120, 50, 120),
('Vegan Plan', 'Plant-based plan with adequate protein and essential nutrients.', 2000, 130, 270, 60),
('Athlete Performance Plan', 'High-calorie plan for athletes needing peak performance.', 3200, 220, 350, 90),
('Detox Plan', 'Nutrient-dense plan focused on cleansing the body.', 1400, 90, 160, 30),
('Intermittent Fasting Plan', 'Eating window-focused plan to support fasting periods.', 1800, 140, 180, 50),
('Low-Carb Plan', 'Reduced carbohydrate intake for stabilizing blood sugar.', 1600, 110, 100, 70),
('Endurance Plan', 'High-carb plan for athletes focused on endurance training.', 3000, 180, 400, 75);
select*from nutrition_plans;


-- table 13
CREATE TABLE Goals (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    goal_type ENUM('Weight Loss', 'Muscle Gain', 'Endurance', 'Flexibility'),
    target_value DECIMAL(10, 2),
    current_value DECIMAL(10, 2),
    target_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- insert values
INSERT INTO Goals (user_id, goal_type, target_value, current_value, target_date)
VALUES
(1, 'Weight Loss', 70, 80, '2024-06-01'),
(2, 'Muscle Gain', 75, 68, '2024-09-01'),
(3, 'Cardio Endurance', 60, 45, '2024-07-15'),
(4, 'Strength', 100, 85, '2024-10-01'),
(5, 'Flexibility', 90, 70, '2024-05-20'),
(6, 'Weight Loss', 65, 75, '2024-08-01'),
(7, 'Muscle Gain', 80, 72, '2024-11-01'),
(8, 'Cardio Endurance', 75, 55, '2024-12-01'),
(9, 'Strength', 120, 100, '2025-01-01'),
(10, 'Flexibility', 100, 85, '2024-09-15');
select*from goals;


-- table 14
CREATE TABLE Workout_Plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    duration_weeks INT
);

-- insert values
INSERT INTO Workout_Plans (name, description, duration_weeks)
VALUES
('Beginner Strength', 'Introductory strength training plan for beginners.', 8),
('Cardio Blast', 'High-intensity cardio workouts to boost endurance.', 6),
('Full Body Transformation', 'Complete body workout targeting all muscle groups.', 12),
('Yoga for Flexibility', 'Gentle yoga flows to improve flexibility and relaxation.', 10),
('Weight Loss Accelerator', 'Fat-burning workouts combined with light strength training.', 8),
('Muscle Gain Mastery', 'Focused plan to build muscle and strength progressively.', 16),
('HIIT Challenge', 'High-Intensity Interval Training for fat loss and endurance.', 4),
('Core Strength Builder', 'Core-focused exercises to build a strong midsection.', 6),
('Cycling Endurance', 'Increase stamina with long cycling sessions.', 8),
('Athlete Performance', 'High-level program designed for athletes.', 12);
select*from workout_plans;



-- table 15
CREATE TABLE User_Workout_Plans (
    user_id INT,
    plan_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (user_id, plan_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (plan_id) REFERENCES Workout_Plans(plan_id)
);

-- insert values
INSERT INTO User_Workout_Plans (user_id, plan_id, start_date, end_date)
VALUES
(1, 1, '2024-01-01', '2024-02-26'),
(2, 2, '2024-02-01', '2024-03-14'),
(3, 3, '2024-03-01', '2024-05-24'),
(4, 4, '2024-04-01', '2024-06-10'),
(5, 5, '2024-05-01', '2024-06-26'),
(6, 6, '2024-06-01', '2024-09-21'),
(7, 7, '2024-07-01', '2024-07-29'),
(8, 8, '2024-08-01', '2024-09-12'),
(9, 9, '2024-09-01', '2024-10-27'),
(10, 10, '2024-10-01', '2024-12-24');
select*from user_workout_plans;



-- table 16
CREATE TABLE Workout_Exercises (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_id INT,
    exercise_name VARCHAR(100),
    description TEXT,
    sets INT,
    reps INT,
    rest_time INT,
    FOREIGN KEY (plan_id) REFERENCES Workout_Plans(plan_id)
);

-- insert values
INSERT INTO Workout_Exercises (plan_id, exercise_name, description, sets, reps, rest_time)
VALUES
(1, 'Squats', 'Lower body exercise targeting quads, glutes, and hamstrings.', 3, 12, '60 seconds'),
(1, 'Push-ups', 'Upper body exercise working chest, shoulders, and triceps.', 3, 15, '45 seconds'),
(2, 'Jumping Jacks', 'Full-body cardio exercise to elevate heart rate.', 4, 30, '30 seconds'),
(2, 'Mountain Climbers', 'Core and cardio exercise performed in a plank position.', 4, 20, '30 seconds'),
(3, 'Deadlifts', 'Strength exercise focusing on posterior chain muscles.', 4, 8, '90 seconds'),
(3, 'Pull-ups', 'Upper body exercise targeting back and biceps.', 3, 10, '60 seconds'),
(4, 'Downward Dog', 'Yoga pose stretching hamstrings and calves.', 2, 30, '30 seconds'),
(4, 'Child\'s Pose', 'Relaxing yoga pose for stretching lower back.', 2, 45, '30 seconds'),
(5, 'Burpees', 'Full-body exercise combining strength and cardio.', 3, 15, '45 seconds'),
(5, 'Lunges', 'Lower body exercise working quads, glutes, and balance.', 3, 12, '60 seconds');
select*from workout_exercise;



-- table 17
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    trainer_id INT,
    class_id INT,
    rating INT,
    comments TEXT,
    feedback_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- insert values
INSERT INTO Feedback (user_id, trainer_id, class_id, rating, comments, feedback_date)
VALUES
(1, 2, 1, 5, 'Excellent yoga class, very relaxing.', '2025-01-02'),
(2, 3, 2, 4, 'Great HIIT workout, but it could be a bit more intense.', '2025-01-11'),
(3, 4, 3, 5, 'Strength training was fantastic, I feel stronger already.', '2025-01-13'),
(4, 5, 4, 3, 'Cycling class was too long for me, but good overall.', '2025-01-04'),
(5, 2, 5, 5, 'Pilates class was amazing, I feel more flexible!', '2025-01-10');
select*from feedback;



-- table 18
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    equipment_id INT,
    rating INT,
    comments TEXT,
    review_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

-- insert values
INSERT INTO Reviews (user_id, equipment_id, rating, comments, review_date)
VALUES
(1, 1, 5, 'Treadmill runs smoothly and the new belt is great!', '2024-03-01'),
(2, 2, 4, 'Bike is solid, but the seat could be more comfortable.', '2024-03-02'),
(3, 3, 5, 'Rowing machine feels brand new after the maintenance.', '2024-03-05'),
(4, 4, 3, 'Dumbbells are decent, but a few have loose grips.', '2024-03-07'),
(5, 5, 4, 'Leg press machine works well, but needs occasional lubrication.', '2024-03-08'),
(6, 1, 5, 'Love using this treadmill for morning runs!', '2024-03-10'),
(7, 2, 3, 'Bike pedals feel a bit slippery when sweating.', '2024-03-12'),
(8, 3, 5, 'Perfect resistance on the rowing machine, very smooth.', '2024-03-13'),
(9, 4, 4, 'Dumbbells are good, but could use more weight variety.', '2024-03-15'),
(10, 5, 5, 'Leg press machine feels sturdy and reliable.', '2024-03-18');
select*from reviews;



-- table 19
CREATE TABLE Promotions (
    promo_id INT AUTO_INCREMENT PRIMARY KEY,
    promo_code VARCHAR(50) UNIQUE,
    description TEXT,
    discount_percentage INT,
    start_date DATE,
    end_date DATE,
    status ENUM('Active', 'Expired')
);

-- insert values
INSERT INTO Promotions (promo_code, description, discount_percentage, start_date, end_date, status)
VALUES
('NEWYEAR24', 'New Year Special - 24% off all memberships.', 24, '2024-01-01', '2024-01-15', 'Expired'),
('SPRINGFIT', 'Spring Fitness Promo - 15% off workout plans.', 15, '2024-03-01', '2024-03-31', 'Active'),
('SUMMER20', 'Summer Blast - 20% off on personal training.', 20, '2024-06-01', '2024-06-30', 'Upcoming'),
('WELCOME10', 'Welcome Offer - 10% off on first membership.', 10, '2024-01-01', '2024-12-31', 'Active'),
('FRIEND50', 'Refer a Friend - Get 50% off your next month.', 50, '2024-02-01', '2024-12-31', 'Active'),
('BLACKFRIDAY', 'Black Friday Deal - 40% off everything!', 40, '2024-11-22', '2024-11-29', 'Upcoming'),
('CYBERMONDAY', 'Cyber Monday Special - 30% off online plans.', 30, '2024-11-30', '2024-12-02', 'Upcoming'),
('STUDENT15', 'Student Discount - 15% off with valid ID.', 15, '2024-01-01', '2024-12-31', 'Active'),
('HOLIDAY25', 'Holiday Season - 25% off selected plans.', 25, '2024-12-01', '2024-12-31', 'Upcoming'),
('FLASH10', 'Flash Sale - 10% off for 24 hours!', 10, '2024-03-10', '2024-03-11', 'Expired');
select*from promotions;



-- table 20
CREATE TABLE User_Promotions (
    user_id INT,
    promo_id INT,
    applied_date DATE,
    PRIMARY KEY (user_id, promo_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (promo_id) REFERENCES Promotions(promo_id)
);

-- insert values
INSERT INTO User_Promotions (user_id, promo_id, applied_date)
VALUES
(1, 1, '2024-01-01'),
(2, 2, '2024-03-01'),
(3, 3, '2024-06-01'),
(4, 4, '2024-01-10'),
(5, 5, '2024-02-15'),
(6, 6, '2024-11-22'),
(7, 7, '2024-11-30'),
(8, 8, '2024-02-01'),
(9, 9, '2024-12-01'),
(10, 10, '2024-03-10');
select*from user_promotions;



-- table 21
CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100),
    event_description TEXT,
    event_date DATETIME,
    location VARCHAR(100)
);

-- insert values
INSERT INTO Events (event_name, event_description, event_date, location)
VALUES
('Yoga Sunrise Session', 'Morning yoga session to start the day with positivity.', '2024-03-21', 'Main Studio'),
('Cardio Blast Challenge', 'High-intensity cardio competition with prizes.', '2024-04-05', 'Gym Hall'),
('Strength Workshop', 'Learn proper lifting techniques with our trainers.', '2024-04-15', 'Weight Room'),
('Cycling Marathon', 'Endurance cycling event with live DJ.', '2024-05-01', 'Cycling Studio'),
('Nutrition 101', 'Nutrition seminar with expert dietitians.', '2024-05-20', 'Conference Room'),
('HIIT Bootcamp', 'Full-body high-intensity interval training session.', '2024-06-10', 'Outdoor Field'),
('Mindfulness Meditation', 'Guided meditation for relaxation and focus.', '2024-06-25', 'Wellness Room'),
('Summer Fitness Fest', 'Full day of workouts, games, and healthy food.', '2024-07-15', 'Main Gym'),
('Personal Training Q&A', 'Meet the trainers and get personalized advice.', '2024-08-05', 'Lounge Area'),
('End-of-Year Party', 'Celebrate the year with music, food, and awards.', '2024-12-20', 'Main Hall');
select*from events;



-- table 22
CREATE TABLE User_Events (
    user_id INT,
    event_id INT,
    registration_date DATE,
    PRIMARY KEY (user_id, event_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- insert values
INSERT INTO User_Events (user_id, event_id, registration_date)
VALUES
(1, 1, '2025-01-01'),
(2, 2, '2025-02-01'),
(3, 3, '2025-03-10'),
(4, 4, '2025-04-01'),
(5, 6, '2025-17-14'),
(6, 5, '2025-23-05'),
(7, 8, '2025-11-12'),
(8, 9, '2025-09-22'),
(9, 7, '2025-10-15');
select*from user_events;



-- table 23
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    status ENUM('Active', 'Inactive')
);

-- insert values
INSERT INTO Staff (first_name, last_name, role, phone, email, hire_date, status)
VALUES
('John', 'Doe', 'Manager', '123-456-7890', 'john.doe@gym.com', '2020-01-15', 'Active'),
('Jane', 'Smith', 'Trainer', '123-456-7891', 'jane.smith@gym.com', '2021-03-22', 'Active'),
('Emily', 'Johnson', 'Receptionist', '123-456-7892', 'emily.johnson@gym.com', '2022-06-10', 'Active'),
('Michael', 'Brown', 'Trainer', '123-456-7893', 'michael.brown@gym.com', '2019-09-05', 'Active'),
('Sarah', 'Davis', 'Cleaner', '123-456-7894', 'sarah.davis@gym.com', '2018-11-30', 'Active'),
('Chris', 'Wilson', 'Maintenance', '123-456-7895', 'chris.wilson@gym.com', '2017-05-18', 'Active'),
('Jessica', 'Martinez', 'Nutritionist', '123-456-7896', 'jessica.martinez@gym.com', '2023-02-15', 'Active'),
('Daniel', 'Anderson', 'Trainer', '123-456-7897', 'daniel.anderson@gym.com', '2020-12-12', 'Active'),
('Laura', 'Thomas', 'Receptionist', '123-456-7898', 'laura.thomas@gym.com', '2021-07-07', 'Active'),
('Mark', 'Garcia', 'Manager', '123-456-7899', 'mark.garcia@gym.com', '2015-03-20', 'Inactive');
select*from staff;


-- table 24
CREATE TABLE Maintenance_Logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT,
    staff_id INT,
    maintenance_date DATE,
    description TEXT,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- insert values
INSERT INTO Maintenance_Logs (equipment_id, staff_id, maintenance_date, description)
VALUES
(1, 6, '2024-01-10', 'Treadmill belt replaced and lubricated.'),
(2, 6, '2024-01-15', 'Stationary bike resistance system adjusted.'),
(3, 6, '2024-02-05', 'Rowing machine handle grip replaced.'),
(4, 6, '2024-02-20', 'Dumbbell rack secured and bolts tightened.'),
(5, 6, '2024-03-01', 'Leg press machine cable checked and lubricated.'),
(1, 6, '2024-03-10', 'Treadmill motor cleaned and tested.'),
(2, 6, '2024-03-15', 'Bike pedals replaced and seat adjusted.'),
(3, 6, '2024-03-20', 'Rowing machine chain lubricated.'),
(4, 6, '2024-03-25', 'Dumbbells inspected for cracks and rust.'),
(5, 6, '2024-04-01', 'Leg press machine safety stops tested.');
select*from maintenance;


-- table 25
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    class_id INT,
    class_date DATE,
    status ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- insert values
INSERT INTO Attendance (user_id, class_id, class_date, status)
VALUES
(1, 1, '2025-01-01', 'Present'),
(2, 2, '2025-01-11', 'Late'),
(3, 3, '2025-01-12', 'Absent'),
(4, 4, '2025-01-03', 'Present'),
(5, 6, '2025-20-01', 'Present'),
(6, 7, '2025-15-06', 'Late'),
(7, 4, '2025-03-11', 'Present'),
(8, 9, '2025-04-26', 'Absent'),
(9, 8, '2025-12-24', 'Absent');
select*from attendance;
