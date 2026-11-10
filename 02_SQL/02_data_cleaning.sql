CREATE TABLE cleaned_retail_transactions AS
SELECT 
InvoiceNo, 
StockCode,
Description, 
Quantity,
TO_DATE(InvoiceDate, 'MM/DD/YYYY HH24:MI') AS TransDate, 
UnitPrice,
(Quantity * UnitPrice) AS TotalSales,
CustomerID,
Country
FROM retail_transactions
WHERE InvoiceNo NOT LIKE 'C%'
AND Quantity > 0 
AND UnitPrice > 0
AND CustomerID IS NOT NULL;

