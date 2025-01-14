# to alter the column name of example table
alter table example 
rename column name to _name;

#creating duplicate table or back up table of example table 
create table replica_example as select *  from example;

#see replica table
select * from replica_example 