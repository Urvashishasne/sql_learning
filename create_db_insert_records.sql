create database learning ;
use learning;
create table customers(
	customer_id int primary key ,
    customer_name varchar(100),
    email varchar(100)
);
create table orders(
	order_id int primary key,
    customer_id int,
	order_date date ,
    amount	decimal(10,2),
    foreign key(customer_id) references customers(customer_id)
);
insert into orders(order_id,customer_id,order_date,amount)
values 
(5, 2, '2024-11-09',300 ),
(6,3,'2024-09-09',500);







