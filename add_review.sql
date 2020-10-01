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
VALUES(0000000002, 1, "Lorem Ipsum Bad Product Don’t Buy",
	0000000007, 199001011234
);
INSERT INTO Review
VALUES(0000000003, 3, "Lorem Ipsum Product Buy Maybe",
	0000000007, 199001011234
);

INSERT INTO Review
VALUES(0000000004, 1, "Lorem Ipsum Bad Product Don’t Buy",
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