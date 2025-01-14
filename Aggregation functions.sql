# find maximum amount from each payment method .
use sales;
select * from wallmart;
select sum(total) as total_payment_amount from wallmart;
select avg(quantity) as average_quantity from wallmart;
select payment ,max(total) as maximum_amount from wallmart
group by payment;


#maximum quantity from  each city 
SELECT max(quantity),City from wallmart 
group by City;

# Sum of quantity , sum of total amount , avg of quantity,avg of total amount for each distinct product line
select `Product line`, avg(quantity) as average_quantity_sold , sum(quantity)  as total_quantity_sold, sum(total) as total_amount , avg(total) as average_amount from wallmart 
group by `Product line`;

# which product line has maximum total amount
# Sum of quantity , sum of total amount , avg of quantity,avg of total amount for each distinct product line
 
select max(total_amount) from 
(select `Product line`, avg(quantity) as average_quantity_sold , sum(quantity)  as total_quantity_sold, sum(total) as total_amount , avg(total) as average_amount from wallmart 
group by `Product line`) as table1;

#self join 
select * from wallmart as A 
inner join wallmart as B
on A.city = B.city;


#union and union all operator 
use quest;
# union will not select the duplicate records
select * from customer_det
union 
select * from payment;
# in union all we can also have th duplicates 
select * from customer_det
union all
select * from payment
