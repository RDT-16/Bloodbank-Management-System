# Bloodbank-Management-System

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
11. [License](#-license)

---

## 🧾 Abstract

The Blood Bank Management System (BBMS) automates and manages donor registration, blood stock inventory, and recipient matching using a centralized database. It improves workflow, reduces manual errors, and provides secure, real-time access to essential data for blood bank personnel and donors.

---

## ❗ Problem Statement

Blood banks struggle with manual processes, lack of real-time tracking, and disjointed systems, leading to donor mismatch, blood wastage, and administrative inefficiency. BBMS solves this by offering a digital platform that centralizes all operations and automates core workflows.

---

## 🧩 ER Model & Entity Relationships

Key entities include:
- `Donor`, `Recipient`, `BloodSpecimen`, `BloodBank`, `Manager`, `Appointment`

Relationship highlights:
- Full and partial relationships are mapped to real-world interactions.
- Many-to-many, one-to-many, and one-to-one relations are handled using foreign keys and junction tables.

📸 *ER Diagram located in* `/docs/ER_Diagram.png`

---

## 🗃️ Relational Schema & Database Tables

Each table is designed with constraints to ensure data integrity:

- `donor(did, name, dob, sex, address, phno)`
- `receptionist(emp_id, name, address, phno)`
- `bloodbank(bloodtype, issues, orders)`
- `blood(code, bloodtype, cost)`
- `blood_transaction(transaction_id, donor_id, bloodtype, quantity, transaction_date)`
- `blood_transaction_log(log_id, transaction_id, action_type, action_date)`

Refer to `/database/schema.sql` for full table creation scripts.

---

## 🧠 Advanced SQL Operations

The project showcases:
- ✅ **Inner Join**, **Left Join**, **Self Join**, **UNION**
- 🔁 **Cursors** for conditional updates
- ⚡ **Triggers** for auto-logging transactions
- 👁️ **Views** like `blood_inventory` for summarized insights
- 🔄 **Insert, Update, Delete** operations with constraints

---

## 🧮 Normalization & Dependency Analysis

Normalization applied:
- **1NF**: Removed repeating groups, ensured atomicity
- **2NF**: Removed partial dependencies
- **3NF**: Eliminated transitive dependencies via an `address` table

Example:
- `Donor` table normalized by extracting address details and storing them in a linked table.

---

## 🔒 Concurrency Control & Recovery

Implemented mechanisms include:
- **Two-Phase Locking (2PL)**
- **Timestamp Ordering**
- **Optimistic Concurrency**
- **Write-Ahead Logging (WAL)**
- **Checkpointing**, **Undo/Redo**, and **Shadow Paging**

These ensure consistency even during system failures or concurrent transactions.

---

## 📊 Results & Frontend Screenshots

UI pages developed:
| Page | Screenshot |
|------|------------|
| User Signup | ![Signup](docs/screenshots/user_signup.png) |
| Admin Login | ![Login](docs/screenshots/admin_login.png) |
| Donation Confirmation | ![Confirmation](docs/screenshots/donation_confirm.png) |
| Admin Dashboard | ![Dashboard](docs/screenshots/admin_dashboard.png) |

The UI is responsive, intuitive, and integrated with backend logic.


## 🗣️ Discussion:
## 🔧 Components
- Donor Management
- Inventory Monitoring
- Recipient Matching
- Testing & Screening
- Reporting & Analytics

## ✅ Benefits
- Real-time blood stock visibility
- Better donor engagement
- Safer transfusion management

## ⚠️ Challenges
- Data security
- HIS/EHR integration
- Regulatory compliance

## 🚀 Future Scope
- Mobile donor apps
- AI-based forecasting
- Blockchain for traceability

## 🛠️ How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/RDT-16/Bloodbank-Management-System.git
