-- 9.Create a stored procedure to display supplier id, name, Rating (Average rating of all the products 
-- sold by every customer) and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,
-- If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. 
-- Note that there should be one rating per supplier.


DELIMITER //
CREATE PROCEDURE SupplierRating()
BEGIN
    SELECT s.SUPP_ID, s.SUPP_NAME, 
           AVG(r.RAT_RATSTARS) AS Rating,
           CASE
               WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
               WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
               WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
               ELSE 'Poor Service'
           END AS Type_of_Service
    FROM supplier s
    JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
    JOIN orders o ON sp.PRICING_ID = o.PRICING_ID
    JOIN rating r ON o.ORD_ID = r.ORD_ID
    GROUP BY s.SUPP_ID, s.SUPP_NAME;
END //
DELIMITER ;


CALL SupplierRating();