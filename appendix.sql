/*
___APPENDIX___
02-Oct-2020
*/

/*___CONSTRUCT_TABLES.SQL___*/

-- First we create the User table

CREATE TABLE User
(
	Ssn VARCHAR(12) NOT NULL PRIMARY KEY,
	Name VARCHAR(128),
	Street_name VARCHAR(128),
	Street_number INT,
	Postal_code INT,
	State VARCHAR(128),
	Phone_number INT,
	Newsletter BOOLEAN,
	Email VARCHAR(128),
	Password VARCHAR(128)
);

-- We then create the Product table
-- --> the FK in Review table needs a table to reference to.

CREATE TABLE Product
(
	Product_id VARCHAR(128) NOT NULL PRIMARY KEY
);

-- Then we create the Review table

CREATE TABLE Review
(
	Review_id VARCHAR(128) NOT NULL PRIMARY KEY,
	No_stars INT CHECK (No_stars > -1 AND No_stars < 6),
	Comment VARCHAR(1024),
	Product_id VARCHAR(128),
	Ssn VARCHAR(12) ,
	FOREIGN KEY(Product_ID) REFERENCES Product(Product_id),
	FOREIGN KEY(Ssn) REFERENCES User(Ssn)
);

-- Next, we create the Department table
-- (we need its PK to use it as FK in the Product table)
CREATE TABLE Department
(
	Department_id  VARCHAR(128) NOT NULL PRIMARY KEY
);

-- Then we update the Product table.
ALTER TABLE Product
ADD COLUMN
(
	Title VARCHAR(128),
	Description VARCHAR(516),
	Stock INT CHECK (Stock > -1),
	Price_no_tax FLOAT,
	Price_tax FLOAT,
	On_sale_percentage FLOAT,
	Department_id VARCHAR(128),
	FOREIGN KEY(Department_id)Product REFERENCES Department(Department_id)
);

-- We update the Department table

ALTER TABLE Department
ADD COLUMN
(
	Title VARCHAR(128),
	Description VARCHAR(128),
	Is_leaf BOOLEAN,
	URL VARCHAR(128),
	Parent_id VARCHAR(128) REFERENCES Department(Department_id)
);

-- Next step: construct the Order table.

CREATE TABLE Order_from_user
(
	Order_id VARCHAR(128) NOT NULL PRIMARY KEY,
	Payment_ref VARCHAR(128),
	Change_date DATETIME,
	Status INT,
	Tracking_no VARCHAR(128),
	Order_date DATETIME,
	Ssn VARCHAR(128),
	FOREIGN KEY(Ssn) REFERENCES User(Ssn)
);

-- Create intermediary table between orders and products.

CREATE TABLE Order_includes_product
(
	Order_id VARCHAR(128) REFERENCES Order_from_user(Order_id),
	Product_id VARCHAR(128) REFERENCES Product(Product_id),
	Quantity INT,
	Product_price FLOAT
);

-- Create the tag table

CREATE TABLE Product_has_tag
(
	Tag VARCHAR(128) PRIMARY KEY,
	Product_id VARCHAR(128),
	FOREIGN KEY(Product_id)  REFERENCES Product(Product_id)
);


/*
CREATE TABLE `Product_has_tag` (
`Tag` varchar(128) NOT NULL,
`Product_id` varchar(128) NOT NULL,
PRIMARY KEY (`Tag`,`Product_id`),
KEY `Product_has_tag_ibfk_1` (`Product_id`),
CONSTRAINT `Product_has_tag_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`Product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/


/* Added a table for product features. Didn't remember how we thought about solving that.
Now it just has the key to the products that are featured. //Melker
*/
CREATE TABLE Product_featured
(
	Product_id VARCHAR(128) PRIMARY KEY,
	FOREIGN KEY(Product_id) REFERENCES Product(Product_id)
);


/*___ADD_PRODUCT_FEATURED.SQL___*/




INSERT INTO Product_featured VALUES(0000000001);
-- INSERT INTO Product_featured VALUES(0000000002);
INSERT INTO Product_featured VALUES(0000000003);
-- INSERT INTO Product_featured VALUES(0000000004);
INSERT INTO Product_featured VALUES(0000000005);
-- INSERT INTO Product_featured VALUES(0000000006);
INSERT INTO Product_featured VALUES(0000000007);
INSERT INTO Product_featured VALUES(0000000008);
-- INSERT INTO Product_featured VALUES(0000000009);
-- INSERT INTO Product_featured VALUES(0000000010);


/*___ADD_DEPARTMENTS.SQL___*/


/* add sql for adding depts here*/

INSERT INTO Department
VALUES (0, "HomePage",
	"Hello and welcome to my Ted-talk.", FALSE, "altonline.com", NULL);


/*___ADD_ORDER.SQL___*/


INSERT INTO Order_from_user
VALUES
(
	0000000001,
	"SMH4RAOvVu5z5JmbSI8IAJ6pyDh2cf208rHWWZKPPz3OnaJt5JsegT8wsRpKMn6x",
	"2009-08-05 15:13:00",
	0,
	"0I3RmuXnYk0TFJxCWDZz8x7Be75e1zXNhwNgbmaNqDnzHifPUwxjN2aZMsccI4IE",
	"2009-08-05 15:13:00",
	199001011234 -- Pernilla
);

-- White and gold dress
INSERT INTO Order_includes_product
VALUES
(
	0000000001, -- Order
	0000000009, -- product
	1,          -- Quantity
	499.9       -- price with tax
);
-- 2x Purple hat
INSERT INTO Order_includes_product
VALUES
(
	0000000001, -- Order
	0000000008, -- product
	2,          -- Quantity
	6490.0      -- price with tax
);


/*
CREATE TABLE Order_from_user
(
Order_id VARCHAR(128) NOT NULL PRIMARY KEY,
Payment_ref VARCHAR(128),
Change_date DATETIME,
Status INT,
Tracking_no VARCHAR(128),
Order_date DATETIME,
Ssn VARCHAR(128),
FOREIGN KEY(Ssn) REFERENCES User(Ssn)
);

Status
0  - new
1  - open
2  - dispatched

-- Create intermediary table between orders and products.
CREATE TABLE Order_includes_product
(
Order_id VARCHAR(128) REFERENCES Order_from_user(Order_id),
Product_id VARCHAR(128) REFERENCES Product(Product_id),
Quantity INT,
Product_price FLOAT
);

random 64strings
u7aMiWGUriC9Mrgd84sQUSVGEtubMbft5XQcYE603KmKczeXEjtrbeuQHdIc2zCb
Li14v5KWFXmWv9PHb23K6AN2hdA3PSCrb1tS36zrc1JS6ZKRZ43IWYEupRyZEoRF
x8VyecTZuNEQGRcXNsIOW3E76t2qV7Ub5yeSrGpKwFxVZzlJ32oPNWtPb5K8FNGD
dnCtkXyZDrrJKqU3mQHKMn2jsHeEc4xbN1rbqV0uPj9oumkPhZaLh90YXYhvwubv
7L2XjBQ6ImXldt3APjt18QlWkAfc0jz7MBiBz12nrZkWaBV33KdtfghneWKvFVjF
Lq99VbAdqmGJBRKHvONa4CiZCqQXWB5S1QYd2iAabl3qNOKYIMLdfzwLBvHYu5FQ
ZtDxQmWKQiut87te2VtNIECNaGcn6jeTv5bE2ZqYqCcAH1hxkkXHFHxEXCQ8Nnou
Xoh29EFAEHwLIPIkM7cMM4rS4uHcfCxfXrY1TojZ0iRekn1mZ4F8YX4zFJI2WFPw
*/


/*___ADD_PRODUCT_HAS_TAG.SQL___*/

/*
CREATE TABLE Product_has_tag (
Product_id VARCHAR(128) PRIMARY KEY REFERENCES Product(Product_id),
Tag VARCHAR(128) PRIMARY KEY
);
*/

/* common tag nr1 */
INSERT INTO Product_has_tag
VALUES("Electronics", 0000000001); /* Apple TV */

INSERT INTO Product_has_tag
VALUES("Electronics", 0000000002); /* Samsung TV GQ85Q80TGTXZG */

INSERT INTO Product_has_tag
VALUES("Electronics", 0000000003); /* LG SIGNATURE Z9 88 */

INSERT INTO Product_has_tag
VALUES("Electronics", 0000000004); /* Apple Airpods Pro */

INSERT INTO Product_has_tag
VALUES("Electronics", 0000000005); /* Jabra Elite 75t */

/* common tag nr2*/
INSERT INTO Product_has_tag
VALUES("Headwear", 0000000004); /* Apple Airpods Pro */

INSERT INTO Product_has_tag
VALUES("Headwear", 0000000005); /* Jabra Elite 75t */

INSERT INTO Product_has_tag
VALUES("Headwear", 0000000008); /* Purple hat */

/* uncommon tag nr1 */
INSERT INTO Product_has_tag
VALUES("TV", 0000000001); /* Apple TV */

INSERT INTO Product_has_tag
VALUES("TV", 0000000002); /* Samsung TV GQ85Q80TGTXZG */

INSERT INTO Product_has_tag
VALUES("TV", 0000000003); /* LG SIGNATURE Z9 88 */


-- SELECT * FROM Product_has_tag;


/*___ADD_PRODUCTS.SQL___*/

/*
CREATE TABLE Product (
Product_id VARCHAR(128) NOT NULL PRIMARY KEY,
Title VARCHAR(128),
Description VARCHAR(516),
Stock INT CHECK (Stock > -1),
Price_no_tax FLOAT,
Price_tax FLOAT,
On_sale_percentage FLOAT,
Department_id VARCHAR(128) FOREIGN KEY REFERENCES Department(Department_id)
);
*/

INSERT INTO Product
VALUES(
  0000000001,
  "Apple TV",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  1000,
  5999.90,
  7499.90,
  0.0,
  3
);

INSERT INTO Product
VALUES(
  0000000002,
  "Samsung TV GQ85Q80TGTXZG",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  20.123,
  41666.67,
  49999.90,
  0.1,
  3
);

INSERT INTO Product
VALUES(
  0000000003,
  "LG SIGNATURE Z9 88",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  2,
  249999.17,
  299999.90,
  0.10,
  3
);

INSERT INTO Product
VALUES(
  0000000004,
  "Apple Airpods Pro",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  500,
  1807.90,
  2259.90,
  0.0,
  5
);

INSERT INTO Product
VALUES(
  0000000005,
  "Jabra Elite 75t",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  200,
  1592.90,
  1990.90,
  0.15,
  5
);

INSERT INTO Product
VALUES(
  0000000006,
  "White T-shirt",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  1000,
  159.90,
  199.90,
  0.20,
  7
);

INSERT INTO Product
VALUES(
  0000000007,
  "Speedo green",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  999,
  249.90,
  299.90,
  0.0,
  8
);

INSERT INTO Product
VALUES(
  0000000008,
  "Purple hat",
  "Exorcizamus te, omnis immundus spiritus omnis atanica potestas, omnis incursio infernalis adversarii, omnis legio, omnis congregatio et ecta diabolica.",
  1,
  2596.0,
  3245.00,
  0.0,
  10
);

INSERT INTO Product
VALUES(
  0000000009,
  "White and gold dress",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  999,
  399.20,
  499.90,
  0.0,
  9
);

INSERT INTO Product
VALUES(
  0000000010,
  "Black and blue dress",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  999,
  399.20,
  499.90,
  0.0,
  9
);

SELECT * FROM  Product;


/*___ADD_REVIEW.SQL___*/

/* review 2 is same person as review 3 */

/* 
CREATE TABLE Review
(
	Review_id VARCHAR(128) NOT NULL PRIMARY KEY,
	No_stars INT CHECK (No_stars > -1 AND No_stars < 6),
	Comment VARCHAR(1024),
	Product_id VARCHAR(128),
	Ssn VARCHAR(12) ,
	FOREIGN KEY(Product_ID) REFERENCES Product(Product_id),
	FOREIGN KEY(Ssn) REFERENCES User(Ssn)
);
*/


INSERT INTO Review
VALUES(0000000001, 5, "Lorem Ipsum Great Product Pls Buy",
	0000000007, 199202024567
);
INSERT INTO Review
VALUES(0000000002, 1, "Lorem Ipsum Bad Product Donâÿÿt Buy",
	0000000007, 199001011234
);
INSERT INTO Review
VALUES(0000000003, 3, "Lorem Ipsum Product Buy Maybe",
	0000000007, 199001011234
);

INSERT INTO Review
VALUES(0000000004, 1, "Lorem Ipsum Bad Product Donâÿÿt Buy",
	0000000004, 199001011234
);
INSERT INTO Review
VALUES(0000000005, 3, "Lorem Ipsum Product Buy Maybe",
	0000000004, 199202024567
);
INSERT INTO Review
VALUES(0000000006, 4, "Lorem Ipsum Good Product Probably Buy",
	0000000005, 199001011234
);
INSERT INTO Review
VALUES(0000000007, 5, "Lorem Ipsum Great Product Pls Buy",
	0000000005, 199202024567
);

SELECT * FROM Review;

/*___ADD_USER.SQL___*/

INSERT INTO User
VALUES(
	199001011234, "Pernilla Wahlgren", "Vasagatan",
	10, 11120, "Stockholm", 0701234567, TRUE,
	"pernillawahlgren@gmail.com", "fn39dhkf/42"
);

INSERT INTO User
VALUES(
	199202024567, "Ola Salo", "Sysslomansgatan",
	5,75311, "Uppsala", 0709876543, FALSE,
	"olasalo@yahoo.com", "ajf3lfn#j7w"
);


/*___QUERIE_DEPARTMENT_VIEWS.SQL___*/

SELECT Department.Title AS Department, Product.Title, ROUND(Product.Price_no_tax
* (1 - Product.On_sale_percentage),1)
AS Retail_price, Product.Product_id, AVG(No_stars) AS Average_stars
FROM Product
    JOIN Department ON Department.Department_id = Product.Department_id
    LEFT JOIN Review ON Review.Product_id = Product.Product_id
GROUP BY Product.Product_id;


/*___QUERIE_HOMEPAGE_WELCOME.SQL___*/


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


/*___QUERIE_ON_SALE.SQL___*/

/* List of all products on sale sorted by the discount percentage (starting with the biggest discount) */
SELECT * FROM Product
WHERE Product.On_sale_percentage > 0
ORDER BY On_sale_percentage DESC;


/*___QUERIE_RELATED_PRODUCTS.SQL___*/

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


/*___QUERIE_USER_ORDERS.SQL___*/


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


