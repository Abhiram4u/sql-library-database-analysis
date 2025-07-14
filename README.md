# 📚 Library Management SQL Analysis

## 🧠 Objective
To design and analyze a relational database for a library system using SQL. This project involves understanding borrowing trends, book availability, and branch-level activity through SQL queries.

---

## 🛠️ Tools & Technologies
- SQL (MySQL/PostgreSQL)
- DBMS Concepts (Joins, Aggregations, Subqueries)
- ER Modeling
- DBeaver / MySQL Workbench (for query execution)

---

## 🗃️ Database Schema

The database is designed with the following tables:

- `Author`
- `Books`
- `Publisher`
- `Library_Branch`
- `Book_Copies`
- `Borrower`
- `Book_Loans`

### 🧩 ER Diagram
![ER Diagram](er_diagram.png)

---

## 🔍 Key Analysis Performed

### 1️⃣ Top 5 Borrowed Books
```sql
SELECT B.Title, COUNT(*) AS Times_Borrowed
FROM Book_Loans BL
JOIN Book_Copies BC ON BL.BookID = BC.BookID
JOIN Books B ON B.BookID = BC.BookID
GROUP BY B.Title
ORDER BY Times_Borrowed DESC
LIMIT 5;
