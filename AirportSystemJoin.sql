use AirportSystem
--Airline Database – JOIN Queries 

--Display each flight leg's ID, schedule, and the name of the airplane assigned to it.
select * from Leg_instance
select L.NO_of_seats, L.date, A.Air_ID
FROM Leg_instance L
JOIN airplane A ON L.Air_ID = A.total_seats;

--Display all flight numbers and the names of the departure and arrival airports.
select * from Fight_Leg
select * from 
Airport
select f.Leg_No, A.name AS  DepartureAirport
from Fight_Leg f
JOIN Airport A ON f.Leg_No = A.Name;

--3. Display all reservation data with the name and phone of the customer who made each booking. 
select * from Seat
select Sear_no, Date, COS_NAME, Cphone
from Seat;
---4. Display IDs and locations of flights departing from 'CAI' or 'DXB'.

--Display full data of flights whose names start with 'A'.
select *from flight
WHERE Airlane LIKE 'A%';

--List customers who have bookings with total payment between 3000 and 5000.
-- no coustomer table here 

-- Retrieve all passengers on 'Flight 110' who booked more than 2 seats. 
--Find names of passengers whose booking was handled by agent "Youssef Hamed". 


------------------------
use university
ALTER DATABASE university
MODIFY NAME = Hotal;
