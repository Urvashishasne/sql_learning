# is null and coaleasce functions

use sql_basics_questions;
select * from Customers_details;
-- is null
-- If expression is NULL, this function returns 1. Otherwise, it returns 0.
SELECT IsNULL(null);

-- COALESCE function in MySQL is used to return the first non-NULL value from a list of arguments. This function is particularly useful 
-- when dealing with NULL values in your database and you want to substitute them with a default value or another column's value.

select coalesce(null,'b','c');

-- ifnull(column, repalcement)
select Customerid, email, phonenumber from customers_details;
select Customerid, ifnull(email,'Email NA' ), ifnull(phonenumber, 'ph no NA') from customers_details;

-- we want to return email but if it is null, then phone no. should be returned if  both are null then return NA
select Customerid, coalesce(email, phonenumber, 'Contact NA') as contact from customers_details;