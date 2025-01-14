use sql_basics_questions;
# questions are after the table creation-
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004),
(106, 3, '2024-08-05', 1003);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);


# questions on joins: 
use sql_basics_questions;

select * from Customers;
select * from Orders;
select * from Products;

-- more questions on join
-- 1 identify pairs of customers who live in the same country. 
select x.CustomerName, y.CustomerName from customers x join Customers y on x.country = y.country and x.CustomerID <> y.CustomerID and x.CustomerID>y.customerID;

-- 2 find the customer who has spent the most on their orders.
select c.CustomerId,c.CustomerName, sum(p.Price) as Total_spent from Customers c join 
orders o on o.CustomerID=c.CustomerID 
join Products p on p.ProductID = o.ProductID
group by c.CustomerID,c.CustomerName;

select CustomerName from (select c.CustomerId,c.CustomerName, sum(p.Price) as Total_spent, dense_rank() over(order by sum(Price) desc) as Dr
from Customers c join 
orders o on o.CustomerID=c.CustomerID 
join Products p on p.ProductID = o.ProductID
group by c.CustomerID,c.CustomerName) as A 
where Dr = 1 ; 

-- 3 find the customer who have ordered more than one type of product
# customer name 
select c.CustomerName as number_product from customers c join Orders o on o.CustomerID=c.CustomerID 
group by c.CustomerName 
having count(distinct ProductID)>1; 

# list all products and their corresponding orders, using a right join including products that have never been ordered.
select b.ProductID,b.ProductName,a.OrderID from orders a right join products b on a.ProductID=b.ProductID;

# retrieve all orders placed by customers from the USA.
select o.OrderID, c.CustomerName from Customers c join orders o on o.CustomerID=c.CustomerID
where Country='USA';

#find the names of customers who have ordered a product priced above $500.
select distinct c.CustomerName from customers c inner join Orders o on o.CustomerID =c.CustomerID
inner join products p on p.ProductID=o.ProductID
where p.Price>500;


# find customers who have ordered the same product more than once.
select c.CustomerName  from customers c inner join orders o on o.CustomerId = c.CustomerID
group by CustomerName
having count(OrderId)>1 ;
# customerId and Product Id having - Count(orderid)>1
select c.CustomerID, o.ProductID, c.customerName from customers c inner join orders o on o.CustomerId = c.CustomerID
group by CustomerID, o.ProductID
having count(OrderId)>1 ;

# output should be  name
select distinct CustomerName from (select c.CustomerID, o.ProductID, c.customerName from customers c inner join orders o on o.CustomerId = c.CustomerID
group by CustomerID, o.ProductID
having count(OrderId)>1 ) as A
