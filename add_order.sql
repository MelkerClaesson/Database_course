
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
