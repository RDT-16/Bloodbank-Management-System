# 🩸 Bloodbank-Management-System

A comprehensive and secure software solution designed to streamline and digitize blood donation, inventory tracking, and distribution operations. This project focuses on improving efficiency, safety, and donor engagement in blood banks through automation and data-driven decision-making.

---

## 📌 Table of Contents

1. [Abstract](#-abstract)
2. [Problem Statement](#-problem-statement)
3. [ER Model & Entity Relationships](#-er-model--entity-relationships)
4. [Relational Schema & Database Tables](#-relational-schema--database-tables)
5. [Advanced SQL Operations](#-advanced-sql-operations)
6. [Normalization & Dependency Analysis](#-normalization--dependency-analysis)
7. [Concurrency Control & Recovery](#-concurrency-control--recovery)
8. [Results & Frontend Screenshots](#-results--frontend-screenshots)
9. [Discussion](#-discussion)
10. [How to Run](#-how-to-run)

---

## 🧾 Abstract

The Blood Bank Management System (BBMS) automates and manages donor registration, blood stock inventory, and recipient matching using a centralized database. It improves workflow, reduces manual errors, and provides secure, real-time access to essential data for blood bank personnel and donors.

---

## ❗ Problem Statement

Blood banks often rely on manual processes, leading to inefficiencies, errors, and delays in blood availability. BBMS addresses these challenges through a centralized, automated system that enables real-time tracking, efficient donor management, and secure record keeping.

---

## 🧩 ER Model & Entity Relationships

Key entities include: `Donor`, `Recipient`, `BloodSpecimen`, `BloodBank`, `Manager`, `Appointment`

- Full and partial relationships are modeled accurately.
- One-to-one, one-to-many, and many-to-many relationships are implemented via foreign keys.

![ER Diagram](docs/fig(a).png)

---

## 🗃️ Relational Schema & Database Tables

Each table is created with appropriate constraints to maintain data integrity.

- `donor(did, name, dob, sex, address, phno)`
- `receptionist(emp_id, name, address, phno)`
- `bloodbank(bloodtype, issues, orders)`
- `blood(code, bloodtype, cost)`
- `blood_transaction(transaction_id, donor_id, bloodtype, quantity, transaction_date)`
- `blood_transaction_log(log_id, transaction_id, action_type, action_date)`

**Table Creation Screenshots:**

![Table 1](doc/fig(b).png)
![Table 2](doc/fig(c).png)
![Table 3](doc/fig(d).png)
![Table 4](doc/fig(e).png)

---

## 🧠 Advanced SQL Operations

Demonstrated use of:

- Inner, Left, and Self Joins
- Union operations
- Views (e.g., `blood_inventory`)
- Cursors and Triggers (e.g., transaction log trigger)
- Insert, Update, Delete operations with constraints

**Example Tables:**

![Donor Table](doc/fig(f).png)
![Receptionist Table](doc/fig(g).png)
![Blood Table](doc/fig(h).png)
![Blood Bank Table](doc/fig(i).png)
![Blood Transaction Table](doc/fig(j).png)
![Blood Transaction Log](doc/fig(k).png)

---

## 🧮 Normalization & Dependency Analysis

- **1NF**: Ensured atomic fields (e.g., single phone number per row)
- **2NF**: Removed partial dependencies (e.g., city/state from address)
- **3NF**: Eliminated transitive dependencies via normalization

**Illustrations:**

![Donor Table - Normal](doc/fig(l).png)
![1NF Violation](doc/fig(m).png)
![2NF Violation](doc/fig(n).png)
![Normalized Doctors Table](doc/fig(o).png)
![Normalized Address Table](doc/fig(p).png)

---

## 🔒 Concurrency Control & Recovery

Mechanisms implemented:

- **Two-Phase Locking (2PL)**
- **Timestamp Ordering**
- **Optimistic Concurrency Control**
- **Write-Ahead Logging (WAL)**
- **Checkpointing**, **Undo/Redo**, and **Shadow Paging**

**Visuals:**

![Transaction Table](doc/fig(q).png)
![Transaction Log](doc/fig(r).png)
![Donor Snapshot 1](doc/fig(s).png)
![Donor Snapshot 2](doc/fig(t).png)
![Donor Snapshot 3](doc/fig(u).png)
![Donor Snapshot 4](doc/fig(v).png)

---

## 📊 Results & Frontend Screenshots

| Page | Screenshot |
|------|------------|
| User Signup | ![Signup](doc/fig(w).png) |
| Admin Login & Donation Confirm | ![Login & Confirm](doc/fig(x)_fig(y).png) |
| Admin Dashboard | ![Dashboard](doc/fig(z).png) |

---

## 🗣️ Discussion

### 🔧 Key Features

- Donor Management & Scheduling
- Blood Inventory Monitoring
- Recipient Matching
- Screening & Test Logging
- Reporting and Analytics

### ✅ Benefits

- Real-time inventory status
- Improved donor engagement
- Automated alerts and safer operations

### ⚠️ Challenges

- Ensuring data privacy & HIPAA compliance
- Integration with hospital systems
- Infrastructure for real-time access

### 🚀 Future Enhancements

- Mobile apps for donor appointments
- Blockchain for donor traceability
- AI-based demand prediction

---

## 🛠️ How to Run

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/Bloodbank-Management-System.git
