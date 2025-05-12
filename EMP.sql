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

create table Department (
Dname varchar(50) not null,
Dnumber int primary key,
Mgr_ssn char(20),
Mgr_start_date date,
);

create table Dept_Location (
Dnumber int,
DLocation varchar (20),
primary key (Dnumber , DLocation)
);

create table project (
Pname varchar(30),
Pnumber int primary key,
Plocation varchar(40),
Dnum int,
foreign key (Dnum) references Department (Dnumber),
);

create table Work_on (
 Essn int,
 Pno int,
 WorkHours time,
 primary key (Essn , Pno),
 foreign key (Essn) references Employees (Ssn),
 foreign key (Pno) references project (Pnumber)

);

create table Depenent (
 Essn int,
 Depenent_name varchar(30),
 Sex char(1) CHECK (Sex IN ('M', 'F')),
 Bdate date ,
 Relationship varchar(30),
 primary key (Essn , Depenent_name),

 foreign key (Essn) references Employees (Ssn)

);


