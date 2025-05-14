use dummy;

create table newstudents(
student_name varchar(100),
mark int,
department varchar(100)
);

insert into newstudents values("Barath", 61, "CSE");
insert into newstudents values("Venkat", 89, "ECE");
insert into newstudents values("Praveen", 56, "MECH");
insert into newstudents values("Abdul", 68, "CSE");
insert into newstudents values("Kadhir",88, "MECH");
insert into newstudents values("John", 81, "MECH");
insert into newstudents values("Manoj", 91, "CSE");
insert into newstudents values("Mani", 51, "ECE");

select * from newstudents where department="CSE";
select student_name, mark from newstudents order by mark;
select student_name, mark from newstudents order by mark asc;
select student_name, mark from newstudents order by mark desc;
select * from newstudents;

select avg(mark) from newstudents group by department;
select avg(mark),department from newstudents group by department;
select count(student_name),department from newstudents group by department;
select count(student_name),department from newstudents group by department order by count(student_name) asc;
