use sqlbatch

--INDEX - faster retrieval/improves the performance/select/select-where/pointer
select * from students where sid=1

-- 2 types - CLUSTERED/NON-CLUSTERED INDEX
--CLUSTERED - PRIMARY KEY->CLUSTERED INDEX(ONLY 1)->LEAF NODE->STRUCTURED FORMAT(DATA)->CLUSTERED TABLE

select * from batch1
create clustered index ix_eid on batch1(eid)

--NON CLUSTERED INDEX - UNSTRUCTURED FORMAT 
create index ix_ename on batch1(ename)

--UNIQUE NON CLUSTERED INDEX
create unique index ix_sname on students(sname)

--FILTERED INDEX
select * from employees where ename='John'
create index ix_ename on employees(ename) where ename='John'

--TRIGGERS-4 TYPES
--DML,DDL,CLR,LOGON

--DML-INSERT,UPDATE,DELETE

select * from demo

create trigger trg_insert
on demo
FOR INSERT
as
begin
	print 'You cannot insert data'
	rollback transaction --undo the insert query
end

drop trigger trg_insert

insert into demo values(4,'2/2/2000')

create trigger trg_dml
on demo
FOR INSERT,UPDATE,DELETE
as
begin
	print 'You cannot perform DML Operations'
	rollback transaction --undo the DML Statements
end

insert into demo values(5,'2/2/2000')
update demo set sno=6 where sno=5
delete from demo where sno=5
select * from demo

drop trigger trg_dml

disable trigger trg_dml on demo
enable trigger trg_dml on demo

select * from batch2

alter trigger trg_batch2_dml
on batch2
FOR INSERT,UPDATE,DELETE
as
begin
	if DATEPART(DW,GETDATE())=4 --WEDNESDAY
	begin
		print 'You cannot perform DML Operations on batch2'
		rollback transaction --undo the DML Statements
	end
end 

disable trigger trg_batch2_dml on batch2
enable trigger trg_batch2_dml on batch2

INSERT INTO BATCH2 VALUES(2,'Jancy',25000)

delete from batch2 where id=2

--INSERTED AND DELETED TABLE 

create trigger trg_inserted
on batch1
for insert
as 
begin 
	 -- trigger table
end

select * from batch1

insert into batselect * from insertedch1 values(11,'Lee','79866989','Admin',20000)

select * from batch2
INSERT INTO BATCH2 VALUES(3,'Jamie',25000)

create trigger trg_deleted
on batch1
for delete
as 
begin 
	select * from deleted -- trigger table
end

delete from batch1 where eid=10

create trigger trg_update
on batch1
for update
as 
begin 
    select * from inserted
	select * from deleted -- trigger table
end

update batch1 set ename='Lea' where eid=8

--DDL TRIGGER
--Database Scoped
--Server Scoped

--DATABASE SCOPED
create trigger trg_ddl
on database
for CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
	begin
		print 'You cannot perform DDL Operations on sqlbatch db'
		rollback transaction --undo the DML Statements
	end

disable trigger trg_ddl on database

use Shop

create table demo4
(
id int
)

drop table demo

--SERVER SCOPED
create trigger trg_ddlserver
on ALL SERVER
for CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
	begin
		print 'You cannot perform DDL Operations on SERVER'
		rollback transaction --undo the DML Statements
	end


--TRANSACTIONS A1 - > N/W FAILURE A2 1000  2500 - AXIS SERVER
--ACID PROPERTIES ->ATOMICITY(SUCCESS/FAILURE),CONSISTENCY,ISOLATION,DURABLITY
-- AUTO COMMIT(DEFAULT),IMPLICIT,EXPLICIT

--EXPLICIT TRANSACTION
-- BEGIN TRANSACTION,COMMIT TRANSACTION,SAVEPOINT,ROLLBACK

select * from students

BEGIN TRANSACTION
	insert into students values(14,'Liam',100,201) -- gets commited
	SAVE TRANSACTION insert_stmt
	delete from students where sid=13 --rollback
ROLLBACK TRANSACTION insert_stmt
COMMIT TRANSACTION

--IMPLICIT TRANSACTION
SET IMPLICIT_TRANSACTIONS OFF
