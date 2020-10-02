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
