/*
Zero Downtime Demos

01 - Create Schema

This script 
- Creates a number of objects
- adds some sample data

Copyright 2023 Steve Jones
*/
USE ZeroDowntime
GO
-- create sample table
CREATE TABLE Customer
( CustomerID INT NOT NULL IDENTITY(1,1) CONSTRAINT CustomerPK PRIMARY KEY,
  CustomerName VARCHAR(100), 
  CustomerAddress VARCHAR(200),
  City VARCHAR(30),
  St VARCHAR(2),
  zip VARCHAR(9)
)
GO
INSERT dbo.Customer
  (CustomerName, CustomerAddress, City, St, zip)
VALUES
( 'Maria Anders', 'Obere Str. 57', 'Berli', NULL, '12209' ),
( 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021' ),
( 'Antonio Moreno', 'Mataderos  2312', 'México D.F.', NULL, '05023' ),
( 'Thomas Hardy', '120 Hanover Sq.', 'Londo', NULL, 'WA1 1DP' ),
( 'Christina Berglund', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22' ),
( 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', NULL, '68306' ),
( 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', NULL, '67000' ),
( 'Martín Sommer', 'C/ Araquil, 67', 'Madrid', NULL, '28023' ),
( 'Laurence Lebiha', '12, rue des Bouchers', 'Marseille', NULL, '13008' ),
( 'Elizabeth Lincol', '23 Tsawassen Blvd.', 'Tsawasse', 'BC', 'T2F 8M4' ),
( 'Victoria Ashworth', 'Fauntleroy Circus', 'Londo', NULL, 'EC2 5NT' ),
( 'Patricio Simpso', 'Cerrito 333', 'Buenos Aires', NULL, '1010' ),
( 'Francisco Chang', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022' ),
( 'Yang Wang', 'Hauptstr. 29', 'Ber', NULL, '3012' ),
( 'Pedro Afonso', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043' ),
( 'Elizabeth Brow', 'Berkeley Gardens 12  Brewery', 'Londo', NULL, 'WX1 6LT' ),
( 'Sven Ottlieb', 'Walserweg 21', 'Aache', NULL, '52066' ),
( 'Janine Labrune', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000' ),
( 'Ann Devo', '35 King George', 'Londo', NULL, 'WX3 6FW' ),
( 'Roland Mendel', 'Kirchgasse 6', 'Graz', NULL, '8010' )
GO
GRANT SELECT ON Customer TO ClientApp
GO
CREATE TABLE OrderHeader
(OrderID INT NOT NULL IDENTITY(1,1) CONSTRAINT OrderPK PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate DATETIME,
ShipDate DATETIME)
GO
INSERT dbo.OrderHeader
  (CustomerID, OrderDate, ShipDate)
VALUES
  ( 5, N'1996-07-04T00:00:00', N'1996-07-16T00:00:00' ),
( 16, N'1996-07-05T00:00:00', N'1996-07-10T00:00:00' ),
( 4, N'1996-07-08T00:00:00', N'1996-07-12T00:00:00' ),
( 3, N'1996-07-08T00:00:00', N'1996-07-15T00:00:00' ),
( 4, N'1996-07-09T00:00:00', N'1996-07-11T00:00:00' ),
( 3, N'1996-07-10T00:00:00', N'1996-07-16T00:00:00' ),
( 5, N'1996-07-11T00:00:00', N'1996-07-23T00:00:00' ),
( 19, N'1996-07-12T00:00:00', N'1996-07-15T00:00:00' ),
( 3, N'1996-07-15T00:00:00', N'1996-07-17T00:00:00' ),
( 4, N'1996-07-16T00:00:00', N'1996-07-22T00:00:00' ),
( 1, N'1996-07-17T00:00:00', N'1996-07-23T00:00:00' ),
( 14, N'1996-07-18T00:00:00', N'1996-07-25T00:00:00' ),
( 14, N'1996-07-19T00:00:00', N'1996-07-29T00:00:00' ),
( 4, N'1996-07-19T00:00:00', N'1996-07-30T00:00:00' ),
( 18, N'1996-07-22T00:00:00', N'1996-07-25T00:00:00' ),
( 9, N'1996-07-23T00:00:00', N'1996-07-31T00:00:00' ),
( 6, N'1996-07-24T00:00:00', N'1996-08-23T00:00:00' ),
( 2, N'1996-07-25T00:00:00', N'1996-08-12T00:00:00' ),
( 13, N'1996-07-26T00:00:00', N'1996-07-31T00:00:00' ),
( 4, N'1996-07-29T00:00:00', N'1996-08-06T00:00:00' ),
( 18, N'1996-07-30T00:00:00', N'1996-08-02T00:00:00' ),
( 5, N'1996-07-31T00:00:00', N'1996-08-09T00:00:00' ),
( 1, N'1996-08-01T00:00:00', N'1996-08-02T00:00:00' ),
( 16, N'1996-08-01T00:00:00', N'1996-08-30T00:00:00' ),
( 6, N'1996-08-02T00:00:00', N'1996-08-06T00:00:00' ),
( 3, N'1996-08-05T00:00:00', N'1996-08-12T00:00:00' ),
( 16, N'1996-08-06T00:00:00', N'1996-08-16T00:00:00' ),
( 1, N'1996-08-07T00:00:00', N'1996-08-09T00:00:00' ),
( 8, N'1996-08-08T00:00:00', N'1996-08-14T00:00:00' ),
( 12, N'1996-08-09T00:00:00', N'1996-08-13T00:00:00' ),
( 8, N'1996-08-12T00:00:00', N'1996-08-16T00:00:00' ),
( 8, N'1996-08-13T00:00:00', N'1996-08-16T00:00:00' ),
( 2, N'1996-08-14T00:00:00', N'1996-09-12T00:00:00' ),
( 14, N'1996-08-14T00:00:00', N'1996-08-21T00:00:00' ),
( 4, N'1996-08-15T00:00:00', N'1996-08-21T00:00:00' ),
( 3, N'1996-08-16T00:00:00', N'1996-08-23T00:00:00' ),
( 14, N'1996-08-19T00:00:00', N'1996-08-27T00:00:00' ),
( 11, N'1996-08-20T00:00:00', N'1996-08-26T00:00:00' ),
( 8, N'1996-08-21T00:00:00', N'1996-08-30T00:00:00' ),
( 8, N'1996-08-22T00:00:00', N'1996-08-28T00:00:00' )
GO
GRANT SELECT, INSERT, UPDATE ON dbo.OrderHeader TO ClientApp
GO
CREATE OR ALTER PROCEDURE dbo.GetOrder
	@OrderID INT 
AS
SELECT *
 FROM dbo.OrderHeader AS o
 INNER JOIN  dbo.Customer AS c ON c.CustomerID = o.CustomerID
 where o.OrderID = @orderID
GO
GRANT EXECUTE ON GetOrder TO ClientApp
GO
CREATE OR ALTER PROCEDURE dbo.GetRandomOrder
AS
BEGIN
  DECLARE @o INT;
  SELECT TOP 1 @o = o.orderid FROM dbo.OrderHeader AS o ORDER BY NEWID ();
  EXEC dbo.GetOrder @o;
END;
GO
GRANT EXECUTE ON dbo.GetRandomOrder TO ClientApp
GO

CREATE PROCEDURE UpdateCustomer
  @CustomerID INT
AS
BEGIN
  DECLARE @c VARCHAR(50)
  SELECT @c = PeopleName FROM dbo.GetNewName AS gnn
  UPDATE dbo.Customer
   SET CustomerName = @c
   WHERE CustomerID = @CustomerID

END
go
-- random data for making changes
CREATE TABLE dbo.PeopleName
( PeopleNameID INT IDENTITY(1,1) CONSTRAINT PeopleNamePK PRIMARY KEY,
  FirstName VARCHAR(30),
  LastName VARCHAR(30)
)
GO
INSERT dbo.PeopleName (FirstName, LastName) 
VALUES 
 ('Steve', 'Jones'),
 ('Sam', 'Smith'),
 ('Sara', 'Johnson'),
 ('Andy', 'Warren'),
 ('Brian', 'Knight'),
 ('Tony', 'Randall'),
 ('Kathy', 'Hyde'),
 ('Mary', 'Madro'),
 ('Beth', 'Houston'),
 ('Mark', 'Hamil'),
 ('Lucy', 'Harris')
GO
CREATE VIEW GetNewName
AS
    SELECT TOP 1
		A.firstname + ' ' + B.lastname AS PeopleName
	 FROM dbo.PeopleName AS a CROSS JOIN dbo.PeopleName AS b
	 ORDER BY NEWID()
GO
GRANT SELECT ON dbo.GetNewName TO ClientApp
GO
CREATE TABLE dbo.CityName
( CityNameID INT IDENTITY(1,1) CONSTRAINT CityNamePK PRIMARY KEY,
  CityName VARCHAR(30)
)
GO
INSERT dbo.CityName (CityName) 
VALUES 
 ('Alamosa'),
('Aurora'),
('Aspen'),             
('Boulder'),
('Breckenridge'),
('Brighton'),
('Canon City'),
('Central City'),
('Climax'),
('Colorado Springs'),
('Cortez'),
('Cripple Creek'),
('Denver'),
('Durango'),
('Englewood'),
('Estes Park'),
('Fort Collins'),
('Fort Morgan'),
('Georgetown')
GO
CREATE VIEW GetNewCity
AS
    SELECT TOP 1
		cn.CityName
	 FROM dbo.CityName AS cn
	 ORDER BY NEWID()
GO
GRANT SELECT ON dbo.GetNewCity TO ClientApp
GO
CREATE TABLE dbo.Street
( StreetID INT IDENTITY(1,1) CONSTRAINT StreetPK PRIMARY KEY,
  StreetName VARCHAR(30)
)
GO
INSERT dbo.Street (StreetName)
VALUES 
('Ely Quadrant'),
('Celandine Hill'),
('Hollingreen Lane'),
('Forge Nook'),
('Flint South'),
('Arden Hill'),
('Branksome Strand'),
('Alexandra Barton'),
('Lees Grove'),
('East Acton Lane')
GO
CREATE VIEW GetNewAddress
AS
    SELECT TOP 1 
		CAST( CAST(RAND() * 1000 AS int) AS VARCHAR(4)) + ' ' + s.StreetName AS Addr
	 FROM dbo.Street AS s
	 ORDER BY NEWID()
GO
GRANT SELECT ON GetNewAddress TO ClientApp
GO 
CREATE TABLE dbo.Zip
( ZipID INT IDENTITY(1,1) CONSTRAINT ZipPK PRIMARY KEY,
  Postalcode VARCHAR(5)
)
GO
INSERT dbo.Zip (Postalcode)
VALUES 
('80013'),
('80134'),
('80015'),
('80219'),
('80016'),
('80634'),
('80504'),
('80022'),
('80229'),
('80631'),
('80525'),
('80020'),
('80011'),
('80012'),
('80538'),
('80918'),
('80233'),
('80123')
GO
CREATE VIEW GetNewZip
AS
    SELECT TOP 1 
		z.Postalcode
	 FROM dbo.Zip AS z
	 ORDER BY NEWID()
GO
GRANT SELECT ON dbo.GetNewZip TO ClientApp
GO
CREATE OR ALTER PROCEDURE dbo.AddNewCustomer
AS
BEGIN
    DECLARE @custname VARCHAR(100)
	, @Addr VARCHAR(50)
	, @cityname VARCHAR(30)
	, @postalcode VARCHAR(5)
	, @custid int
	SELECT @custname = PeopleName FROM dbo.GetNewName AS gnn
	SELECT @Addr = gna.Addr FROM dbo.GetNewAddress AS gna
	SELECT @cityname = CityName FROM dbo.CityName AS cn
	SELECT @postalcode = gnz.Postalcode FROM dbo.GetNewZip AS gnz
	INSERT dbo.Customer
	  (CustomerName, CustomerAddress, City, St, zip)
	VALUES
	  (@custname, @Addr, @cityname, 'CO', @postalcode)
	SELECT @custid = SCOPE_IDENTITY()
	INSERT dbo.OrderHeader
	VALUES
	  (@custid, GETDATE(), DATEADD(MONTH, 1, GETDATE()))
	SELECT @custname AS CustomerName, @Addr AS Addr, @cityname AS City, 'CO' AS St, @postalcode AS Postal
END
GO
GRANT EXECUTE ON dbo.AddNewCustomer TO ClientApp
GO
-- EXEC dbo.AddNewCustomer
GO
CREATE OR ALTER PROCEDURE dbo.AddNewOrder
AS
BEGIN
    DECLARE @custid int
	, @orderdate DATETIME
	, @shipdate datetime
	SELECT TOP 1 @custid = c.CustomerID FROM dbo.Customer AS c ORDER BY NEWID()
	SELECT @orderdate = DATEADD( DAY, ABS(CHECKSUM(NEWID())) / 1000000, '2020-01-01')
	SELECT @shipdate = DATEADD( DAY, ABS(CHECKSUM(NEWID())) / 1000000, '2020-02-01')
	INSERT dbo.OrderHeader
	  (CustomerID, OrderDate, ShipDate)
	VALUES
	  (@custid, @orderdate, @shipdate)
END
GO
GRANT EXECUTE ON dbo.AddNewOrder TO ClientApp
GO
--EXEC dbo.AddNewOrder
GO
