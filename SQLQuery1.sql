--Use PancakeDB;

--CREATE TABLE Staff(
--	IdStaff INT IDENTITY(1,1) PRIMARY KEY,
--	StaffName NVARCHAR(50),
--	StaffRole NVARCHAR(50),
--	StaffDescription NVARCHAR(MAX),
--	StaffImageUrl NVARCHAR(500)
--);

--INSERT INTO Staff (StaffName, StaffRole, StaffDescription, StaffImageUrl) VALUES
--('João Marcos Carniel', 'Developer', 'Responsible for creating bugs in prod', '/Images/andromeda.jpg');

--INSERT INTO Staff (StaffName, StaffRole, StaffDescription, StaffImageUrl) VALUES
--('Julia', 'Supervisor', 'Responsible for the Restaurant Atmosphere', '/Images/aurora2.jpg');

--INSERT INTO Staff (StaffName, StaffRole, StaffDescription, StaffImageUrl) VALUES
--('Sean', 'Waiter', 'Responsible for bringing the pancakes to you', '/Images/m16_pillars.jpg');

--CREATE TABLE Booking(
--	IdBooking INT IDENTITY(1,1) PRIMARY KEY,
--	NameBooking NVARCHAR(100) NOT NULL,
--	EmailBooking NVARCHAR(100),
--	DateBooking DATE NOT NULL,
--	TimeBooking TIME NOT NULL,
--	MessageBooking NVARCHAR(MAX),
--	ContactDate DATETIME
--);

--CREATE TABLE Coupons (
--    IdCoupon INT IDENTITY PRIMARY KEY,
--    Code NVARCHAR(50) NOT NULL,
--    DiscountPercentage INT NOT NULL,
--    ValidFrom DATE NOT NULL,
--    ValidTo DATE NOT NULL,
--    ApplicableProducts NVARCHAR(200) NULL 
--);

--USE PancakeDB;

-- SELECT * FROM MenuItem;

--INSERT INTO MenuItem(MenuItemName, MenuItemDescription, MenuItemPrice, MenuItemImage, IsActive, MenuItemCategory)
--VALUES
--('Syrup Pancake', 'Delicious pancake with honey syrup on top',11,'', 1, 'Pancake'),
--('Chocolate Pancake', 'Delicious pancake with creamy chocolate on top',11,'', 1, 'Pancake' ),
--('Strawberry Pancake', 'Delicious pancake with vivid strawberries on top',11,'', 1, 'Pancake'),
--('Blueberry Pancake', 'Delicious pancake with vivid blueberries on top',11,'', 1, 'Pancake'),
--('Nutella Pancake', 'Delicious pancake with nutella on top',12,'', 1, 'Pancake'),
--('French Fries', 'Skinny fries with parmesan on top', 5,'', 1, 'Side'),
--('Sweet Potato Fries', 'Skinny sweet potato fries with pepper', 5,'', 1, 'Side'),
--('Side Salad', 'Lettuce, onions, tomato and carrots with creamy garlic on top', 6,'', 1, 'Salad'),
--('Coke', 'Coca Cola', 3.5,'', 1, 'Drink'),
--('Fanta', 'Fanta Orange', 3.5,'', 1, 'Drink'),
--('Still Water', 'Water in Bottow', 3.5,'', 1, 'Drink'),
--('Sparkling Water', 'Water in Bottow', 3.5,'', 1, 'Drink');

-- ALTER TABLE Booking ADD NumberPeople INT NOT NULL DEFAULT 1;

--CREATE TABLE RestaurantTables (
--    TableNumber INT PRIMARY KEY,
--    Capacity INT NOT NULL
--);

--INSERT INTO RestaurantTables(TableNumber, Capacity) VALUES
--(1, 2),
--(2, 2),
--(3, 4),
--(4, 4),
--(5, 2),
--(6, 2),
--(7, 4),
--(8, 4);

--Create table BookingTables(
--	IdBookingTable INT IDENTITY PRIMARY KEY,
--	IdBooking INT FOREIGN KEY REFERENCES Booking(IdBooking),
--	TableNumber INT FOREIGN KEY REFERENCES RestaurantTables(TableNumber)
--);

--ALTER TABLE BookingTables ADD TimeBooking time(7);
--ALTER TABLE BookingTables ADD DateBooking date;

--INSERT INTO BookingTables(IdBooking, TableNumber)
--VALUES (7, 1), (8,1), (9, 2);

--use PancakeDB
SELECT * FROM Booking;
--SELECT * FROM RestaurantTables;

--UPDATE BookingTables SET TimeBooking = '19:00:00.0000000', DateBooking = '2025-11-25' WHERE IdBooking = 7;
--UPDATE BookingTables SET TimeBooking = '20:00:00.0000000', DateBooking = '2025-11-25' WHERE IdBooking = 8;
--UPDATE BookingTables SET TimeBooking = '20:00:00.0000000', DateBooking = '2025-11-25' WHERE IdBooking = 9;
--SELECT * FROM BookingTables;
/*
1. Criar a tabela de mesas (numero da mesa e qtd de pessoas)
2. Verificar no booking se tem mesas disponiveis pra quantidade de pessoas para aquela hora;
*/

--SELECT TimeBooking FROM Booking WHERE DateBooking = '2025-11-20';


--SELECT TimeBooking, SUM(NumberPeople) People FROM Booking
--WHERE DateBooking = '2025-11-20'
--GROUP BY TimeBooking;

SELECT MAX(TableNumber) + 1 NextAvailable  FROM BookingTables WHERE DateBooking = '2025-11-25' AND  TimeBooking = '19:00:00.0000000';

