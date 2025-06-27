-- Create Database
CREATE DATABASE OnlineBookstore;

-- Switch to the database
use OnlineBookstore

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers order by name asc;
SELECT * FROM Orders;


-- import the data using data wizard


-- 1) Retrieve all books in the "Fiction" genre:

select Book_ID, Title 
from books 
where Genre = 'Fiction'

-- 2) Find books published after the year 1950:

select title 
from Books
where Published_year > 1950


-- 3) List all customers from the Canada:

select Customer_ID, Name 
from customers
where country = 'Canada'

-- 4) Show orders placed in November 2023:

select order_id 
from orders 
where order_date >= '2023-11-01' and order_date <= '2023-11-30'


-- 5) Retrieve the total stock of books available:

select b.book_id , ifnull((b.stock - o.quantity),'All Sold') as stock_available
from books b
left join orders o
on
b.book_id = o.Book_id

-- 6) Find the details of the most expensive book:

SELECT *
FROM books
WHERE Price = (SELECT MAX(Price) FROM books);


-- 7) Show all customers who ordered more than 1 quantity of a book:

select distinct customer_id , book_id, quantity 
from orders
where quantity > 1

SELECT customer_id
FROM orders
WHERE quantity > 1
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:

select Order_id 
from orders 
where total_amount > '20'

-- 9) List all genres available in the Books table:
select distinct genre
from books

-- 10) Find the book with the lowest stock:
select book_id, title, stock 
from books
order by stock asc
limit 10

-- 11) Calculate the total revenue generated from all orders:

select sum(total_amount) as Total_revenue
from orders

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT 
  b.Genre, 
  SUM(o.Quantity) AS books_sold_by_genre
FROM books b
JOIN orders o ON b.book_id = o.book_id
GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:

select avg(price) as Avg_price
from books
where genre = 'Fantasy'

-- 3) List customers who have placed at least 2 orders:

select c.name
from customers c
left join orders o
on c.customer_id = o.customer_id
where 
o.quantity >=2
group by c.name

-- 4) Find the most frequently ordered book:



-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

select title, price
from books
where genre = 'Fantasy'
order by price desc
limit 3

-- 6) Retrieve the total quantity of books sold by each author:

SELECT 
  b.author, 
  SUM(o.Quantity) AS books_sold_by_author
FROM books b
JOIN orders o ON b.book_id = o.book_id
GROUP BY b.author;

-- 7) List the cities where customers who spent over $30 are located:

select c.city 
from customers c
left join orders o 
on
c.customer_id = o.order_id
where o.total_amount > 30
group by c.city


-- 8) Find the customer who spent the most on orders:

select c.customer_id, o.quantity , o.total_amount
from customers c
left join orders o
on c.customer_id = o.customer_id
order by o.total_amount desc
limit 10



-- 9) Calculate the stock remaining after fulfilling all orders:

select b.book_id , b.stock, o.quantity ,ifnull((b.stock - o.quantity),'All Sold') as stock_remaining
from books b
left join orders o
on
b.book_id = o.Book_id






