use learning;
create table student_detail(
	Student_name varchar(100),
	Gender char(1),
    Age tinyint, 
    eve_date date,
    distance decimal(5,2)
);
 insert into student_detail(Student_name,Gender,Age,eve_date,distance)
 values 
 ('Urvashi Shasne','F',19,'2024-12-27',22.33),
  ('Shivapriya','F',20,'2024-12-27',25.43);
  
select * from student_detail;
#get the structure of table 
select * from INFORMATION_SCHEMA.COLUMNS where table_name like 'student_detail';

#inserting value in certain column 
insert into student_detail (Student_name,Gender)
values
('Khyati','F'),
('Akshita Khanna','F');
insert into student_detail (Student_name,Age)
values
('Shivam', 20),
('Akshay',21);
#getting know about data type of particular column
select * from INFORMATION_SCHEMA.COLUMNS where table_name like 'student_detail';

#copying data from existing table to new table
# also called backup table
select * from learning_detail; 
create table new_tablee_1 as select * from learning_detail;









