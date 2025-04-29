**  SmartHome ft. Smartwatch Database **

Welcome to the **SmartHome ft. Smartwatch** database project!  
This system combines smart home automation with smartwatch health tracking and personalized user notifications — all managed through a structured and secure relational database.

---

##  📌 What It’s About

The database supports:
- Smart device control (lights, heating, locks, gardening)
- Smartwatch health tracking (pulses, distance, temperature)
- Role-based access (admin, family member, child, guest)
- User activity planning with reminders and notifications

🎯 The goal? Full control of your home and health, in one place.

---

##  🧱 ER Diagram

Visual overview of the database schema:

![ER Diagram](mydb.png)

---

## 🗃️ Files Included

- 📄 **report_work1_team1.pdf**  
  Full project report describing design, entities, relationships & requirements.

- 🖼️ **mydb.png**  
  ER diagram showing the full database schema and associations.

- 🧠 **query1.sql**, **query2.sql**, ...  
  A set of SQL scripts containing queries like:
  - 🔋 Smartwatches with low battery
  - 👥 Users and their roles
  - 📢 Activity-based reminders
  - 🔥 Actuator energy stats

---

## 🧠 Key Entities

| Entity        | Description |
|---------------|-------------|
| `User`        | Stores user info and role |
| `Device`      | Abstract parent for all devices |
| `Smartwatch`  | Monitors health data + reminds |
| `Sensor`      | Triggers based on conditions |
| `Actuator`    | Executes actions in the smart home |
| `Activity`    | Daily scheduled tasks |
| `Notification`| Messages sent to the smartwatch |
| `Permission`  | Device access rights |
| `Role`        | Defines access levels for users |

🔁 Relationships like `commands`, `reminds`, `notifies`, `hasPermission`, and `does` connect users, roles, devices, and activities intelligently.

---

## 🔐 Role Permissions Overview

| Role          | Capabilities |
|---------------|--------------|
| `admin`       | Full control over all devices and settings |
| `familyMember`| Controls most devices except sensors |
| `child`       | Controls lights and TV only |
| `guest`       | No device control, just notifications |

---

## 🚀 Example Queries

Here are some useful queries included:

- Get smartwatches with battery < 20%  
- Find all notifications sent to users with pulses > 90  
- List activities longer than 1 hour  
- Get roles with both “controlLights” and “controlHeating”  
- Find which roles control **all** devices (division query!)

---

## 🛠️ How to Run the Project

Follow these simple steps to get the SmartHome database up and
