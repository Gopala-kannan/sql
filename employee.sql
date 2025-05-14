use dummy;

create table employee(
id int,
name varchar(100),
position varchar(100),
salary int
);

insert into employee values(1, "John Doe", "HR", 55000);
insert into employee values(2, "Jane Smith", "IT", 60000);
insert into employee values(3, "Alice Williams", "IT", 62000);
insert into employee values(4, "Bob Johnson","HR", 58000);
insert into employee values(5, "Eva Davis", "Finance", 58000);
insert into employee values(6, "Mike Brown", "Finance", 59000);

-- or --

INSERT INTO employee (id, name, position, salary) 
VALUES
	(1, "John Doe", "HR", 55000),
	(2, "Jane Smith", "IT", 60000),
	(3, "Alice Williams", "IT", 62000),
	(4, "Bob Johnson","HR", 58000),
	(5, "Eva Davis", "Finance", 58000),
	(6, "Mike Brown", "Finance", 59000);

delete from employee;

select * from employee;
select * from employee order by name asc;
select * from employee where position="IT" order by salary desc;
select count(name),position from employee group by position; -- HR = 2, IT = 2, Finance = 2 --
select count(*),position from employee group by position; -- same ^
select avg(salary),position from employee group by position order by position;


select avg(salary),position from employee group by position order by avg(salary) desc limit 1; -- find highest salary -- use desc


select avg(salary),position 
from employee group by position 
order by avg(salary) asc
limit 1; -- find lowest salary -- use asc


-- having clause

use dummy;
select * from employee;
select count(*),position from employee group by position;

select avg(salary),position from employee group by position having avg(salary)<60000;
select avg(salary),position from employee group by position having avg(salary)>55000;
