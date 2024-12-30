# default constraints 
-- this constraint provide a default value to columns

create table employee_details(
	em_id int unique,
	department varchar(20) not null,
	salary int default 25000
);

insert into employee_details
values(1,'Technical',null),
(2,'management',30000);

insert into employee_details(em_id,department)
values(4,'Technical'); 

select * from employee_details;

# when table already exists 
alter table employee_details
modify department varchar(20) default 'staff';

#enter only em_id and other column have their default values 
insert into employee_details(em_id)
values(6); 
select * from employee_details;