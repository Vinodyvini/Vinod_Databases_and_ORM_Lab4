-- 4.Display all the orders along with product name 
-- ordered by a customer having Customer_Id=2

SELECT o.ORD_ID, p.PRO_NAME
FROM orders o
JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
JOIN product p ON sp.PRO_ID = p.PRO_ID
WHERE o.CUS_ID = 2;