create database assignments;
use assignments;

CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    Department VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO EmployeeSales (SaleID, EmployeeID, Department, SaleAmount, SaleDate)
VALUES 
(1, 101, 'Electronics', 500.00, '2023-08-01'),
(2, 102, 'Electronics', 300.00, '2023-08-03'),
(3, 101, 'Furniture', 150.00, '2023-08-02'),
(4, 103, 'Electronics', 250.00, '2023-08-04'),
(5, 104, 'Furniture', 200.00, '2023-08-02'),
(6, 101, 'Furniture', 450.00, '2023-08-05'),
(7, 102, 'Electronics', 700.00, '2023-08-05'),
(8, 103, 'Furniture', 100.00, '2023-08-06');
-- SaleID (INT PRIMARY KEY): Unique identifier for each sale.
#EmployeeID (INT): Identifier for the employee who made the sale.
-- Department (VARCHAR(50)): Name of the department where the sale was made.
-- SaleAmount (DECIMAL(10, 2)): Total amount of the sale.
-- SaleDate (DATE): Date when the sale occurred.

-- Questions for this assignment
select * from EmployeeSales;
#Write a query to calculate the total sales amount for each department in the EmployeeSales table.
SELECT department,sum(SaleAmount) as total_sales FROM EmployeeSales 
group by department;

#Write a query to count the number of sales made by each employee.
select EmployeeID,count(SaleID) as Number_of_sales_by_employee from EmployeeSales group by EmployeeID;

#Write a query to calculate the average sale amount for each department.
select department, avg(SaleAmount) as Average_Sale_department from EmployeeSales group by department;

#Write a query to find the total sales amount for each employee, but only include employees who have made more than one sale.
SELECT 
    EmployeeID, total_sale_amount, No_of_Sale_per_Employee
FROM
    (SELECT 
        EmployeeID,
            COUNT(SaleID) AS No_of_Sale_per_Employee,
            SUM(SaleAmount) AS total_sale_amount
    FROM
        EmployeeSales
    GROUP BY EmployeeID) AS A
WHERE
    No_of_Sale_per_Employee > 1;

#Write a query to find the total sales for each month in 2023.
select month(Saledate) as Month_of_year , count(SaleId) as no_of_sales from EmployeeSales
where Saledate between '2023-01-01' and '2023-12-31'
group by month(Saledate);
