# check constraints 
-- it checks for certain conition that can be applied on column of tale if this condition is nkot fulfilled we will not be able to insert the 
-- record into table. 

# 1 - when table doesn't exists - we will apply check constraints while creating table 
create table test_check(
EID int ,
firstname varchar(256),
age tinyint check (age>18)
);

insert into test_check
values(1,'Shivapriya',25),
(2,'anjali',19);
# if we put age<18 it will throw error 
insert into test_check 
values (3,'aravi',10);

# 2 - when table does exists , applying check constraints in EID column
alter table test_check
modify EID int check (eid<10);
# if there was a row which has EID value > 10 , then this query will thhrow an error.
