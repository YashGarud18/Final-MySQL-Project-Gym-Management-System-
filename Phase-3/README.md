# Gym Management System 💪

## Overview 📊
This Gym Management System is designed to handle various aspects of managing a gym, including users, classes, trainers, payments, equipment, and more. The system utilizes SQL to create and manage a relational database.

## Features ✨
- User Management
- Class Scheduling and Enrollment
- Trainer Management
- Payments and Membership Handling
- Equipment Tracking
- Promotions and Events
- Reporting and Analytics

## Database Structure 📑
Key Tables:
- **Users**: Stores user details.
- **Classes**: Manages gym classes.
- **Trainers**: Contains trainer information.
- **Payments**: Records payments made by users.
- **Equipment**: Tracks gym equipment.
- **Promotions**: Manages discounts and special offers.
- **Events**: Tracks gym events and user participation.

## Queries Implemented 🔍
### 1. Joins
- Inner joins to combine user and payment data.
- Left joins to get users with no payments.
- Joining multiple tables for detailed insights.

### 2. Subqueries
- Fetching data using nested queries.
- Identifying users with no payments.
- Calculating totals per user.

### 3. Built-in Functions ⚙️
- String functions like CONCAT, UPPER, LOWER.
- Date functions like NOW, DATEDIFF, YEAR.
- Aggregation functions like COUNT, SUM, AVG.

### 4. User-defined Functions
- Calculate BMI.
- Get user full names.
- Count user classes.
- Calculate discounts.

## How to Run ▶️
1. Import the provided SQL file into your database.
2. Execute the queries one by one.
3. Test the user-defined functions and queries.

## Future Enhancements 💡
- Implement stored procedures.
- Add triggers for automated actions.
- Integrate with a web application.

## Acknowledgments ✨
- SQL community for resources and guidance.
- Mentors and peers for support and feedback.
