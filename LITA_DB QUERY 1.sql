create database LITA_DB

CREATE TABLE Employee (
staffid varchar (10) not null,
FirstName varchar (255) NOT NULL,
SecondName varchar (255),
Gender varchar (10),
Date_of_Birth date,
HireDate datetime,
primary key (staffid)
)

select * from Employee

-----Insert more records into Employee table-----

insert into Employee (staffid, firstname, secondname, gender,Date_of_Birth, hiredate)
values ( 'AB401', 'ayan', 'olakun', 'female', '1992-08-22', '2018-02-09'),
( 'AB212', 'okorie', 'mercy', 'female','1988-10-09', '2018-10-09'),
( 'AB223', 'joshua', 'chukwuemeka', 'male','1980-10-09', '2022-02-09'),
( 'AB234', 'sanni', 'ibrahim', 'male','1958-10-09', '2019-09-23'),
( 'AB254', 'mercy', 'olanipekun', 'female','1982-10-09', '2020-02-09'),
( 'AB249', 'johnson', 'mercy', 'female','1982-10-09', '2019-12-09'),
( 'AB298', 'ayomide', 'halleluyah', 'female', '1982-10-09','2018-07-11'),
( 'AB260', 'deborah', 'justin', 'female','1982-10-09', '2018-02-09'),
( 'AB281', 'wale', 'olanipekun', 'male','1982-10-09', '2018-02-09')

-------to drop table --------

drop table employee

----delete sql command--

delete from employee
where staffid  = 'ab281'

-----truncate sql command

truncate table employee

------identity in SQL-----

CREATE TABLE PERSON (
personid int identity (1,1) primary key not null,
personname varchar (255) not null,
age int
)
insert into PERSON (personname, age)
values ('Saidu', 45),
('Adebanjo', 55),
('Olorunda', 70),
('Temitope', 16),
('Mimi', 25),
('Chidera', 66) 
select * from PERSON
drop table PERSON

----Insert more records into Employee table-----


insert into [dbo].[Employee]
values ('AB505', 'Rahmat', 'Hassan', 'Female', '2000-10-08', '2024-12-09')
select * from  [dbo].[Employee] 

----to create second table call salary table----
CREATE TABLE Salary (
salary_id int identity (1,1) not null,
staffid varchar (255),
firstname varchar (255),
lastname varchar (255),
department nvarchar (255),
salary decimal (10, 3) ---(10: precison, 3:scale)
)

select * from Salary

--insert records into salary table---

insert into salary (staffid, FirstName, lastname, Department, salary)
values ( 'AB401', 'ayan', 'olakun', 'Information Tech.', 45000.45),
( 'AB212', 'okorie', 'mercy','Account',500000.99999),
( 'AB223', 'joshua', 'chukwuemeka', 'Human Resources',100560.9339999),
( 'AB234', 'sanni', 'ibrahim', 'Sales and Marketing',845688.99),
( 'AB254', 'mercy', 'olanipekun', 'Account',8889.999999),
( 'AB249', 'johnson', 'mercy', 'Information Tech.',234000.90909090),
( 'AB298', 'ayomide', 'halleluyah', 'Logistics', 678000.991999),
( 'AB260', 'deborah', 'justin', 'Logistics',900099.00697969),
( 'AB281', 'wale', 'olanipekun', 'Information Tech',873093.2344)

insert into Salary
values ( 'AB200', 'ayomide', 'halleluyah', 'Human Resources',45699.8585),
( 'AB405', 'deborah', 'justin', 'Account',898349.900222),
( 'AB282', 'wale', 'olanipekun', 'Sales and Marketing',362636.564848),
( 'AB278', 'shukurat', 'lasisi', 'Logistics',100000.464647),
( 'AB240', 'johnson', 'mercy', 'Information Tech',3855590.9890093),
( 'AB299', 'ayomide', 'halleluyah', 'Account', 8585858.9292),
( 'AB268', 'deborah', 'justin', 'Human Resources',76767.93939)

----SUM, COUNT, MAX, MIN, AVERAGE
SELECT SUM(salary) AS TOTALSALARY from Salary

SELECT AVG(salary) AS AVERAGESALARY FROM Salary

SELECT COUNT(staffid) AS Employeecount FROM Employee

SELECT COUNT (staffid) AS NumberofEmployee FROM Salary


----Update-----

update Salary
set salary = 7056999.9994
where staffid = 'AB401'

Select * FROM Salary

Update salary
SET department = 'Information Tech.'
where staffid = 'AB405'

Select * FROM Salary
WHERE staffid = 'AB281'

Select * from [dbo].[Employee]

----CREATE ADDITIONAL COLUMN INTO EMPLOYEE TABLE----

ALTER TABLE Employee
ADD State_of_Origin varchar (50) 

UPDATE Employee
SET State_of_Origin = 'Lagos'
where staffid = 'AB212'

Update Employee
SET State_of_Origin = CASE
WHEN Staffid = 'AB223' THEN 'Abuja'
WHEN Staffid = 'AB234' THEN 'Abia'
WHEN Staffid = 'AB249' THEN 'Ogun'
WHEN Staffid = 'AB254' THEN 'Imo'
WHEN Staffid = 'AB260' THEN 'Oyo'
WHEN Staffid = 'AB281' THEN 'Ekiti'
WHEN Staffid = 'AB298' THEN 'Plateau'
WHEN Staffid = 'AB401' THEN 'Abuja'
WHEN Staffid = 'AB505' THEN 'Lagos'
ELSE null 
END;

-----create another table called PAYMENT TABLE-----

CREATE TABLE Payment (
paymentid int identity (1,1) primary key,
Account_No bigint not null,
staffid int,
Bank varchar (255) default 'Zenith Bank',
payment_method varchar (50) check (payment_method = 'Cash' or payment_method = 'Transfer')
)

alter table payment
alter column staffid varchar (30)
Select * from Payment

insert into Payment (account_no, staffid, payment_method )
values (2033030303, 'AB200', 'transfer'),
(2123459910, 'AB401',  'transfer'),
(2034562240, 'AB254',  'cash'),
(2234556303, 'AB212',  'transfer'),
(2033037703, 'AB249',  'cash'),
(2033030303, 'AB298',  'cash'),
(2455657503, 'AB260',  'transfer'),
(2045595953, 'AB281',  'cash'),
(2033030303, 'AB273',  'transfer'),
(2077778903, 'AB299',  'transfer'),
(2033030301, 'AB286', 'transfer'),
(2123459911, 'AB260',  'transfer'),
(2034562241, 'AB270',  'cash'),
(2234556302, 'AB104',  'transfer'),
(2033037705, 'AB268',  'cash'),
(2033030306, 'AB270',  'cash'),
(2455657509, 'AB300',  'transfer')

insert into Payment
values (2198773830, 'AB299',  'GT bank', 'transfer'),
(2024656569, 'AB405',  'Access bank', 'cash'),
(2222444933, 'AB200',  'Fidelity bank', 'transfer'),
(5674842300, 'AB278', 'Access bank', 'transfer'),
(2222444933, 'AB200',  'GT bank', 'transfer'),
(2034537300, 'AB278', 'Access bank', 'transfer')

-----by cash---

select * from Payment
where payment_method = 'cash'

select count (*) from payment
where bank = 'Zenith bank'


select count (*) as zenithstaff from payment
where payment_method = 'transfer'

select count (*) as zenithstaff from payment
where payment_method = 'cash'

----for employee table---

select count (*) from employee
where state_of_origin = 'lagos'


----for salary table----

select count (*) from Salary
where department = 'Human Resources'

select top 5 * from Salary

select * from Salary
where salary > 700000

select max (salary) from Salary

select min (salary) as minimumsalary from Salary