create database Company;

Go
 use Company; 
 create table Employees(
 EmployeeID int primary key,
 FirstName varchar(50) not null,
LastName varchar(50) not null,
Department varchar(50),
Salary Decimal(10,2) check(salary >0)
);

alter table Employees
add DateOfBirth Date;
 
 DROP TABLE Employees;

 use Company; 

create table Employees(
FirstName varchar(50) not null,
Minit varchar(50)  not null,
LastName varchar (50)not null,
Ssn int primary key,
Bdate date ,
Address varchar ( 255 ),
Sex char(1) CHECK (Sex IN ('M', 'F')),
Salary decimal (10,2) check (Salary > 0 ),
Super_ssn int,
foreign key (Super_ssn) references Employees (Ssn)

);
--insert
insert into Employees(FirstName,Minit,LastName,Ssn,Bdate,Address,Sex,Salary,Super_ssn)
values ('Rehab','khalfan','AlNairi',123,'11-11-2011','Muscat','F',700,123)

create table Department (
Dname varchar(50) not null,
Dnumber int primary key,
Mgr_ssn char(20),
Mgr_start_date date,
);

--insert
insert into Department(Dname,Dnumber,Mgr_ssn,Mgr_start_date)
values('Software',11,'20','2012-12-20'),('database',12,'26','2012-12-20');

create table Dept_Location (
Dnumber int,
DLocation varchar (20),
primary key (Dnumber , DLocation)
);
--insert
insert into Dept_Location(Dnumber,DLocation)
values(11,'Muscat'),(12,'suhar');

create table project (
Pname varchar(30),
Pnumber int primary key,
Plocation varchar(40),
Dnum int,
foreign key (Dnum) references Department (Dnumber),
);
insert into project(Pname,Pnumber,Plocation,Dnum)
values('onic',124,'Muscat' ,11),
	  ('IOt',123,'sur',11),
      ('AI',125,'Nizwa',12)




create table Work_on (
 Essn int,
 Pno int,
 WorkHours time,
 primary key (Essn , Pno),
 foreign key (Essn) references Employees (Ssn),
 foreign key (Pno) references project (Pnumber)
);
insert into Work_on(Essn,Pno, WorkHours)
values(123,124,'09:30:00')
	

create table Depenent (
 Essn int,
 Depenent_name varchar(30),
 Sex char(1) CHECK (Sex IN ('M', 'F')),
 Bdate date ,
 Relationship varchar(30),
 primary key (Essn , Depenent_name),
 foreign key (Essn) references Employees (Ssn)
 );

 insert into Depenent(Essn,Depenent_name, Sex, Bdate,Relationship)
 values(123,'bbb','F','2012-12-20',99)

 --update
 update Employees
set Salary+=25

use Company; 

---Select
select * from project
 
 select ssn  from Employees


 select * from project where Plocation= 'Muscat'

 -- Display all the employees Data.
 SELECT * FROM Employees

 insert into Employees (FirstName, Minit, LastName, Ssn, Bdate, Address, Sex, Salary, Super_ssn)
values 

('Ahmed', 'S', 'AlBalushi', 124, '1990-05-20', 'Sohar', 'M', 1200, 123),
('Fatma', 'A', 'AlZahra', 125, '1985-03-15', 'Salalah', 'F', 1500, 124),
('Hassan', 'M', 'AlHarthy', 126, '1992-07-10', 'Nizwa', 'M', 1100, 124),
('Mona', 'L', 'AlRawahi', 127, '1995-12-01', 'Ibri', 'F', 1300, 125);

select Bdate from Employees;

-- Display the employee First name, last name, Salary and Department number. 
select FirstName, LastName, Salary from Employees;

--3. Display all the projects names, locations and the department which is responsible about it. 
select  Pname,  Plocation, 
  (select Dname FROM Department WHERE Department.Dnumber = Project.Dnum) AS DepartmentName
FROM Project;

--If you know that the company policy is to pay an annual commission for each employee with specific percent 
--equals 10% of his/her annual salary .Display each employee full name and his annual commission in an 
--ANNUAL COMM column (alias). 

select CONCAT(FirstName, ' ', LastName) AS FullName,Salary * 0.10 * 12 AS 'ANNUAL COMM'
FROM Employees;

-- Display the employees Id, name who earns more than 1000 LE monthly.
select Ssn as EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName
from Employees
where Salary > 1000;

-- Display the employees Id, name who earns more than 10000 LE annually. 
select Ssn as EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName
from Employees where Salary * 12 > 10000;

-- Display the names and salaries of the female employees 
select CONCAT(FirstName, ' ', LastName) AS FullName, Salary
from Employees where Sex = 'F';

--. Display each department id, name which managed by a manager with id equals 968574. 
insert into Department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
values ('AI Research', 13, '968574', '2020-01-01');

select Dnumber as DepartmentID, Dname as DepartmentName
from Department where Mgr_ssn = '968574';

-- Dispaly the ids, names and locations of  the pojects which controled with department 10.
select * from Project

insert into Department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
values ('Cyber Department', 10, '968574', '2022-01-01');

insert into Project (Pname, Pnumber, Plocation, Dnum)
values ('Cyber Security', 130, 'Muscat', 10);

select Pnumber as ProjectID, Pname AS ProjectName, Plocation AS Location
FROM Project where  Dnum = 10;

--Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000. 
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Employees';
select * from Employees

insert into Employees (FirstName, Minit, LastName, Ssn, Bdate, Address, Sex, Salary, Super_ssn)
values ('YourFirstName', 'M', 'YourLastName', 102672, '1995-05-19', 'YourAddress', 'M', 3000, 112233);


-- Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or supervisor number to him.
select * from Employees
INSERT INTO Employees (FirstName, Minit, LastName, Ssn, Bdate, Address, Sex)
VALUES ('FriendFirstName', 'A', 'FriendLastName', 102660, '1996-06-15', 'FriendAddress', 'M');

-- Upgrade your salary by 20 % of its last value. 
UPDATE Employees set Salary = Salary * 1.20 where Ssn = 102672;
