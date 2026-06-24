# Railway-Management-System
Database Management System Project

---

## 📝 Project Abstract
The **Railway Reservation System** is a relational database project designed to make booking train tickets easier and more efficient. It manages important information like train details, routes, reservations, and available seats. 

The system utilizes entity relationships and database normalization to keep data organized, minimize redundancy, and ensure transactional consistency.

## 🛠️ Database Schema & Structure
The project consists of 4 core interconnected tables:
1. **Trains Table:** Stores unique train numbers, names, types, and zones.
2. **Train Route Table:** Tracks station orders, arrival/departure times for every train route.
3. **Reservations Table:** Handles customer bookings, mapping PNRs with journey dates and statuses.
4. **Seats Table:** Keeps real-time track of seat numbers, coach numbers, and availability linked to PNRs.

---

## 🚀 How to Run this Project
1. Copy the entire code from the `railway_system.sql` file in this repository.
2. Open **MySQL Workbench** or any MySQL terminal.
3. Paste and execute the schema-building queries to create tables and insert sample data.
4. Run the provided sample queries to test functionalities like searching for trains or checking seat availability.

---
### 🛠️ Tools Used
* **Database:** MySQL
* **Design Tool:** MySQL Workbench
