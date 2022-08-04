--DATABASE-Collection of tables
--Table-Collection of records(rows and columns(fields))

--create database
create database sqlbatch

use sqlbatch
--create table
create table batch1
(
EID int,
EName varchar(15),
EContact varchar(10),
EDesignation varchar(15)
)

--View the table
create view batch1view as 
select Ename,EDesignation from batch1

select * from batch1view

--SQL STATEMENTS
--DDL-DATA DEFINITION LANGUAGE-CREATE,ALTER,DROP,TRUNCATE
--DML-DATA MANIPULATION LANGUAGE-INSERT,UPDATE,DELETE
--DQL-DATA QUERY LANGUAGE-SELECT
--DCL-DATA CONTROL LANGUAGE-GRANT,DENY/REVOKE
--TCL-TRANSACTION CONTROL LANGUAGE-COMMIT,ROLLBACK,SAVEPOINT
--DEFAULT TRANSACTION-AUTO COMMIT

--insert statement
insert into batch1 values(1,'Peter','9876543212','Developer')
insert into batch1 values(2,'Paul','9876543712','Designer')
insert into batch1 values(3,'Sam','9872543212','Developer')
insert into batch1 values(4,'John','9876563212','Developer')
insert into batch1 values(5,'Jancy','9876143212','Designer')

--update statement
--update batch1 set EDesignation='Designer' (all the rows get updated)
update batch1 set EDesignation='Designer' where EID=3
update batch1 set EName='Jancy' where EName='John'

--delete statement
--delete from batch1 (delete all the records)
delete from batch1 where EID=5

--create table 
create table demo
(
id int,
name varchar(10)
)

select * from demo

--alter table to add a column
alter table demo add designation varchar(10)
alter table demo add mobile varchar(10)

--alter table to drop a column
alter table demo drop column mobile

insert into demo values(1,'Peter','Developer')

--Truncate table
truncate table demo

--drop table
drop table demo

--create database
create database demo

use demo

--alter database
alter database demo Modify Name=demonstration

--drop database
drop database demonstration

--Schema-default dbo-Collection of database objects including
--tables,views,procedures,functions etc

--create schema

create schema sqltrainees

create table demo
(
id int
)
create table sqltrainees.demo1
(
id int
)

--drop schema
drop schema if exists sqltrainees

--1st drop the table and then drop the schema
drop table sqltrainees.demo1
drop schema if exists sqltrainees

select * from batch1

delete from batch1 where eid=5
--DQL
--Select * ->all the columns
select * from batch1
--select specific columns
select EID,EName from batch1
--Rename the column names during select
select EID as EmpID,EName as 'Employee Name' from batch1

--select specific rows
select * from batch1 where EName='jancy'

--select specific rows and retrieve case sensitive records
select * from batch1 where EName='Sam' Collate SQL_Latin1_General_CP1_CS_AS;

alter table batch1 add ESalary int

update batch1 set ESalary=30000 where EDesignation='Developer'
update batch1 set ESalary=28000 where EDesignation='Designer'

insert into batch1 values(7,'Shaun',7685946378,'Admin',25000)
insert into batch1 values(8,'Dean',7665946378,'Admin',25000)

--Relational Operators(>,<,>=,<=,=,!=)

select * from batch1 where ESalary>25000

select * from batch1 where ESalary<=25000

--Logical Operators(AND,OR,NOT)

select * from batch1 where ESalary>25000 AND EDesignation='Designer'
select * from batch1 where ESalary>25000 OR EDesignation='Admin'

--BETWEEN AND
select * from batch1 where ESalary between 25001 and 29999

--IN/NOT IN

select * from batch1 WHERE Eid in (1,3,5)

select * from batch1 WHERE Eid not in (1,3,5)

select * from batch1 WHERE EDesignation in ('Designer','Admin')

select * from batch1 WHERE EDesignation not in ('Designer','Admin')

--LIKE %(0 or more occurences) _(one character)
select * from batch1 where EName like 'S%'
select * from batch1 where EName like '_a%'
select * from batch1 where EName like '%n'
select * from batch1 where EName like 's__'
select * from batch1 where EName like '[sj]%'
select * from batch1 where EName not like '[sj]%'
select * from batch1 where EName like '[a-e]%'
select * from batch1 where EName not like '[a-e]%'

--DISTINCT - avoid duplicate records
Select EDesignation from batch1
Select DISTINCT EDesignation from batch1







