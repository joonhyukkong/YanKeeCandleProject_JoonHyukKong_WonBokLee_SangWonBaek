USE YanKeeCandleDb;
GO

/* 1. Multiple  SELECT *  queries to display all the records from each table. (Suppose the database has 4 tables, you should create 4 queries for this requirement.)*/
SELECT *
FROM Store;

SELECT *
FROM Product;

SELECT *
FROM Customer;

SELECT *
FROM OrderDetail;

SELECT *
FROM OrderHead;

/*2. A query that uses aggregate function.*/
SELECT
(Store.StoreName) AS 'Store', (Store.StoreState) AS 'State'
FROM Store
WHERE StoreState = 'MA';

/* 3.A query that selects records from two (or multiple) tables using  INNER JOIN .*/
SELECT
(OrderDetail.OrderID) AS 'OrderID', 
(Product.ProductName) AS 'Name', 
(OrderDetail.Quantity) AS 'Order Quantity'
FROM Product JOIN OrderDetail
ON Product.ProductID = OrderDetail.ProductID
ORDER BY OrderDetail.Quantity DESC;

/* 4. A query that selects records from two (or multiple) tables using  LEFT OUTER JOIN  (or  RIGHT OUTER JOIN  or  FULL OUTER JOIN ).
Specify why outer join is neccesary in comment block. Make sure your fake data could reflect the necessary.
If it could not, you need to go back to part 2 to redo the data insertion, or you can use  INSERT INTO ,  UPDATE  or  DELETE  statements to modify the existing data.*/

SELECT
CT.FirstName,
CT.LastName,
CT.CustomerPhoneNumber,
OH.OrderID,
OH.DeliveryStartDay,
OH.DeliveryEndDay
FROM Customer AS CT
RIGHT OUTER JOIN OrderHead AS OH
ON CT.CustomerID = OH.CustomerID;

/*Doing a left outer join in this case is needed in order to find out an order error that has been placed without the customer information, which may happen in the service error.
Doing an inner join will show only orders that have correct customer information listed. By performing RIGHT OUTER JOIN in this commend, we can easily detect that OrderID is the one with error.*/ 

/* 5. A query that uses subquery.*/
/*The Customer who ordered higher than the average amount of the product.*/
SELECT
Customer.FirstName,
Customer.LastName,
OrderDetail.Quantity
FROM
Customer 
INNER JOIN OrderHead ON Customer.CustomerID = OrderHead.CustomerID
INNER JOIN OrderDetail ON OrderHead.OrderID = OrderDetail.OrderID
WHERE OrderDetail.Quantity >
(SELECT AVG(OrderDetail.Quantity)
FROM OrderDetail)
ORDER BY OrderDetail.Quantity DESC;