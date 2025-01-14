use learning ;
select * from students;
# we have to use over() for all sql functions

# assign row number to each of the records based on marks which be sorted in desc order
# row_number() assign a serial number 
select * , row_number() over(order by marks desc) as row_no from students ;
# row_number() assign a serial number 
#rank functin give rank 
# in case of rank function is there is tie than the serial number will be skiped 
select *, rank() over(order by marks desc) as rank_ed 
from students;
# if tie occur - rank will not be skiped
select *, dense_rank() over(order by marks desc) as drenk_ed
from students;

# partition by with this functions
select *,Row_number() over(partition by subject order by marks desc) as row_num
from students;

select * , row_number() over(partition by student_name order by subject) as r_num
from students;

select * ,rank() over(partition by subject order by marks desc) as r_num_rank
from students;

select *,rank() over(partition by student_name order by marks desc) as r_num_rank
from students;

select *,dense_rank() over(partition by subject order by marks asc) as den_rank
from students;

#lead function  - window function
use profit_db;
select * from profitdata;

select *,lead(profit) over(partition by product order by monthnumber) as number_month from profitdata;




