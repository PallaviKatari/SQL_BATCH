use sqlbatch

--Aggregate functions-avg,min,max,sum,count
select * from batch1
select avg(ESalary) as 'Average Salary' from batch1
select min(ESalary) as 'Minimum Salary' from batch1
select max(ESalary) as 'Maximum Salary' from batch1
select count(ESalary) as 'Count Salary' from batch1
select sum(ESalary) as 'Sum Salary' from batch1

--wrong way of retrieving records for specific records while using aggregate functions
select avg(ESalary) as 'Average Salary',Edesignation from batch1 where Edesignation='Developer'

--GROUP BY CLAUSE
select avg(ESalary) as 'Average Salary',Edesignation from batch1 group by EDesignation

--'where' is replaced with 'having' clause while checking the condition along with a 'group by' clause
select avg(ESalary) as 'Average Salary',Edesignation from batch1 group by EDesignation having Edesignation='Developer'

--order by clause- default asc
select * from batch1 order by Esalary 
select * from batch1 order by Esalary desc

select * from batch1 order by Esalary desc,Eid desc

--SYNONYM - alias or alternative name for the table,view,function,procedure etc

select * from employees

--create synonym
create synonym e1 for employees
select * from employees
select * from e1

--drop synonym
drop synonym if exists e1

-- JOINS
-- Combine rows from 2 or more tables based on a common column
--Types-INNER,LEFT,RIGHT,FULL,SELF,CROSS

--create 3 tables
create table students
(
SID int primary key,
SName varchar(25) not null,
SDept int not null,
SClub int not null,
)
create table SDept
(
DID int primary key,
DeptName varchar(25) not null
)
create table SClub
(
CID int primary key,
ClubName varchar(25) not null
)

select * from students
select * from SDept

--INNER JOIN for students and SDept table  
select SID,SName,SDept,DeptName from students inner join SDept on SDept=DID

select students.SID,students.SName,students.SDept,SDept.DeptName from students inner join SDept on students.SDept=SDept.DID

select * from SDept
select s.SID,s.SName,s.SClub,s.SDept,d.DeptName from students as s inner join SDept as d on s.SDept=d.DID
select * from SClub
--INNER JOIN for students, SDept table and SClub
select s.SID,s.SName,s.SDept,d.DeptName,c.ClubName,s.SClub from students as s inner join SDept as d on s.SDept=d.DID inner join SClub as c on s.SClub=c.CID

--LEFT,RIGHT,FULL JOIN
select s.SID,s.SName,s.SClub,s.SDept,d.DeptName from students as s inner join SDept as d on s.SDept=d.DID
select s.SID,s.SName,s.SClub,s.SDept,d.DeptName from students as s left join SDept as d on s.SDept=d.DID
select s.SID,s.SName,s.SClub,s.SDept,d.DeptName from students as s right join SDept as d on s.SDept=d.DID
select s.SID,s.SName,s.SClub,s.SDept,d.DeptName from students as s full join SDept as d on s.SDept=d.DID

select s.SID,s.SName,s.SDept,d.DeptName,c.ClubName,s.SClub from students as s left join SDept as d on s.SDept=d.DID full join SClub as c on s.SClub=c.CID

--IDENTITY
create table sample
(
id int primary key IDENTITY(1,1),
name varchar(20)
)
insert into sample values('Sam')
select * from sample

--SEQUENCES
--CREATE SEQUENCE
create sequence empid as INT start with 1 increment by 5
create table sample1
(
id int primary key ,
name varchar(20)
)
insert into sample1 values(NEXT VALUE FOR EMPID,'Peter')
select * from sample1
insert into sample1 values(NEXT VALUE FOR EMPID,'Paul')
insert into sample1 values(NEXT VALUE FOR EMPID,'John')

--ALTER SEQUENCE
alter sequence empid restart with 1 increment by 1
create table sample2
(
id int primary key ,
name varchar(20)
)
insert into sample2 values(NEXT VALUE FOR EMPID,'Peter')
select * from sample2
insert into sample2 values(NEXT VALUE FOR EMPID,'Paul')
insert into sample2 values(NEXT VALUE FOR EMPID,'John')

--CHECK THE CURRENT SEQUENCE VALUE
select NEXT VALUE FOR EMPID

--VIEWS - Virtual tables - Simple(one table) and Complex(one or more table)
--SIMPLE VIEW

select * from students

create view Sports
as 
select * from students where SClub=200

select * from Sports

--COMPLEX VIEW
create view students_Dept
as
select s.SID,s.SName,s.SClub,s.SDept,d.DeptName from students as s inner join SDept as d on s.SDept=d.DID

select * from students_Dept