-- 3.Display the total number of customers based on gender 
-- who have placed individual orders of worth at least Rs.3000

SELECT CUS_GENDER, COUNT(CUS_ID) AS Total_Customers
FROM (
    SELECT CUS_ID, CUS_GENDER
    FROM customer
    WHERE CUS_ID IN (
        SELECT DISTINCT CUS_ID
        FROM orders
        WHERE ORD_AMOUNT >= 3000
    )
) AS CustomerOrders
GROUP BY CUS_GENDER; 