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
