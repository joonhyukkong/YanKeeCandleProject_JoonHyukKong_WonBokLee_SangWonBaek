CREATE DATABASE YanKeeCandleDb;
GO

USE YanKeeCandleDb;
GO

-- Create the customer and order tables
CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  StoreName varchar(50) NOT NULL,
  StoreAddress varchar(50) NOT NULL,
  StoreState varchar(50) NOT NULL,
  StorePhoneNumber bigint NOT NULL);

CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductName varchar(50) NOT NULL,
  UnitPrice bigint NOT NULL,
  Category varchar(50) NOT NULL);

CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  CustomerAddress varchar(50) NOT NULL,
  CustomerState varchar(50) NOT NULL,
  CustomerPhoneNumber bigint NULL,
  EmailAddress varchar(50) NOT NULL);

CREATE TABLE OrderDetail(
  OrderDetailID bigint NOT NULL PRIMARY KEY,
  ProductID bigint NOT NULL,
  OrderID bigint NOT NULL,
  Quantity bigint NOT NULL);

CREATE TABLE OrderHead(
  OrderID bigint NOT NULL PRIMARY KEY,
  CustomerID bigint NOT NULL,
  StoreID bigint NOT NULL,
  DeliveryMethod varchar(50) NOT NULL,
  DeliveryStartDay varchar(50) NOT NULL,
  DeliveryEndDay varchar(50) NOT NULL,
  PaymentMethod varchar(50) NOT NULL);

  -- Create the relationship: the first FK in CourseEnrollment
ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Order
FOREIGN KEY (OrderID) REFERENCES OrderHead(OrderID);

ALTER TABLE OrderHead ADD CONSTRAINT FK_Order_Store
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);

ALTER TABLE OrderHead ADD CONSTRAINT FK_Order_Customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

GO

INSERT INTO Store (StoreID, StoreName, StoreAddress, StoreState, StorePhoneNumber) VALUES
(1, 'Newbury YankeeCandle', 'Newbury st. 700-1', 'MA', '78137217289'),
(2, 'Prudential YankeeCandle', 'Prudential Mall 102-4', 'MA', '78456325962'),
(3, 'Framingham YankeeCandle', 'Framingham James st. 142', 'MA', '5632698566'),
(4, 'China Town YankeeCandle', 'Elizabeth st. 759-15', 'NY', '4595632236'),
(5, 'LongBeach YankeeCandle', 'Hill st. 445-01', 'CA', '8569996356'),
(6, 'Natick Mall YankeeCandle', 'Natick st. 121-1', 'MA', '5623356365'),
(7, 'Miami YankeeCandle', '8888 SW 136th St', 'FL', '7856936521'),
(8, 'Willowbrook Mall YankeeCandle', '1725 Willowbrook Blvd', 'NJ', '4563322635'),
(9, 'Newport Centre YankeeCandle', '30 Mall Dr W, Jersey City', 'NJ', '8566933145'),
(10, 'Washington Square YankeeCandle', '9473 SW Washington Square Rd', 'OR', '4451448511');

INSERT INTO Product (ProductID, ProductName, UnitPrice, Category) VALUES
(1, 'Biblitheque', '30', 'candle'),
(2, 'sweet love', '30', 'candle'),
(3, 'long beach', '30', 'diffuser'),
(4, 'smile', '30', 'candle'),
(5, 'late night', '30', 'diffuser'),
(6, 'love 35', '30', 'candle'),
(7, 'hope', '30', 'candle'),
(8, 'dream', '45', 'candle'),
(9, 'cotton', '40', 'candle'),
(10, 'red shirts', '30', 'candle');

INSERT INTO Customer (CustomerID, FirstName, LastName, CustomerAddress, CustomerState, CustomerPhoneNumber, EmailAddress) VALUES
(1, 'JoonHyuk', 'Kong', 'babson college mailbox 1132', 'MA', '8574881929', 'jkong2@babson.edu'),
(2, 'Wonbok', 'Lee', 'babson college mailbox 1354', 'MA', '4523366984', 'wlee2@babson.edu'),
(3, 'Sangwon', 'Park', 'babson college mailbox 2336', 'MA', 'NULL', 'spark12@babson.edu'),
(4, 'James', 'Lebron', 'Havitom st. 4456-01', 'NY', '9574613246', 'jamesl123@gmail.com'),
(5, 'John', 'Kim', 'hannova st. 635-88', 'CA', 'NULL', 'johnkim343@gmail.com'),
(6, 'Michael', 'Jordan', 'Stanford University Malkom Mailroom Unit 665', 'MA', '6874987651', 'mjordan9@gmail.com'),
(7, 'Beenzino', 'Lim', 'Hamilton st. 5465-7', 'FL', '8654484653', 'beenzinogun889@gmail.com'),
(8, 'Judy', 'Hei', 'New apartment 23-301', 'NJ', '4631651163', 'beetlesjudy@gmail.com'),
(9, 'Sarah', 'Novia', 'Calimind suite 55', 'NJ', '6548744698', 'sarah7785love@gmail.com'),
(10, 'Lisa', 'Smith', 'Mosasa st. 996-7', 'OR', '9652136214', 'lisalisalisamylisa@gmail.com');

INSERT INTO OrderDetail (OrderDetailID, ProductID, OrderID, Quantity) VALUES
(1, '1', '1', '3'),
(2, '2', '2', '2'),
(3, '3', '3', '1'),
(4, '4', '4', '2'),
(5, '5', '5', '3'),
(6, '6', '6', '4'),
(7, '7', '7', '1'),
(8, '8', '8', '1'),
(9, '9', '9', '1'),
(10, '10', '10', '3');

INSERT INTO OrderHead (OrderID, CustomerID, StoreID, DeliveryMethod, DeliveryStartDay, DeliveryEndDay, PaymentMethod) VALUES
(1, '1', '1', 'UPS', '03/14/2018', '03/15/2018', 'credit'),
(2, '2', '2', 'UPS', '03/01/2018', '03/03/2018', 'credit'),
(3, '3', '3', 'UPS', '03/02/2018', '03/05/2018', 'paypal'),
(4, '4', '4', 'UPS', '02/28/2018', '03/01/2018', 'credit'),
(5, '5', '5', 'UPS', '03/05/2018', '03/07/2018', 'paypal'),
(6, '6', '6', 'UPS', '01/14/2018', '01/16/2018', 'credit'),
(7, '7', '7', 'UPS', '02/14/2018', '02/18/2018', 'credit'),
(8, '8', '8', 'UPS', '03/01/2018', '03/03/2018', 'paypal'),
(9, '9', '9', 'UPS', '03/13/2018', '03/15/2018', 'credit'),
(10, '10', '10', 'UPS', '03/01/2018', '03/02/2018', 'credit');

GO