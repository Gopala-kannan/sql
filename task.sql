create database module;
use module;

create table Employee(
FIRST_NAME varchar(50),
LAST_NAME varchar(50),
SALARY int,
JOINING_DATE date,
DEPARTMENT varchar(50)
);

create table Incentives(
EMPLOYEE_REF_ID int not null auto_increment primary key,
INCENTIVE_DATE date,
INCENTIVE_AMOUNT int
);

select * from Employee;
select * from Incentives;
insert into Employee(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
values
	('John', 'Abraham', 1000000, '2013-01-01', 'Banking'),
    ('Michael', 'Clarke', 800000, '2013-01-01', 'Insurance'),
    ('Roy', 'Thomas', 700000, '2013-02-01', 'Banking'),
    ('Tom', 'Jose', 600000, '2013-02-01', 'Insurance'),
    ('Jerry', 'Pinto', 650000, '2013-02-01', 'Insurance'),
    ('Philip', 'Methew', 750000, '2013-01-01', 'Services'),
    ('Towino', 'Thomas', 650000, '2013-01-01', 'Services'),
    ('Leffin', 'Jose', 600000, '2013-02-01', 'Insurance');
    
insert into Incentives(INCENTIVE_DATE, INCENTIVE_AMOUNT)
values
	('2013-01-01',5000),
    ('2013-01-01',3000),
    ('2013-02-01',4000),
    ('2013-02-01',4500),
    ('2013-02-01',4500),
    ('2013-01-01',3500);
    
/* upper case */
update Employee set FIRST_NAME = upper(FIRST_NAME); 

/* lower case */
update Employee set FIRST_NAME = lower(FIRST_NAME);


/*unique department*/
select distinct DEPARTMENT from Employee;

/* first 3 characters */ 
select FIRST_NAME from Employee limit 3;

/* position 'o' */
select instr('john', 'o') from Employee;

/* removing space */
select rtrim(FIRST_NAME) FROM Employee; -- right side
select ltrim(FIRST_NAME) FROM Employee; -- left side

/* length */
select length(FIRST_NAME) from Employee;

/* replacing */
update Employee set FIRST_NAME = replace(FIRST_NAME, 'o', '$');
update Employee set FIRST_NAME = replace(FIRST_NAME, '$', 'o');
select FIRST_NAME from Employee;

/* concatenate */
select concat(FIRST_NAME,'_', LAST_NAME) from Employee;

/* joining year-month-date */

select FIRST_NAME, year(JOINING_DATE), month(JOINING_DATE), day(JOINING_DATE) from Employee;

/* ascending order */
select FIRST_NAME from Employee order by FIRST_NAME asc;

/* descending order */
select FIRST_NAME from Employee order by FIRST_NAME desc;

/* first_name ascending, salary descending order */
select FIRST_NAME, SALARY from Employee order by FIRST_NAME asc, SALARY desc;

select * from Employee where FIRST_NAME in ("John", "Roy");
select * from Employee where FIRST_NAME not in ("John", "Roy");

select * from Employee where FIRST_NAME like '___n' and length(FIRST_NAME) = 4;

select * from Employee where FIRST_NAME like 'J___' and length(FIRST_NAME) = 4;

select * from Employee where SALARY < 800000;

select * from Employee where SALARY between 500000 and 800000;

select * from Employee where FIRST_NAME in ("John", "Michael");

select * from Employee where year(JOINING_DATE) = '2013';
/* before */
select * from Employee where JOINING_DATE < '2013-01-01';
/* after */
select * from Employee where JOINING_DATE > '2013-01-31';

select JOINING_DATE from Employee;

/* milliseconds */
select DATE_FORMAT(JOINING_DATE, '%Y-%m-%d %H:%i:%s.%f') as date_and_time from Employee;

select Employee.JOINING_DATE
from Employee
left join Incentives on Employee.JOINING_DATE = Incentives.INCENTIVE_DATE;

select curdate();

select LAST_NAME from Employee where LAST_NAME like '%%%';

select replace(LAST_NAME,'a', '@') from Employee;

select replace(LAST_NAME,'[^a-zA-Z0-9]', ' ') from Employee;

/* average salary */
select DEPARTMENT, avg(SALARY) from Employee group by DEPARTMENT order by avg(SALARY) asc;

/* maximum salary */
select DEPARTMENT, max(SALARY) from Employee group by DEPARTMENT order by max(SALARY) asc;

/* minimum salary */
select DEPARTMENT, min(SALARY) from Employee group by DEPARTMENT order by min(SALARY) asc;

select year(JOINING_DATE),month(JOINING_DATE),count(*) 
from Employee 
group by year(JOINING_DATE),month(JOINING_DATE) 
order by year(JOINING_DATE),month(JOINING_DATE);

select DEPARTMENT, sum(SALARY) as Total_Salary 
from Employee where SALARY > 800000
group by DEPARTMENT order by Total_Salary desc;


alter table Employee add column id int not null auto_increment primary key;
select Employee.FIRST_NAME, Incentives.INCENTIVE_AMOUNT 
from Employee 
join Incentives on Employee.id = Incentives.EMPLOYEE_REF_ID
where Incentives.INCENTIVE_AMOUNT > 3000;

select Employee.FIRST_NAME, Incentives.INCENTIVE_AMOUNT 
from Employee 
left join Incentives on Employee.id = Incentives.EMPLOYEE_REF_ID
where Incentives.INCENTIVE_AMOUNT is null;

select Employee.FIRST_NAME, coalesce(Incentives.INCENTIVE_AMOUNT, 0) 
from Employee 
left join Incentives on Employee.id = Incentives.EMPLOYEE_REF_ID
where Incentives.INCENTIVE_AMOUNT is null;

select Employee.FIRST_NAME, Incentives.INCENTIVE_AMOUNT 
from Employee 
left join Incentives on Employee.id = Incentives.EMPLOYEE_REF_ID 
where Incentives.INCENTIVE_AMOUNT is not null;

select Employee.FIRST_NAME,
(
	select max(Incentives.INCENTIVE_AMOUNT)
	from Incentives where Employee.id = Incentives.EMPLOYEE_REF_ID
) from Employee;

select SALARY from Employee order by SALARY desc limit 2;
select SALARY from Employee order by SALARY desc limit 1 offset 1;

select FIRST_NAME as separate_rows from Employee
union select LAST_NAME from Employee;

select * from Employee inner join Incentives on Employee.id = Incentives.EMPLOYEE_REF_ID;

select FIRST_NAME, SALARY, 
case 
when First_name ='John' then SALARY*0.20
when First_name ='Roy' then SALARY*0.10
else SALARY*0.15
end as amount
from Employee;

select DEPARTMENT,
case
when DEPARTMENT = "Banking" then "Bank Dept"
when DEPARTMENT = "Insurance" then "Insurance Dept"
when DEPARTMENT = "Services" then "Services Dept"
end as DEPARTMENT
from Employee;

delete Employee from Employee 
join Incentives on Employee.id = Incentives.EMPLOYEE_REF_ID;

delete from Employee;

insert into Employee(LAST_NAME) 
values('Abraham'"'");

alter table Incentives add column employee_name varchar(100);
insert into Incentives(employee_name) values('none');
update Incentives set employee_name = 'John';
