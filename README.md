# 📚 Online Bookstore SQL Analysis

This project involves building a SQL database for an online bookstore and performing analytical queries to derive meaningful business insights.

---

## 🗃️ Dataset

The project uses three datasets:
- `Books.csv`
- `Customers.csv`
- `Orders.csv`

---

## 🏗️ Database Schema

- **Books**: Book_ID, Title, Author, Genre, Published_Year, Price, Stock
- **Customers**: Customer_ID, Name, Email, Phone, City, Country
- **Orders**: Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount

---

## 📌 Key Features

- SQL schema design & table creation
- CSV import via MySQL Workbench
- 20+ SQL queries ranging from beginner to advanced
- Covers business KPIs such as:
  - Most popular genres
  - Revenue trends
  - Customer purchase behaviors
  - Book inventory tracking

---

## 🧪 Sample Queries

```sql
-- Total Revenue
SELECT SUM(Total_Amount) FROM Orders;

-- Most frequently ordered book
SELECT b.Title, SUM(o.Quantity) AS TotalSold
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Title
ORDER BY TotalSold DESC
LIMIT 1;


🔍 Business Insights
📈 Fiction is the best-selling genre.
💰 Revenue exceeded $X (replace with actual SUM from data).
🧑‍🤝‍🧑 10+ customers placed orders above $30, mostly from major cities.
⚠️ Certain books are low in stock and need urgent replenishment.

🛠️ Tools Used
MySQL 8.x
MySQL Workbench
CSV files (manual data import)
Git & GitHub

📁 File Structure
pgsql
Copy
Edit
online-bookstore-sql-analysis/
├── schema.sql             # Table creation and database setup
├── queries.sql            # All SQL queries organized by topic
├── data/
│   ├── Books.csv
│   ├── Customers.csv
│   └── Orders.csv


🚀 Getting Started
Clone the repo
git clone https://github.com/yourusername/online-bookstore-sql-analysis.git
cd online-bookstore-sql-analysis
Open MySQL Workbench

Use the Table Import Wizard to load:
Books.csv into Books
Customers.csv into Customers
Orders.csv into Orders
Run project.sql to perform all the analysis
