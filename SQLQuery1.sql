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
