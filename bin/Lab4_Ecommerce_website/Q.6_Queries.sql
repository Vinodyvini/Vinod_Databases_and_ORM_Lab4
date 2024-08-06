-- 6.Find the least expensive product from each category and print the table with category id, name, product name, and price of the product
    
    SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, 
    sp.SUPP_PRICE AS Least_Expensive_Price FROM category c
JOIN 
    product p ON c.CAT_ID = p.CAT_ID
JOIN 
    supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
JOIN 
    (
        SELECT 
            p.CAT_ID, 
            MIN(sp.SUPP_PRICE) AS Least_Expensive_Price
        FROM 
            product p
        JOIN 
            supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
        GROUP BY 
            p.CAT_ID
    ) AS min_price ON p.CAT_ID = min_price.CAT_ID 
                  AND sp.SUPP_PRICE = min_price.Least_Expensive_Price
ORDER BY 
    c.CAT_ID;