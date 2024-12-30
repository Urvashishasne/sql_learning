use learning;

create table test_notnull(
	e_id int not null,
    age tinyint ,
    firstname varchar(256) 
);
#not null while creating table
insert into test_notnull (e_id,firstname,age)
values 
(102,'Aditya',26),
(19,'urvi',20),
(178,'akashi',21),
(52,'prema',32),
(202,'yukti',22),
(12,'karma',24),
(13,'Arundhati',24);

select * from test_notnull;
# when table already exists - we want to make column as not null - with alter we are using modify here .
ALTER TABLE test
MODIFY COLUMN firstname VARCHAR(256) NOT NULL;

# when a column has already null values you can not modify it with not null constraints
#chnge constraint to unique - age column

alter table test_notnull
modify column age tinyint unique;
# since it already contains duplicates , it cant be unique 
#  changing e_id to unique
alter table test_notnull
modify column e_id int unique; #  it is done 
