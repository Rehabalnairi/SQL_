

----------------
use Library
---Library Database – JOIN Queries

-- Display library ID, name, and the name of the manager. 
select * from libarary
select * from staff
select l.LibararyID, l.name, S.Fullname AS STAFFname
from libarary AS l
INNER JOIN 
staff AS S ON l.LibararyID = s.staffID;

--Display library names and the books available in each one. 
select * from libarary
select * from book
Select name,status
from libarary l , book b
where l.LibararyID=b.bookId

--3. Display all member data along with their loan history
select * from Members
select * from loan
Select Fullname,l.*
from Members M , loan l
where M.MemberID=l.MemberID

--4. Display all books located in 'Zamalek' or 'Downtown'. 
select b.title
from book as b
INNER JOIN 
libarary as l on b.bookId = l.LibararyID
where l.location IN ('Zamalek', 'Downtown');

-- Display all books whose titles start with 'T'.
select * from book as b where  b.title LIKE 'T%';

--6. List members who borrowed books priced between 100 and 300 LE. 
select * from Members
select * from book
-------------------------
--Find all members assisted by librarian "Sarah Fathy". 
select m.Fullname from Members as m where Fullname ='Sarah Fathy';

--Display each member’s name and the books they borrowed, ordered by book title.
select * from Members
select * from book
select m.Fullname as member_name,b.title as book_title
from members as m ,book as b
ORDER BY b.title;
--For each book located in 'Cairo Branch', show title, library name, manager, and shelf info. 
select m.Fullname ,b.title from Members as m ,book as b
JOIN libarary l ON b.bookId = l.LibararyID where  l.location ='Cairo';

--Display all staff members who manage libraries.
select * from staff
select f.Fullname from staff as f where f.position='Libarian'

-- Display all members and their reviews, even if some didn’t submit any review yet.
select * from review
select * from Members
select m.MemberID,m.Fullname ,r.rating
from Members AS m
LEFT JOIN review AS r ON m.MemberID = r.bookId;

    































------------------------
use Hotal
ALTER DATABASE university
MODIFY NAME = Hotal;
--1. Display hotel ID, name, and the name of its manager. 
select * from booking
