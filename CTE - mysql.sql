create database windowfunc;
use windowfunc;
CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);
truncate table EmployeeSalaries;

INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'HR'),
(3, 'Charlie', 55000, 'HR'),
(4, 'David', 75000, 'Finance'),
(5, 'Eve', 80000, 'Finance'),
(6, 'Frank', 72000, 'Finance'),
(7, 'Grace', 90000, 'IT'),
(8, 'Heidi', 95000, 'IT'),
(9, 'Ivan', 87000, 'IT');

-- first_Value function
select * from EmployeeSalaries ;
# minimum salary in the dataset
select *, first_value(salary) over(order by salary asc) as min_salary 
from EmployeeSalaries; 

# add new column where employee name should be shown having min slry.
select *, first_value(EmployeeName) over (order by salary asc)  as empl_min_slry from EmployeeSalaries as min_info ;

# employee name, min salary having minimum salary 
select *, first_value(EmployeeName) over (order by salary asc)  as empl_min_slry ,
 first_value(salary) over(order by salary asc) as min_salary 
from EmployeeSalaries as min_info ;

# first_value function with partition by clause 
# employeeid having lowest salary in their department 
 select *, first_value(EmployeeID) over(partition by department order by salary)  as department_by_salary
from EmployeeSalaries;
# employeeid having highest salary in their department 
 select *, first_value(EmployeeID) over(partition by department order by salary desc)  as department_by_salary
from EmployeeSalaries;

select *, first_value(EmployeeID) over(partition by department order by salary desc)  as department_by_hsalary,
first_value(EmployeeName) over(partition by department order by salary desc)  as emp_name_hsalary
from EmployeeSalaries;

# last value function 
-- incorrect query 
# add a column in which name of employee should be shown who having the lowest salary
select *, last_value(EmployeeName) over (order by salary asc)  as lowest_salary from EmployeeSalaries;

select *, last_value(salary) over (order by salary)  as lowest_salary from EmployeeSalaries;

-- corrected query 
# add a column in which name of employee should be shown who having the lowest salary

select *, last_value(EmployeeName) over (order by salary desc rows between unbounded preceding and unbounded following)  as emp_lowest_salary from EmployeeSalaries;

# add a column in which salary should be shown which is the lowest salary
select *, last_value(salary) over (order by salary desc rows between unbounded preceding and unbounded following)  as lowest_salary from EmployeeSalaries;

# # add a column in which both name of employee and salary should be shown.
select *, last_value(salary) over (order by salary desc rows between unbounded preceding and unbounded following)  as lowest_salary,
last_value(EmployeeName) over (order by salary desc rows between unbounded preceding and unbounded following)  as emp_lowest_salary
 from EmployeeSalaries;

# use partition by clause with last_value function
# add a column in which salary should be shown which is the lowest salary by department.
select * , last_value(salary) over (partition by department order by salary desc rows between unbounded preceding and unbounded following) as lowsal_dep
from EmployeeSalaries ;

# add a column in which salary should be shown which is the highest salary by department.
select *, last_value(salary) over (partition by department order by salary asc rows between unbounded preceding and unbounded following) as highsal_dep from EmployeeSalaries;


# add a column in which employeename should be shown who is having the lowest salary by department.
select * , last_value(EmployeeName) over (partition by department order by salary desc rows between unbounded preceding and unbounded following) as emp_lowsal_dep 
from EmployeeSalaries;

# add a column in which employeename should be shown who is having the highest salary by department.
select * , last_value(EmployeeName) over (partition by department order by salary asc rows between unbounded preceding and unbounded following) as  emp_highsal_dep from EmployeeSalaries;

# add a column in which employeename should be shown who is having the highest salary by department and also 
# add a column in which salary should be shown which is the highest salary by department .
select * , 
last_value(EmployeeName) over (partition by department order by salary asc rows between unbounded preceding and unbounded following) as emp_highsal_dep ,
last_value(Salary) over (partition by department order by salary asc rows between unbounded preceding and unbounded following) as highsal_dep 
from EmployeeSalaries;

# add a column in which employeename should be shown who is having the lowest salary by department and also 
# add a column in which salary should be shown which is the lowest salary by department .
select * , 
last_value(EmployeeName) over (partition by department order by salary desc rows between unbounded preceding and unbounded following) as emp_lowsal_dep ,
last_value(Salary) over (partition by department order by salary desc rows between unbounded preceding and unbounded following) as lowsal_dep 
from EmployeeSalaries;

# Common Table Expression  (CTE) : is a temporary result that you can reference within a select, insert , update, or delete statement 
# CTE's are defined using the 'with' keyword and they can make complex queries easier to write, umderstand and maintain by breaking them into 
# simpler parts.
use sql_basics_questions;
select * from Employees;
# we dont want to disturb the main table 
# we will make a hash table that will be the replica of original table 
create table replica_Employees as select * from Employees;
select * from replica_Employees;

# CTE syntax
With C as ( 
select * from replica_Employees
)
select * from C;

# example for cte 
with exmpl_cte as (
select * from replica_Employees where EmployeeID in (1,2,3)
)
select * from exmpl_cte;

# from cte make a hash table named 'dupli_cte'
create table dupli_cte as
with exmpl_cte as (
select * from replica_Employees where EmployeeID in (1,2,3)
)
select * from dupli_cte;

# update and delete statements

# to run update dlt commands , safemode should be off
set sql_safe_updates = 0;

# que- we want to update employeeid = 101 whre employeeid is 2 4 6
with cte1 as (
select * from dupli_cte where EmployeeID in (2,4,6)
)
update dupli_cte set employeeid = 101 where employeeid in (select distinct employeeid from cte1);
select * from dupli_cte;
# delete 
with cte2 as (
select * from dupli_cte where EmployeeID  = 1
)
delete from dupli_cte where EmployeeID in (select  distinct employeeid from cte2);
select * from dupli_cte;

# on the safe mode
set sql_safe_updates = 1;




 


