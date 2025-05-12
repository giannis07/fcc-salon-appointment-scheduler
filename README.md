# 💇‍♂️ Salon Appointment Scheduler

This is my solution for the [Salon Appointment Scheduler project on freeCodeCamp](https://www.freecodecamp.org/learn/relational-database/build-a-salon-appointment-scheduler-project/build-a-salon-appointment-scheduler).

## 📌 Overview

A command-line application built with Bash and PostgreSQL that allows customers to schedule appointments at a salon. It handles new and returning customers, lets users choose a service, and saves all data in a relational database.

## ⚙️ Features

- Interactive CLI menu to choose a service  
- Prompts for customer phone number and name  
- Schedules appointments based on selected time  
- Stores data in PostgreSQL tables  
- Uses psql commands in Bash script  
- Input validation and error handling

## 🛠️ Getting Started

1. Clone the repository:  
git clone https://github.com/giannis07/fcc-salon-appointment-scheduler.git  
cd fcc-salon-appointment-scheduler

2. Make the script executable:  
chmod +x salon.sh

3. Set up the PostgreSQL database using the `salon` script or manually:  
psql -f salon.sql

4. Run the app:  
./salon.sh

## 🧪 Example Usage

- Choose a service from a list  
- Enter your phone number (existing or new customer)  
- Enter your name (if new)  
- Provide a preferred time  
- See confirmation message with appointment details

## 🧱 Technologies Used

- Bash  
- PostgreSQL  
- psql CLI  
