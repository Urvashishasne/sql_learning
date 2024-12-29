use learning;

# Primary key 
-- use primary key constraint while creating table

create table makeprimary(
	person_id int primary key,
    person_name varchar(20) not null
);

-- how to drop a table
drop table makeprimary;
-- use primary key constraint when table is already created
create table makepr(
	person_id int ,
    person_name varchar(20) not null
);
 -- make person_id column as primary key 
alter table  makepr
 modify column person_id int primary key;
 # insert some data 
insert into makepr
values (1,'Mayank'),
(2,'Mahi'),
(3,'shivani');

# foreign key constraint- while creating table
create table foreignk(
	person_id1 int, # first we have to declare foregin key variable 
	foreign key (person_id1) references makepr(person_id), # make variable as FK 
    first_name varchar(20) not null,
    last_name varchar(20) not null
);

insert into foreignk
values (1,'mayank','chadha'),
(null,'Mahi','jaiswal'),
(3,'shivani','deshmukh');
# foreign key's value must be subset of pk 
# foreign key's value can be null and duplicate
select * from makepr;
select * from foreignk;

#table already exist and we have to define column as foreign key
create table fk2(
id int,
course varchar(25)
);

# alter the column of table as foregin key 
ALTER TABLE fk2
ADD CONSTRAINT id
FOREIGN KEY (id)
REFERENCES makepr(person_id);
