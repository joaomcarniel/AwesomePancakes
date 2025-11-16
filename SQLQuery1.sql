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
--USE PancakeDB;
--CREATE TABLE Booking(
--	IdBooking INT IDENTITY(1,1) PRIMARY KEY,
--	NameBooking NVARCHAR(100) NOT NULL,
--	EmailBooking NVARCHAR(100),
--	DateBooking DATE NOT NULL,
--	TimeBooking TIME NOT NULL,
--	MessageBooking NVARCHAR(MAX),
--	ContactDate DATETIME
--);

CREATE TABLE Coupons (
    IdCoupon INT IDENTITY PRIMARY KEY,
    Code NVARCHAR(50) NOT NULL,
    DiscountPercentage INT NOT NULL,
    ValidFrom DATE NOT NULL,
    ValidTo DATE NOT NULL,
    ApplicableProducts NVARCHAR(200) NULL 
);
