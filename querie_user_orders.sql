
-- SELECT * FROM Order_from_user; -- aka Order
-- SELECT * FROM Order_includes_product;

CREATE VIEW my_Orders AS
SELECT * FROM Order_from_user
WHERE Ssn=199001011234; -- <-- Determines which user


SELECT my_Orders.Order_id,
my_Orders.Status,
Product.Title,
Order_includes_product.Product_id,
Order_includes_product.Quantity,
Order_includes_product.Product_price,
my_Orders.Order_date,
my_Orders.Change_date,
my_Orders.Tracking_no,
my_Orders.Payment_ref
FROM my_Orders
JOIN Order_includes_product ON my_Orders.Order_id = Order_includes_product.Order_id
JOIN Product ON Order_includes_product.Product_id = Product.Product_id;
