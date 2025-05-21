use company_SD
select * from Employee
select * from Departments
--Display the department ID, department name, manager ID, and the full name of the manager. 

Select Dnum,Dname
from Departments , Employee
where Departments.Dnum=Employee.SSN 
--start with PK 

-- Display the names of departments and the names of the projects they control.
select * from Project
select * from Departments
select  d.Dname, p.Pname from Departments d
JOIN  Project p on  d.Dnum = p.Pnumber;

--Display full data of all dependents, along with the full name of the employee they depend on.
select * from dependent
select * from Employee
select * from dependent 

SELECT d.*,CONCAT(e.Fname, ' ', e.Lname) as employee_full_name
FROM dependent AS d
INNER JOIN Employee AS e ON d.ESSN= e.SSN;

---Display the project ID, name, and location of all projects located in Cairo or Alex
select * from Project
select Pnumber, Pname, City from Project as p where p.City = 'Cairo' OR p.City = 'Alex';

--Display all project data where the project name starts with the letter 'A'. 
select * from Project as p where  p.Pname LIKE 'A%';

-- Display the IDs and names of employees in department 30 with a salary between 1000 and 2000 LE.
select * from Employee
select e.SSN, CONCAT(e.Fname, ' ', e.Lname) AS full_name
from Employee AS e where  e.salary BETWEEN 1000 AND 2000;

--Retrieve the names of employees in department 10 who work ≥ 10 hours/week on the "AL Rabwah" project.
select * from Works_for
select * from Project
select CONCAT(e.Fname, ' ', e.Lname) AS full_name from Employee AS e INNER JOIN 
 Works_for AS w ON e.SSN = w.ESSn
INNER JOIN  project AS p ON w.ESSn = p.Pnumber
where e.SSN = 10 AND w.ESSn >= 10
AND p.Pname = 'AL Rabwah';

--Find the names of employees who are directly supervised by "Kamel Mohamed". 
select * from Employee
select E.Fname, E.Lname
from dbo.Employee E
JOIN dbo.Employee S on E.Superssn = S.SSN
where S.Fname = 'Kamel' AND S.Lname = 'Mohamed';

--Retrieve the names of employees and the names of the projects they work on, sorted by project name. 
select E.Fname + ' ' + E.Lname as EmployeeName , P.Pname from dbo.Employee E, dbo.Works_for W, dbo.Project P
where E.SSN = W.ESSN AND W.Pno = P.Pnumber 
order by P.Pname;

-- For each project located in Cairo, display the project number, controlling department name, manager's last name,  address, and birthdate. 
select P.Pnumber, D.Dname, M.Lname as ManagerLname, M.Address, M.Bdate
from dbo.Project P
JOIN dbo.Departments D ON P.Dnum = D.Dnum
JOIN dbo.Employee M ON D.MGRSSN = M.SSN
where P.City = 'Cairo';

--. Display all data of managers in the company.
select E.*
from dbo.Employee E, dbo.Departments D
where E.SSN = D.MGRSSN;

--Display all employees and their dependents, even if some employees have no dependents. 
select E.SSN, E.Fname, E.Lname, D.Dependent_name, D.Dependent_name
from dbo.Employee E
LEFT JOIN dbo.Dependent D on E.SSN = D.ESSN;