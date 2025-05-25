create database Movie 
 use Movie

CREATE TABLE [user] (
UserID INT PRIMARY KEY,
FullName VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
JoinDate DATE NOT NULL,
SubscriptionType VARCHAR(20) CHECK (SubscriptionType IN ('Free', 'Basic', 'Premium')) NOT NULL
);

create table Movies(
MovieID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT,
DurationMinutes INT
);

create table WatchHistory(
WatchID INT PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES [user](UserID),
MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
WatchDate DATE,
WatchDuration INT -- in minutes
);

INSERT INTO [user](UserID, FullName, Email, JoinDate, SubscriptionType) VALUES
(1, 'Ali Al Hinai', 'ali@example.com', '2024-01-01', 'Premium'),
(2, 'Noor Al Busaidi', 'noor@example.com', '2024-02-15', 'Basic'),
(3, 'Hassan Al Rawahi', 'hassan@example.com', '2024-03-10', 'Free'),
(4, 'Muna Al Lawati', 'muna@example.com', '2024-04-05', 'Premium'),
(5, 'Salim Al Zadjali', 'salim@example.com', '2024-05-01', 'Basic');

INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, DurationMinutes) VALUES
(1, 'The Silent Ocean', 'Sci-Fi', 2023, 120),
(2, 'Omani Roots', 'Documentary', 2022, 90),
(3, 'Fast Track', 'Action', 2024, 130),
(4, 'Code & Coffee', 'Drama', 2023, 110),
(5, 'The Last Byte', 'Thriller', 2023, 105);

INSERT INTO WatchHistory (WatchID, UserID, MovieID, WatchDate, WatchDuration) VALUES
(1, 1, 1, '2025-05-10', 120),
(2, 2, 2, '2025-05-11', 80),
(3, 3, 3, '2025-05-12', 60),
(4, 4, 1, '2025-05-12', 90),
(5, 5, 5, '2025-05-13', 105);

--Beginner Level (Basic Practice)
--1. Total Number of Users
Select COUNT(*) from [user];

--2. Average Duration of All Movies
Select AVG(DurationMinutes) from Movies

--3. Total Watch Time
Select Sum(WatchDuration) from WatchHistory

--4. Number of Movies per Genre
Select COUNT(Genre)from Movies

--5. Earliest User Join Date 
select min(JoinDate) from [user]

--6. Latest Movie Release Year
select Max(ReleaseYear) from Movies

----Intermediate Level (Deeper Insights) 
-- Number of Users Per Subscription Type
select SubscriptionType, COUNT(*) as NumberOfUsers
from [user]
GROUP BY SubscriptionType;


--5. Total Watch Time per User
select U.FullName, sum(W.WatchDuration) as TotalWatchTime
from [user] U
JOIN WatchHistory W on U.UserID = W.UserID
group by U.FullName;

--6. Average Watch Duration per Movie
select M.Title, avg(W.WatchDuration) as AverageWatchDuration
from Movies M
JOIN WatchHistory W on M.MovieID = W.MovieID
GROUP BY M.Title;

--8. Number of Views per Movie (Including Zero) 
select M.Title ,count(W.WatchID) AS NumberOfViews
from Movies M
LEFT JOIN WatchHistory W ON M.MovieID = W.MovieID
GROUP BY M.Title;


--Average Movie Duration per Release Year
select ReleaseYear,avg( DurationMinutes) from Movies 
group by ReleaseYear

--Advanced Level (Challenging Scenarios)

--Most Watched Movie
select TOP 1 M.Title, SUM(W.WatchDuration) as WatchTime
from Movies M
JOIN WatchHistory W on M.MovieID = W.MovieID
GROUP BY M.Title
ORDER BY WatchTime DESC;

--8. Users Who Watched More Than 100 Minutes
SELECT U.FullName, SUM(W.WatchDuration) AS WatchTime
FROM [user] U
JOIN WatchHistory W ON U.UserID = W.UserID
GROUP BY U.FullName
HAVING SUM(W.WatchDuration) > 100;

--9. Total Watch Time per Genre
select M.Genre, sum(W.WatchDuration) as WatchTime
from Movies M
JOIN WatchHistory W on M.MovieID = W.MovieID
GROUP BY M.Genre;

--10. Identify Binge Watchers (Users Who Watched 2 or More Movies in One Day) 
select U.FullName, W.WatchDate, COUNT(*) as MoviesWatched
from [user] U
JOIN WatchHistory W on U.UserID = W.UserID
GROUP BY U.FullName, W.WatchDate
HAVING COUNT(*) >= 2;

--11. Genre Popularity (Total Watch Duration by Genre)
select  M.Genre, SUM(W.WatchDuration) as TotalDuration
from Movies M
JOIN WatchHistory W on M.MovieID = W.MovieID
GROUP BY M.Genre
ORDER BY TotalDuration DESC;

--12. User Retention Insight: Number of Users Joined Each Month
--12. User Retention Insight: Number of Users Joined Each Month 
SELECT format(JoinDate, 'yyyy-MM')as JoinMonth,--format: A format string (e.g., 'C', 'yyyy-MM-dd', 'N2').
COUNT(*) AS NumberOfUsers
FROM [user]
GROUP BY FORMAT(JoinDate, 'yyyy-MM')
ORDER BY JoinMonth;
