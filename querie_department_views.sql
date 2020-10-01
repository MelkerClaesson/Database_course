SELECT Department.Title AS Department, Product.Title, ROUND(Product.Price_no_tax
* (1 - Product.On_sale_percentage),1)
AS Retail_price, Product.Product_id, AVG(No_stars) AS Average_stars
FROM Product
    JOIN Department ON Department.Department_id = Product.Department_id
    LEFT JOIN Review ON Review.Product_id = Product.Product_id
GROUP BY Product.Product_id;
