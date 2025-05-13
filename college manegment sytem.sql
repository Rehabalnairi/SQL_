create database university;
 use university
 go

create table branch (
bid int primary key,
name varchar(100) not null,
Location GEOGRAPHY,
RNum int ,
type varchar(100) not null,
rate varchar(50) not null,
);

create table Room (

Rname varchar(100) not null,
type varchar (100) not null,
rate varchar (100) not null,
bid int primary key,
foreign key (bid) references branch (bid)

);

create table customer(
cid int primary key,
Name varchar(100) not null,
email varchar(100) not null,

);

create table customer_phone(
cid int primary key,
email varchar(100) not null,
foreign key (cid) references customer (cid)
);

create table staff(
sid int primary key,
Name varchar(100) not null,
 job varchar(100) not null,
 Salary decimal (10,2) check (Salary > 0 ),

);

create table booking(
sid int, 
name varchar (100),
job varchar(100) not null,
Salary decimal (10,2) check (Salary > 0 ),
cid int ,
primary key (sid ,cid),
foreign key (cid) references customer (cid)
);

create table custmer_staff(
sid int,
cid int,
foreign key (sid) references staff (sid),
foreign key (cid) references customer (cid),
primary key (sid ,cid),
);

alter table branch 
add sid int 
foreign key (sid) references staff (sid)



create database AirportSystem;
use AirportSystem;

create table Airport(
city varchar(50) not null,
State varchar(50) ,
Name varchar(50) not null,
);

create table airplane_type(
Type_name int primary key,
company varchar (10) not null,
MaxState char(10),
Name varchar(50) not null,
);


create table airplane(
 total_seats varchar (100) not null,
 type_name int primary key,
 foreign key (type_name) references airplane_type (type_name)

);

alter table airplane
add Air_ID int  UNIQUE


CREATE TABLE Leg_instance (
Date DATE,
NO_of_seats VARCHAR(100) NOT NULL,
Air_ID INT PRIMARY KEY,
CONSTRAINT FK_LegInstance_Airplane FOREIGN KEY (Air_ID)
REFERENCES airplane(Air_ID)
);
alter table Leg_instance
add Number int

create table fare (
Rest VARCHAR(100) NOT NULL,
Amount VARCHAR(100) NOT NULL,
code int primary key,
);

create table  Fight_Leg(
Leg_No int primary key,
 Sch_dep_time time,
 Sch_arr_time time,
 );

 create table AIR_AIRTYPE (
 AID int ,
 Type_name int,
 primary key (AID,Type_name)
 );
  
 create table Seat(
 Sear_no int primary key,
 COS_NAME varchar(30),
 Date DATE,
 Cphone int ,

  );

create table flight(
 Airlane varchar(60),
 Weekday int,
 Cphone int
);