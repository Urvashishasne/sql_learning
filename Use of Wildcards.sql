use sales;
#use sql Like Operator
# wildcards
#1 % - it represent zero or multiple chracter
#2 _ - it exactly represent only 1 character

SELECT * from wallmart;

#q1.find city whose name starts with 'y'
SELECT * from wallmart where City like 'y%';

#q2.find city whose name ends with 'y'
SELECT * from wallmart where City like '%y';

#q3.find city whose name ends with 'n'
SELECT * FROM wallmart Where City like '%n';

#q4. find city who contains 'n'
SELECT * FROM wallmart where City like '%n%';

#q4. find city who contains 'na'
SELECT * FROM wallmart where City like '%na%';

#q5. find city whose name is exactly 8 character long.
select * from wallmart where City like '________';

#second letter in city is 'a'.
SELECT * FROM wallmart WHERE City LIKE '_a%';

#q6 name starts with either 'N' or 'M'
select * from wallmart where City like 'n%' or City like'm%'

