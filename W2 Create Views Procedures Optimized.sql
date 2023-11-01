
#-----------order view1
CREATE VIEW OrdersView AS
SELECT orders.OrderID, orders.Quantity, orders.TotalCost
FROM littlelemondb.orders
WHERE orders.Quantity > 2;

SELECT *
FROM littlelemondb.ordersview;


#-----------order view2
CREATE VIEW OrdersView2 AS
SELECT customer.CustomerID, customer.FullName, orders.OrderID, orders.TotalCost
FROM customer INNER JOIN orders
WHERE orders.TotalCost > 150
ORDER BY orders.TotalCost DESC;

select *
from littlelemondb.ordersview2;


#------------create get max quantity procedure
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(orders.Quantity)
FROM orders;




#-----------create getorder 
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

#-------------create cancel order
CREATE PROCEDURE CancelOrder(IN OrderID INT)
DELETE FROM orders;