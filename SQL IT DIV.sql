CREATE DATABASE KennardNetflox
GO
USE KennardNetflox  --EXECUTE FROM CREATE DATABASE TO USE KENNARDNETFLOX 

--EXECUTE THE CREATE TABLES AND INPUTS UNTIL THE NEXT GO 
CREATE TABLE MsGenre
(
	GenreID VARCHAR(6) PRIMARY KEY,
	GenreName VARCHAR(50) NOT NULL,	 
	CONSTRAINT CheckGenreLength CHECK (LEN(GenreID)=5),
	CONSTRAINT CheckGenreID CHECK (GenreID LIKE 'MG[0-9][0-9][0-9]')
)

insert into MsGenre values ('MG001','Action')
insert into MsGenre values ('MG002','Horror')
insert into MsGenre values ('MG003','Drama')
insert into MsGenre values ('MG004','Comedy')
insert into MsGenre values ('MG005','Romance')

CREATE TABLE MsRegion
(
	RegionID VARCHAR(6) PRIMARY KEY,
	RegionName VARCHAR(50) NOT NULL,	 
	CONSTRAINT CheckRegionLength CHECK (LEN(RegionID)=5),
	CONSTRAINT CheckRegionID CHECK (RegionID LIKE 'MR[0-9][0-9][0-9]')
)

insert into MsRegion values ('MR001','Europe')
insert into MsRegion values ('MR002','America')
insert into MsRegion values ('MR003','Asia')
insert into MsRegion values ('MR004','Africa')

CREATE TABLE MsPayment
(
	PaymentMethodID VARCHAR(6) PRIMARY KEY,
	PaymentMethodName VARCHAR(50) NOT NULL,	 
	CONSTRAINT CheckPaymentLength CHECK (LEN(PaymentMethodID)=5),
	CONSTRAINT CheckPaymentID CHECK (PaymentMethodID LIKE 'MP[0-9][0-9][0-9]')
)

insert into MsPayment values ('MP001','E-Wallet')
insert into MsPayment values ('MP002','Credit Card')
insert into MsPayment values ('MP003','Paypal')

CREATE TABLE MsCustomer
(
	CustomerID VARCHAR(6) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	[Address] VARCHAR(100) NOT NULL,
	City VARCHAR(50) NOT NULL,
	Gender CHAR(3) NOT NULL,
	DOB DATETIME,
	CONSTRAINT CheckCustomerGender CHECK (Gender IN ('M','F')),
	CONSTRAINT CheckCustomerLength CHECK (LEN(CustomerID)=5),
	CONSTRAINT CheckCustomerID CHECK (CustomerID LIKE 'MC[0-9][0-9][0-9]'),
)

insert into MsCustomer values ('MC001','Wawan','Hardiansyah','Kebon Jeruk','Jakarta','M','1999-01-19')
insert into MsCustomer values ('MC002','Adam','Hill','Las Vegas','Nevada','M','1982-02-01')
insert into MsCustomer values ('MC003','Amalia','Melani','Banjaran','Bandung','F','1981-07-25')
insert into MsCustomer values ('MC004','Evelyn','Mitchell','Ontario','Canada','F','2000-09-15')
insert into MsCustomer values ('MC005','Ariana','Bennet','San Fransisco','California','F','1978-04-26')
insert into MsCustomer values ('MC006','Septi','Kusmawati','Malioboro','Yogyakarta','F','1983-05-06')
insert into MsCustomer values ('MC007','Edward','Mabena','Sandton','Johannesburg','M','1993-07-16')

CREATE TABLE MsStaff
(
	StaffID VARCHAR(6) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	[Address] VARCHAR(100) NOT NULL,
	Email VARCHAR(50),
	Phone VARCHAR(50),
	Gender CHAR(3) NOT NULL,
	DOB DATETIME,
	Salary INT NOT NULL,
	CONSTRAINT CheckStaffID CHECK (LEN(StaffID)=5),
	CONSTRAINT CheckStaffLength CHECK (StaffID LIKE 'MS[0-9][0-9][0-9]'),
	CONSTRAINT CheckStaffGender CHECK (Gender IN ('M','F'))
)

insert into MsStaff values ('MS001','Virman','Sitorus','Gg. Reksoninten No. 72, Administrasi Jakarta Pusat 32273','virman.sitorus@gmail.com','573-631-4215','M','2000-05-02',1500000)
insert into MsStaff values ('MS002','Faizah','Nuraini','Jr. Yap Tjwan Bing No. 964, Payakumbuh 50129','faizah.nuraini@gmail.com','123-232-4554','F','1992-12-28',2000000)
insert into MsStaff values ('MS003','Aisyah','Haryanti','Ds. Setiabudhi No. 575, Ambon 65374','aisyah.haryanti@gmail.com','213-546-3252','F','1997-08-13',1800000)
insert into MsStaff values ('MS004','Makara','Hutapea','Psr. Bakau No. 302, Pekanbaru 72840','makara.hutapea@gmail.com','435-631-5454','M','1991-02-01',2000000)

CREATE TABLE MsFilms
(
	FilmID VARCHAR(6) PRIMARY KEY,
	GenreID VARCHAR(6) REFERENCES MsGenre ON UPDATE CASCADE ON DELETE SET NULL,
	RegionID VARCHAR(6) REFERENCES MsRegion ON UPDATE CASCADE ON DELETE SET NULL,
	Title VARCHAR(255) NOT NULL,
	ReleaseDate DATE,
	Synopsis VARCHAR(255) NOT NULL,
	Director VARCHAR(50) NOT NULL,
	CONSTRAINT CheckFilmID CHECK (LEN(FilmID)=5),
	CONSTRAINT CheckFilmLength CHECK (FilmID LIKE 'MF[0-9][0-9][0-9]')
)

insert into MsFilms values ('MF001','MG004','MR001','The Sea Beast','2022','When a young girl stows away on the ship of a legendary sea monster hunter, they launch an epic journey into uncharted waters ??? and make history to boot.','Disney')
insert into MsFilms values ('MF002','MG002','MR003','Squid Game','2021','Hundreds of cash-strapped players accept a strange invitation to compete in childrens games. Inside, a tempting prize awaits ??? with deadly high stakes.','Hwang Dong Hyuk')
insert into MsFilms values ('MF003','MG002','MR002','Stranger Things','2016','When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.','The Duffer Brothers')
insert into MsFilms values ('MF004','MG001','MR001','Money Heist','2017','Eight thieves take hostages and lock themselves in the Royal Mint of Spain as a criminal mastermind manipulates the police to carry out his plan.','Alex Pina')
insert into MsFilms values ('MF005','MG005','MR001','Bridgerton','2020','The eight close-knit siblings of the Bridgerton family look for love and happiness in London high society. Inspired by Julia Quinns bestselling novels.','Chris Van Dusen')
insert into MsFilms values ('MF006','MG002','MR003','All of Us are Dead','2022','A high school becomes ground zero for a zombie virus outbreak. Trapped students must fight their way out ??? or turn into one of the rabid infected.','Lee JQ')
insert into MsFilms values ('MF007','MG001','MR001','The Witcher','2019','Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.','Lauren Schmidt Hissrich')
insert into MsFilms values ('MF008','MG003','MR004','The Burial of Kojo','2018','The film opens with a girl named Esi reflecting upon her father Kojo. Mystical elements???sacred birds, dreams, symbolisms in telenovelas???seep into Esis life','Blitz Bazawule')
insert into MsFilms values ('MF009','MG003','MR004','The Boy Who Harnessed The Wind','2018','The Boy Who Harnessed The Wind dramatizes the fascinating real life story of William Kamkwamba, a Malawian inventor','Chiwetel Ejiofor')
insert into MsFilms values ('MF010','MG001','MR003','Spider-Man: No Way Home','2021','When his loved ones are put at risk, Peter Parker asks Doctor Strange to restore his secret ??? and accidentally sets off a disaster of epic proportions.','Marvel Studios')

CREATE TABLE TrOrder
(
	OrderID VARCHAR(6) PRIMARY KEY,
	OrderDate DATETIME NOT NULL,
	PaymentMethodID VARCHAR(6) REFERENCES MsPayment ON UPDATE CASCADE ON DELETE SET NULL,
	CustomerID VARCHAR(6) REFERENCES MsCustomer ON UPDATE CASCADE ON DELETE SET NULL,
	StaffID VARCHAR(6) REFERENCES MsStaff ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT CheckOrderID CHECK (LEN(OrderID)=5),
	CONSTRAINT CheckOrderLength CHECK (OrderID LIKE 'TO[0-9][0-9][0-9]')
)

insert into TrOrder values ('TO001','2021-07-27 12:30:00.000','MP002','MC005','MS003')
insert into TrOrder values ('TO002','2021-08-06 07:50:00.000','MP001','MC001','MS002') -- WAWAN IS HERE
insert into TrOrder values ('TO003','2022-01-06 11:26:00.000','MP002','MC007','MS003')
insert into TrOrder values ('TO004','2021-08-10 08:55:00.000','MP002','MC002','MS004')
insert into TrOrder values ('TO005','2022-04-25 18:30:00.000','MP001','MC005','MS001') 
insert into TrOrder values ('TO006','2022-07-03 02:23:00.000','MP003','MC003','MS001') --AMALIA IS HERE 
insert into TrOrder values ('TO007','2021-12-13 20:19:00.000','MP003','MC006','MS004') -- SEPTI IS HERE
insert into TrOrder values ('TO008','2022-12-27 21:21:00.000','MP002','MC002','MS003')
insert into TrOrder values ('TO009','2021-03-10 10:28:00.000','MP001','MC003','MS002')
insert into TrOrder values ('TO010','2022-05-03 13:39:00.000','MP003','MC001','MS004') -- WAWAN IS HERE
insert into TrOrder values ('TO011','2021-02-18 08:30:00.000','MP001','MC004','MS001') 
insert into TrOrder values ('TO012','2021-02-14 14:50:00.000','MP002','MC006','MS003') -- SEPTI IS HERE 
insert into TrOrder values ('TO013','2022-11-15 13:26:00.000','MP003','MC003','MS002') -- AMALIA IS HERE 
insert into TrOrder values ('TO014','2021-09-20 23:55:00.000','MP001','MC001','MS002') -- WAWAN IS HERE
insert into TrOrder values ('TO015','2021-03-21 07:30:00.000','MP003','MC004','MS004')

CREATE TABLE TrOrderDetail
(
	OrderDetailID VARCHAR(6) PRIMARY KEY,
	OrderID VARCHAR(6) REFERENCES TrOrder ON UPDATE CASCADE ON DELETE SET NULL,
	FilmID VARCHAR(6) REFERENCES MsFilms ON UPDATE CASCADE ON DELETE SET NULL,
	RentalDuration INT NOT NULL,
	CONSTRAINT CheckOderDetailID CHECK (LEN(OrderDetailID)=5),
	CONSTRAINT CheckOderDetailLength CHECK (OrderDetailID LIKE 'OD[0-9][0-9][0-9]')
)

insert into TrOrderDetail values ('OD001','TO001','MF001',2)
insert into TrOrderDetail values ('OD002','TO002','MF009',4)
insert into TrOrderDetail values ('OD003','TO002','MF006',2)
insert into TrOrderDetail values ('OD004','TO003','MF001',2)
insert into TrOrderDetail values ('OD005','TO003','MF003',4)
insert into TrOrderDetail values ('OD006','TO003','MF006',3)
insert into TrOrderDetail values ('OD007','TO004','MF009',1)
insert into TrOrderDetail values ('OD008','TO005','MF003',2)
insert into TrOrderDetail values ('OD009','TO005','MF007',4)
insert into TrOrderDetail values ('OD010','TO006','MF007',1)
insert into TrOrderDetail values ('OD011','TO006','MF009',3)
insert into TrOrderDetail values ('OD012','TO007','MF004',3)
insert into TrOrderDetail values ('OD013','TO008','MF009',2)
insert into TrOrderDetail values ('OD014','TO008','MF007',4)
insert into TrOrderDetail values ('OD015','TO009','MF007',3)
insert into TrOrderDetail values ('OD016','TO009','MF008',4)
insert into TrOrderDetail values ('OD017','TO009','MF002',2)--2021
insert into TrOrderDetail values ('OD018','TO010','MF006',1)
insert into TrOrderDetail values ('OD019','TO010','MF002',4)--2021
insert into TrOrderDetail values ('OD020','TO011','MF002',3)--2021
insert into TrOrderDetail values ('OD021','TO011','MF001',4)
insert into TrOrderDetail values ('OD022','TO011','MF010',3)--2021
insert into TrOrderDetail values ('OD023','TO012','MF010',2)--2021
insert into TrOrderDetail values ('OD024','TO012','MF001',2)
insert into TrOrderDetail values ('OD025','TO013','MF009',3)
insert into TrOrderDetail values ('OD026','TO014','MF005',3)
insert into TrOrderDetail values ('OD027','TO014','MF006',1)
insert into TrOrderDetail values ('OD028','TO014','MF002',2)--2021
insert into TrOrderDetail values ('OD029','TO015','MF008',3)
insert into TrOrderDetail values ('OD030','TO015','MF006',1)

GO

-- FOR EACH PROCEDURES, EXECUTE UNTIL GO 

CREATE PROCEDURE GetTopFiveFilms -- FOR NUMBER 11 
AS
SELECT Title, Synopsis, AVG(RentalDuration) As 'Rental Duration' FROM MsFilms
JOIN TrOrderDetail ON TrOrderDetail.FilmID = MsFilms.FilmID
WHERE RentalDuration = 4
GROUP BY Title, Synopsis, RentalDuration
ORDER BY Title ASC, AVG(RentalDuration) DESC
OFFSET 0 Rows
FETCH NEXT 5 ROWS ONLY;
GO

CREATE PROCEDURE GetYearTotalFilm -- FOR NUMBER 12 
AS
SELECT YEAR(OrderDate) AS FilmYear, COUNT(DISTINCT OrderDate) AS CountData From TrOrder --Number 12 
GROUP BY YEAR(OrderDate)
GO

CREATE PROCEDURE GetOrderByCustomer @CustomerID nvarchar(6)
AS
SELECT TrOrder.OrderID, OrderDate, CONCAT(FirstName, ' ', LastName) as CustomerName, Title, RentalDuration From TrOrder --Number 13
JOIN MsCustomer ON MsCustomer.CustomerID = TrOrder.CustomerID
JOIN TrOrderDetail ON TrOrder.OrderID = TrOrderDetail.OrderID
JOIN MsFilms ON MsFilms.FilmID = TrOrderDetail.FilmID
WHERE MsCustomer.CustomerID = @CustomerID
GO

CREATE PROCEDURE GetFilm @RegionName nvarchar(50), @GenreName nvarchar(50) --Number 14 
AS
BEGIN
	SET NOCOUNT ON 
	IF @RegionName = ' '
	BEGIN 
	SELECT Title, GenreName, ReleaseDate, Synopsis, Director From MsFilms
	JOIN MsGenre ON MsGenre.GenreID = MsFilms.GenreID
	JOIN MsRegion ON MsRegion.RegionID = MsFilms.RegionID
	WHERE MsGenre.GenreName = @GenreName 
	ORDER BY ReleaseDate DESC
	END
	IF @GenreName = ' '
	BEGIN 
	SELECT Title, GenreName, ReleaseDate, Synopsis, Director From MsFilms
	JOIN MsGenre ON MsGenre.GenreID = MsFilms.GenreID
	JOIN MsRegion ON MsRegion.RegionID = MsFilms.RegionID
	WHERE MsRegion.RegionName = @RegionName
	ORDER BY ReleaseDate DESC
	END
	ELSE
	BEGIN
	SELECT Title, GenreName, ReleaseDate, Synopsis, Director From MsFilms
	JOIN MsGenre ON MsGenre.GenreID = MsFilms.GenreID
	JOIN MsRegion ON MsRegion.RegionID = MsFilms.RegionID
	WHERE MsGenre.GenreName = @GenreName AND MsRegion.RegionName = @RegionName
	ORDER BY ReleaseDate DESC
	END
END
GO

CREATE PROCEDURE GetOrderByCode @OrderID nvarchar(6), @OrderDetailID nvarchar(6) --Number 15
AS
BEGIN
	SET NOCOUNT ON 
	IF (@OrderDetailID IS NULL)
	BEGIN
	SELECT TrOrder.OrderID, OrderDate, Title, CONCAT(YEAR(ReleaseDate), ' : ',Director) As ReleaseDetail,RentalDuration From TrOrder
	JOIN TrOrderDetail ON TrOrder.OrderID = TrOrderDetail.OrderID 
	JOIN MsFilms ON MsFilms.FilmID = TrOrderDetail.FilmID
	WHERE TrOrder.OrderID = @OrderID
	GROUP BY TrOrder.OrderID, OrderDate, Title, ReleaseDate, Director, RentalDuration
	END
	IF (@OrderID IS NULL)
	BEGIN
	SELECT TrOrder.OrderID, OrderDate, Title, CONCAT(YEAR(ReleaseDate), ' : ',Director) As ReleaseDetail,RentalDuration From TrOrder
	JOIN TrOrderDetail ON TrOrder.OrderID = TrOrderDetail.OrderID 
	JOIN MsFilms ON MsFilms.FilmID = TrOrderDetail.FilmID
	WHERE TrOrderDetail.OrderDetailID = @OrderDetailID
	GROUP BY TrOrder.OrderID, OrderDate, Title, ReleaseDate, Director, RentalDuration
	END
END
GO

-- ONCE ALL OF THE PREVIOUS COMMANDS HAVE BEEN EXECUTED, EXECUTE THE ENTIRE SELECT PORTION AND EXEC

SELECT CONCAT(FirstName, ' ', LastName) as Name, CONCAT([Address],',',City) as CustAddress from MsCustomer ORDER BY DOB ASC --Number 1

SELECT CONCAT(RIGHT (StaffID, 3), ' - ' ,LastName) as Staff, Email, Gender FROM MsStaff WHERE Salary > 1500000 --Number 2

SELECT CONCAT(FirstName, '', LastName) as 'Customer Name',CAST(OrderDate AS date) as 'Order Date', RentalDuration from MsCustomer -- Number 3 
JOIN TrOrder ON TrOrder.CustomerID = MsCustomer.CustomerID 
JOIN TrOrderDetail ON TrOrder.OrderID = TrOrderDetail.OrderID 
WHERE OrderDate >= '2021-07-1' AND OrderDate <= '2021-09-30'

SELECT Title, CONCAT(YEAR(ReleaseDate),' : ', Director) As 'Film Details' FROM MsFilms --Number 4
JOIN MsRegion ON MsRegion.RegionID = MsFilms.RegionID WHERE RIGHT(MsRegion.RegionID,1) = 1 AND CHARINDEX(' ',MsFilms.Title) > 0 

SELECT Case When Gender = 'M' Then CONCAT('Mr. ', FirstName, ' ', LastName) When Gender = 'F' Then CONCAT('Ms. ', FirstName, ' ', LastName) END AS 'Customer Name', --Number 5
FORMAT(OrderDate, 'dd-MM-yyyy') As 'Order Date', Title FROM TrOrder
JOIN MsCustomer ON MsCustomer.CustomerID = TrOrder.CustomerID
JOIN TrOrderDetail ON TrOrder.OrderID = TrOrderDetail.OrderID 
JOIN MsFilms ON MsFilms.FilmID = TrOrderDetail.FilmID 
JOIN MsPayment ON MsPayment.PaymentMethodID = TrOrder.PaymentMethodID 
WHERE RIGHT(MsPayment.PaymentMethodID, 1) = 1 

SELECT Case When Gender = 'M' Then 'Male Staff' When Gender = 'F' Then 'Female Staff' End As Gender, CONCAT('Rp. ',SUM(Salary),'.-' ) As 'Total Salary' From MsStaff --Number 6
GROUP BY Gender
ORDER BY 'Total Salary' DESC

SELECT CONCAT(LEFT(RegionName,2),' ', Title) As Title, CONCAT(REVERSE(SUBSTRING(REVERSE(Director),1, CHARINDEX(' ',REVERSE(Director))-1)),' ',Synopsis) As Synopsis, CAST(ReleaseDate AS DATE) as ReleaseDate From MsFilms --Number 7
JOIN MsRegion ON MsRegion.RegionID = MsFilms.RegionID
JOIN MsGenre on MsGenre.GenreID = MsFilms.GenreID
WHERE RIGHT(MsGenre.GenreID,1) = 2

SELECT LOWER(CONCAT(FirstName, ' ', LastName)) as 'Customer Name', COUNT(DISTINCT TrOrder.OrderDate) as 'Order Count', COUNT(MsFilms.FilmID)As 'Film Count' FROM MsCustomer --Number 8
JOIN TrOrder ON MsCustomer.CustomerID = TrOrder.CustomerID
JOIN TrOrderDetail ON TrOrderDetail.OrderID = TrOrder.OrderID 
JOIN MsFilms ON MsFilms.FilmID = TrOrderDetail.FilmID
WHERE OrderDate >= '2021-02-1' AND OrderDate <= '2021-12-31' 
GROUP BY CONCAT(FirstName, ' ', LastName) 
ORDER BY 'Film Count' ASC, 'Order Count' DESC

SELECT CONCAT(MsCustomer.FirstName, ' ', MsCustomer.LastName) as 'Customer Name', FORMAT(OrderDate,'h:mm tt') As 'Customer Order Time', SUM(RentalDuration) As 'Total Rental Duration' FROM MsCustomer --Number 9 
JOIN TrOrder ON MsCustomer.CustomerID = TrOrder.CustomerID
JOIN TrOrderDetail ON TrOrderDetail.OrderID = TrOrder.OrderID
JOIN MsStaff ON MsStaff.StaffID = TrOrder.StaffID
WHERE RIGHT(MsStaff.StaffID, 1) = 1 OR RIGHT(MsStaff.StaffID, 1) = 3 
GROUP BY CONCAT(MsCustomer.FirstName, ' ', MsCustomer.LastName), OrderDate 

SELECT CONCAT(MsCustomer.FirstName, ' ', MsCustomer.LastName) As 'Customer Name' , CASE When MsCustomer.Gender = 'M' Then 'Male' When MsCustomer.Gender =  'F' Then 'Female' End As 'Customer Gender', 
COUNT(DISTINCT TrOrder.OrderDate) As 'Total Order count',AVG(RentalDuration) As 'Average Rental Duration' From MsCustomer
JOIN TrOrder ON MsCustomer.CustomerID = TrOrder.CustomerID
JOIN TrOrderDetail ON TrOrderDetail.OrderID = TrOrder.OrderID 
JOIN MsStaff ON MsStaff.StaffID = TrOrder.StaffID
JOIN MsFilms ON MsFilms.FilmID = TrOrderDetail.FilmID
WHERE RIGHT(MsStaff.StaffID, 1) = 2
GROUP BY CONCAT(MsCustomer.FirstName, ' ', MsCustomer.LastName), MsCustomer.Gender
ORDER BY 'Total Order Count' DESC --Number 10 

EXEC GetTopFiveFilms --NUMBER 11 (Refer to Create Procedure On TOP) 

EXEC GetYearTotalFilm --NUMBER 12 (Refer to Create Procedure On TOP) 

EXEC GetOrderByCustomer @CustomerID = 'MC001' -- NUMBER 13 (Refer to Create Prodecure On TOP) 

EXEC GetFilm @RegionName = 'Asia' , @GenreName = 'Horror' --NUMBER 14 (Refer to Create Procedure On TOP) 
EXEC GetFilm @RegionName = 'Asia' , @GenreName = ' '

EXEC GetOrderByCode @OrderID = 'TO002', @OrderDetailID = NULL --NUMBER 15 (Refer to Create Procedure On TOP) 
EXEC GetOrderByCode @OrderID = NULL, @OrderDetailID = 'OD004'
