 # Gym Management System #

## Overview

The Gym Management System is a software application that helps manage and store information about gyms, users (admin, trainers, and members), and other related details. The system allows you to store data about different gyms, their operational hours, fees, and locations. It also helps track users, their roles, and contact details.

## Features

- **Gym Management**: 
  - Store details about multiple gyms such as gym name, location, fees, opening and closing time.
  - Easily manage and update gym information.
  
- **User Management**:
  - Manage user data for admins, trainers, and members.
  - Keep track of user roles, personal details like email and phone number.

## Project Structure

1. **Database**: 
   The project uses a MySQL database. It contains two main tables:
   - `gym_detail`: Stores gym-specific details (e.g., name, location, fees, open and close times).
   - `user`: Stores user information, including name, email, phone number, and role.
