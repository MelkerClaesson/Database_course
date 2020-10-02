
-- get homepage welcome text.
-- (Welcome text for the homepage)
SELECT Description FROM Department
WHERE Title LIKE "Home%";

-- create view of top level departments with titles and URLs
-- (List of the top level departments with fields needed for the homepage)
SELECT Department.Title, Department.URL FROM Department
WHERE Parent_id IS NULL
AND NOT Title LIKE "Home%";


-- create view of homepage features
-- (List of the featured products with fields needed for the homepage)
CREATE VIEW Featured_Products AS
SELECT Product.Title AS Product, Product.Description AS Description
FROM Product
WHERE  Product_id IN (
	SELECT Product_id FROM Product_featured
);
SELECT * FROM Featured_Products;
-- DROP VIEW Featured_Products;
