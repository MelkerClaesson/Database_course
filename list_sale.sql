
/* List of all products on sale sorted by the discount percentage (starting with the biggest discount) */
SELECT * FROM Product
WHERE Product.On_sale_percentage > 0;