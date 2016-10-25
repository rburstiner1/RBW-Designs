CREATE DATABASE RBW_Designs;
GO

USE RBW_Designs;
GO


CREATE TABLE Supplier(
  SupplierID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  Contact_Name varchar(50) NOT NULL,
  Phone_Number bigint NOT NULL);

CREATE TABLE Materials(
  MaterialsID bigint NOT NULL PRIMARY KEY,
  SupplierID bigint NOT NULL,
  M_Type varchar(50) NOT NULL);

CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  C_Address varchar(50) NOT NULL,
  First_Order_Date date NOT NULL);

CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductTypeID bigint NOT NULL,
  MaterialsID bigint NOT NULL,
  Name varchar(50) NOT NULL,
  UnitPrice money NOT NULL,
  Color varchar(50) NOT NULL);

  CREATE TABLE Sales(
  SalesID bigint NOT NULL PRIMARY KEY,
  S_Date date NOT NULL,
  PaymentID bigint NOT NULL,
  EmployeeID bigint NULL,
  CustomerID bigint NOT NULL,
  OrderQty integer NOT NULL,
  TotalDue money NOT NULL,
  OnlineSale binary NULL,
  ProductID bigint NOT NULL);

  CREATE TABLE Product_Type(
  ProductTypeID bigint NOT NULL PRIMARY KEY,
  ProductType varchar(50) NOT NULL);

  CREATE TABLE Payment(
  PaymentID bigint NOT NULL PRIMARY KEY,
  CustomerID bigint NOT NULL,
  CreditCardNumber bigint NOT NULL,
  CreditCardExpiration date NOT NULL,
  CVV integer NOT NULL);

  CREATE TABLE Employee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  StartDate date NOT NULL,
  Territory varchar(50) NOT NULL);

  GO
  Alter table Materials ADD CONSTRAINT FK_SupplierID
  FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID);
  
  Alter table Product ADD CONSTRAINT FK_ProductTypeID
  FOREIGN KEY (ProductTypeID) REFERENCES Product_Type (ProductTypeID);

 Alter table Product ADD CONSTRAINT FK_MaterialsID
  FOREIGN KEY (MaterialsID) REFERENCES Materials (MaterialsID);

 Alter table Payment ADD CONSTRAINT FK_CustomerID
  FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);

 Alter table Sales ADD CONSTRAINT FK1_CustomerID
  FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);

 Alter table Sales ADD CONSTRAINT FK_PaymentID
  FOREIGN KEY (PaymentID) REFERENCES Payment (PaymentID);

   Alter table Sales ADD CONSTRAINT FK_ProductID
  FOREIGN KEY (ProductID) REFERENCES Product (ProductID);

  Alter table Sales ADD CONSTRAINT FK_EmployeeID
  FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

  GO

  INSERT INTO Supplier (SupplierID, Name, Contact_Name,Phone_Number) VALUES 
(1, 'Black Leather Warehouse', 'Kim Jones', 9298574848),
(2, 'Blue Canvas Inc.', 'Bobby Wright', 8795647432),
(3, 'Pink Canvas Supply', 'Robert Smith', 7627162732),
(4, 'Tan Material & Company', 'Michael Johnson',5768492929),
(5, 'Brown Leather Design', 'John Doe', 7834658282),
(6, 'Tan Leather Corp', 'Jane Doe', 9023547454),
(7, 'The Leather Guy', 'Merideth Grey', 8736470303),
(8, 'Weather Leather Supply', 'Noah Webb', 5647382929),
(9, 'Zach White Leather Company', 'Zach White', 3462738482),
(10, 'Canvas Suppliers', 'Emma Reynolds', 9384930202);

  INSERT INTO Materials (MaterialsID, SupplierID, M_Type) VALUES 
(1, 1,'Black Leather'),
(2, 2, 'Blue Canvas'),
(3, 3,'Pink Canvas'),
(4, 4,'Tan Canvas'),
(5, 5,'Brown Leather'),
(6, 6,'Tan Leather'),
(7, 7,'Navy Leather'),
(8, 8,'Red Leather'),
(9, 9,'White Leather'),
(10, 10,'Black Canvas');

  INSERT INTO Customer (CustomerID, Name, C_Address, First_Order_Date) VALUES 
(1, 'Kevin Wall','12 Forest Street','2015-05-10'),
(2, 'Zhi Li','40 Linden Street', '2015-12-20'),
(3,'Jeff Smith','80 Pine Street', '2016-06-01'),
(4,'John Dietrick', '63 Chesnut Drive', '2016-04-03'),
(5,'Patrick Gregory', '102 Walnut Street', '2016-04-15'),
(6,'Richard Cleary', '198 Crabapple Blvd', '2015-08-15'),
(7,'Amy Blitz', '75 Willow Drive', '2015-09-25'),
(8,'Virginia Soybel', '15 Apple Tree Lane', '2016-07-07'),
(9,'Denise Troxell', '24 Almond Street', '2015-06-15'),
(10,'Steven Eriksen', '87 Oak Lane', '2015-11-21');

INSERT INTO Product_Type (ProductTypeID, ProductType ) VALUES 
(1,'Luxury'),
(2,'Children'),
(3,'Commuter'),
(4,'Beach'),
(5,'Night Out'),
(6,'Outdoors'),
(7,'Travel'),
(8,'Teen'),
(9,'College'),
(10,'Athletic');

INSERT INTO Product (ProductID, ProductTypeID, MaterialsID, Name, UnitPrice, Color) VALUES 
(1, 1,1,'Luxury Leather',$149.99, 'Black'),
(2, 1,5,'Luxury Leather', $149.99, 'Brown'),
(3,2,2,'Child Play Backpack', $24.99, 'Blue'),
(4,2,3,'Child Play Backpack', $24.99, 'Pink'),
(5,3,7,'Commuter Backpack', $74.99, 'Navy'),
(6,3,6,'Commuter Backpack', $74.99, 'Tan'),
(7,4,9,'Beach Backpack', $34.99, 'White'),
(8,4,6,'Beach Backpack', $34.99, 'Tan'),
(9,5,8,'Girls Night Out', $49.99, 'Red'),
(10,5,10,'Guys Night Out', $49.99, 'Black');

INSERT INTO Payment (PaymentID, CustomerID, CreditCardNumber,CreditCardExpiration, CVV) VALUES 
(1,1, 3278888929208746, '2019-01-31', 432),
(2,2, 2436378392029192, '2018-10-31', 321),
(3,3, 9084738291839023, '2017-11-30', 980),
(4,4, 1029384939475643, '2018-04-30', 574),
(5,5, 9305482385732984, '2019-03-31', 908),
(6,6, 3829847532894302, '2017-02-28', 674),
(7,7, 6758482938430294, '2017-07-31', 564),
(8,8, 7564383239084323, '2018-08-3', 444),
(9,9, 5473894732094803, '2017-09-30', 327),
(10,10, 3248023589843751,'2019-10-31', 329);

INSERT INTO Employee (EmployeeID, Name, StartDate, Territory) VALUES 
(1,'Jamie Lee', '2015-01-13', 'Massachuesetts'),
(2,'Madison Price', '2015-02-23', 'Massachuesetts'),
(3,'Lindsey James', '2015-05-26', 'New York'),
(4,'Sydney Kent', '2015-05-30', 'New York'),
(5,'Braden Johnson', '2015-06-15', 'New York'),
(6,'Emilie Nader', '2015-07-21', 'Colorado'),
(7,'Jordan Hess', '2015-08-09', 'Colorado'),
(8,'Ally Dunn', '2015-09-23', 'Florida'),
(9,'Kelsie Brook', '2015-10-24', 'California'),
(10,'James Linden', '2015-12-01', 'California');



INSERT INTO Sales (SalesID, S_Date, PaymentID, EmployeeID, CustomerID, OrderQty, TotalDue, OnlineSale, ProductID) VALUES 
(1, '2015-11-21', 1,2,1,2,$99.98,NULL,10),
(2, '2016-06-14', 2,1,2,1, $74.99,NULL,5),
(3, '2016-08-14', 3,3,3,1,$24.99,NULL,3),
(4, '2016-08-28', 3,3,3,1,$24.99,NULL,4),
(5, '2016-07-07', 8,6,8,3, $104.97,NULL,7),
(6, '2015-12-20', 7,4,7,1, $74.99,NULL,6),
(7, '2016-10-05', 10,3,10,1, $49.99,NULL,10),
(8, '2015-06-15', 9,2,9,1,$149.99, NULL, 1),
(9, '2016-09-14', 9,2,9,2, $299.98,NULL,2),
(10,'2016-03-20', 6,9,6,1, $74.99,NULL,5);

