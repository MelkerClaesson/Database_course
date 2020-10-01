/*
SELECT * FROM Product;
SELECT * FROM Product_has_tag;
SELECT * FROM Product WHERE title = "Jabra Elite 75t";
*/

-- select tags from product
CREATE VIEW myProduct AS
SELECT * FROM Product WHERE Product.title = "Apple Airpods Pro"; --  "Jabra Elite 75t", "Apple Airpods Pro"
SELECT * FROM myProduct;



-- find all tags of the product
CREATE VIEW myTags AS
	SELECT myProduct.Product_id, Product_has_tag.Tag
	FROM myProduct JOIN Product_has_tag
	ON myProduct.Product_id = Product_has_tag.Product_id;
-- SELECT * FROM myTags;

-- find all products with one of those tags
CREATE VIEW relatedProduct_1 AS
	SELECT myTags.Tag, Product_has_tag.Product_id
	FROM myTags JOIN Product_has_tag
	ON myTags.Tag = Product_has_tag.Tag;
-- SELECT * FROM relatedProduct_1;

-- remove duplicates and readd title of products
CREATE VIEW relatedProduct_2 AS
	SELECT DISTINCT Product.Title, relatedProduct_1.Product_id
	FROM Product JOIN relatedProduct_1
	ON Product.Product_id = relatedProduct_1.Product_id;

-- remove original product from related
SELECT * FROM relatedProduct_2
WHERE Product_id NOT IN (
	SELECT Product_id FROM myProduct
);

DROP VIEW myProduct;
DROP VIEW myTags;
DROP VIEW relatedProduct_1;
DROP VIEW relatedProduct_2;
