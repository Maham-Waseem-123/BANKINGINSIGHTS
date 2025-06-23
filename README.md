
# 💼 Banking Insights: Advanced SQL Analysis and Power BI Dashboard

A complete end-to-end project combining **SQL** and **Power BI** to deliver valuable insights into banking operations, including **customer behavior**, **loan performance**, **transaction patterns**, and **employee efficiency**.

---

## 📘 Project Overview

In this project, you take on the role of a **Data Analyst** at a commercial bank. Your task is to:
- Design a relational database
- Perform advanced SQL analysis
- Build an interactive Power BI dashboard

The goal is to help stakeholders make data-driven decisions using real-time KPIs and visual insights.

---

## 🎯 Objectives

✅ Store and manage banking data in a **relational SQL database**  
✅ Apply **advanced SQL techniques**: joins, subqueries, procedures, triggers, aggregations  
✅ Create an interactive **Power BI dashboard** displaying key banking metrics  
✅ Deliver a complete analytical solution from raw data to dashboarding

---

## 🧱 Database Schema

The project consists of **6 interrelated tables**:

1. **Customers**
   ```sql
   customer_id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(100),
   gender CHAR(1),
   dob DATE,
   city VARCHAR(50),
   email VARCHAR(100),
   created_at DATE
   ```

2. **Accounts**
   ```sql
   account_id INT PRIMARY KEY AUTO_INCREMENT,
   customer_id INT,
   account_type VARCHAR(20),
   balance DECIMAL(12,2),
   created_at DATE,
   FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
   ```

3. **Transactions**
   ```sql
   transaction_id INT PRIMARY KEY AUTO_INCREMENT,
   account_id INT,
   amount DECIMAL(12,2),
   transaction_type VARCHAR(20), -- 'Credit' or 'Debit'
   transaction_date DATE,
   FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
   ```

4. **Loans**
   ```sql
   loan_id INT PRIMARY KEY AUTO_INCREMENT,
   customer_id INT,
   loan_type VARCHAR(20),
   loan_amount DECIMAL(12,2),
   issue_date DATE,
   status VARCHAR(20),
   FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
   ```

5. **Employees**
   ```sql
   employee_id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(100),
   designation VARCHAR(50),
   salary DECIMAL(10,2),
   joining_date DATE,
   branch VARCHAR(50)
   ```

6. **Loan_Approvals**
   ```sql
   approval_id INT PRIMARY KEY AUTO_INCREMENT,
   loan_id INT,
   employee_id INT,
   approved_date DATE,
   FOREIGN KEY (loan_id) REFERENCES Loans(loan_id),
   FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
   ```

---

## 🔢 Sample Data

Each table includes **20 manually inserted rows** using SQL scripts to simulate realistic banking data.

---

## 🧠 SQL Tasks Performed

### 📊 Data Analysis Queries:
- Top 5 cities with the highest number of customers
- Total loan amount issued by loan type
- Customers with more than 2 accounts
- Average transaction amount per account type
- Rank branches based on total employee salaries
- Customers with no transactions in the past 30 days
- Gender-wise customer count per city

### 🔄 Joins, Subqueries, Views:
- Loan details with approving employee name
- Employees who approved the most loans
- Customers with balance below average

### ⚙️ Stored Procedures & Triggers:
- Procedure to retrieve high-value customers (balance > 1M)
- BEFORE INSERT trigger to restrict negative balances
- Procedure to count total active loans using OUT parameter

---

## 📊 Power BI Dashboard

### ✅ KPI Cards:
- Total number of customers  
- Total loan amount issued  
- Total transaction volume  

### 📈 Visuals:
- **Pie Chart:** Loan status distribution  
- **Bar Chart:** Transaction type per account  
- **Line Chart:** Monthly loan issuance trends  
- **Map:** Geographic customer distribution  
- **Data Table:** Customer name, number of accounts, total balance, last transaction date  

---

## 📂 Project Deliverables

| File | Description |
|------|-------------|
| `banking_database.sql` | SQL script with table creation and 20 sample records per table |
| `banking_dashboard.pbix` | Power BI dashboard file |
| `screenshots/` | Folder with snapshots of stored procedures, triggers, and query results |
| `README.md` | Project documentation (this file) |
| `insights_report.pdf` _(optional)_ | Summary report highlighting findings and dashboard interpretation |

---

## 🚀 Getting Started

### 1. Run the SQL Script
- Use MySQL or any SQL engine
- Execute `banking_database.sql` to create and populate tables

### 2. Open the Power BI Dashboard
- Open `banking_dashboard.pbix` in Power BI Desktop
- Ensure your SQL Server or MySQL connection is live

---

## 📌 Skills Demonstrated

- Relational Database Design  
- Advanced SQL (joins, subqueries, views, procedures, triggers)  
- Power BI Dashboard Design  
- Data Modeling & Reporting  
- Banking Domain Analytics  

---

## 📎 License

This project is released under the [MIT License](LICENSE).

---

## 🤝 Connect

If you find this project useful or have suggestions, feel free to open an issue or connect with me on [LinkedIn](#)!
