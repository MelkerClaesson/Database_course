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
