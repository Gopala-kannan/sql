create schema pratice; -- create a schema --

use pratice; -- use the schema --

create table students(  -- create a table 
id int,
name varchar(100),
age int
); 

alter table students add column grade varchar(100);  -- add a new colum "grade" in students table
alter table students rename column grade to finalgrade; -- rename the grade to finalgrade

INSERT INTO students (id, name, age, finalgrade) -- insert the values
VALUES
	(101, "John Doe", 20, "A"),
    (102, "JaneSmith", 22, "B"),
    (103, "Bob Johnson", 19, "C"),
    (104, "Alice Brown", 21, "A"),
    (105, "Charilie Davis",20, "B"),
    (106, "Emma Wilson", 23, "A"),
    (107, "Michael Lee", 20, "C"),
    (108, "Olivia Moore", 19, "B"),
    (109, "William Turner", 21, "A"),
    (110, "Sophia Rodriguez", 22, "C");

update students set id=21 where id=101; -- update the id 101 to 21
delete from students where id=21; -- delete the 21 
select * from students where age>=19; -- retrieve all students aged 19 or older
select * from students where name="William Turner" or name="Alice Brown"; -- retrieve students named 'william Turner" or "Alice Brown"
-- or -- 
select * from students where name in ("William Turner","Alice Brown");

select * from students where finalgrade in ("A","B") and age>=20; 
-- or --
select * from students where finalgrade in ("A","B") having age>=20; -- retrieve students with finalgrades "A" or "B" aged 20 or order

select * from students where age between 20 and 25; -- -retrieve students aged between 20 and 25

select * from students where age<18; --retrieve students with age lessthan 18

select * from students where finalgrade>'B'; --retrieve students with finalgrades greather than B

select count(name) from students; -- count the total number of sudents
select avg(age) from students; -- calculate the average age for students
select avg(age) from students where finalgrade="A" or finalgrade="B"; --find the average of ages for students with finalgrades 'A' or 'B'

select count(finalgrade),finalgrade from students group by finalgrade order by finalgrade; --group students by finalgrade and count the number of students in each finalgrade
select avg(age),finalgrade from students group by finalgrade; --group students by age and calculate the average age in each group

insert into students values(112, "gopal", 22, "A"); -- add to new student

select count(*),finalgrade from students group by finalgrade order by count(*) desc limit 1; --find the finalgrade with the highest number of students
select sum(age) from students where finalgrade="A" or finalgrade="B";  --find the sum of ages for students with finalgrades 'A' or 'B'

select avg(age),finalgrade from students group by finalgrade having avg(age)>21; --find the finalgrade with an average age grether than 21

select count(name),finalgrade from students group by finalgrade having count(name)>3; --find finalgrade with an fewer than 3 students

select avg(age),finalgrade from students group by finalgrade having avg(age) between 20 and 25; --find finalgrade with an average age between 20 and 25

select * from students order by age asc; -- list all students in ascending order of age

select * from students where finalgrade="A" or finalgrade="B" order by age desc; -- list students with finalgrade 'A' or 'B' in descending order of age

select * from students order by finalgrade asc; -- sort students by finalgrade in alphabetical

drop table students; -- delete the students table

select * from students;

UPDATE Employee
SET FIRST_NAME = CONCAT(
    UPPER(LEFT(FIRST_NAME, 1)),
    LOWER(SUBSTRING(FIRST_NAME, 2))
); /* first litter only caps */
