--Task 9 (Aggregation Functions --
use Company_SD
--1.  Count total number of employees in the Employees table.
select * from Employee
select COUNT(*) Employee from Employee

-- 2.Calculate average salary from the Salaries table. 
Select AVG(Salary) from Employee

--3.Count employees in each department using Employees grouped by Dept_ID.
select * from Departments
Select COUNT(Fname),Dno From Employee
GROUP BY Dno

--4.Find total salary per department by joining Employees and Salaries. 

--Show departments (Dept_ID) having more than 5 employees with their counts.
select * from Departments
select * from Employee
select Dnum ,COUNT(*)from Departments 
GROUP BY Dnum
HAVING COUNT(*) > 5;

----Library Database
use Library
--26. Count total books in Books table.
select COUNT(*) from book
--27. Average book price from Books table.
select AVG(price) from book

--28. Count books per library grouped by Library_ID.
select * from book
Select LibararyID,COUNT(*) from book GROUP BY LibararyID
--29. Count books borrowed per member from Borrows table grouped by Member_ID.
select COUNT (*)book from book ,Members
group by MemberID;

--30. List members who borrowed more than 3 books grouped by Member_ID. 
select * from Members
select * from book
select  m.MemberID, m.Fullname, COUNT(b.bookId) AS total_borrowed
FROM Members m
JOIN book b ON m.MemberID = b.bookId
GROUP BY m.MemberID, m.Fullname
HAVING COUNT(b.bookId) > 3;


