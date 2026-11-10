CREATE TABLE customer_rfm_summary AS
WITH max_date AS (
----Get the overall dataset reference date (last recorded transaction date + 1 day) 
SELECT MAX(TransDate) + 1 AS ref_date
FROM cleaned_retail_transactions
)
SELECT 
c.CustomerID, 
---Recency: Days between reference date and customer's last purchase date 
TRUNC(m.ref_date - MAX(c.TransDate)) AS Recency,
---Frequency: Distinct No of Invoices 
COUNT(DISTINCT c.InvoiceNo) AS Frequency, 
---Monetary: Total sales spent by the customer 
ROUND(SUM(c.TotalSales), 2) AS MonetaryValue, 
---Customer Lifespan: Days between first and last purchase 
TRUNC(MAX(c.TransDate) - MIN(c.TransDate)) AS CustomerTenureDays,
---First and Last purchase dates
MIN(c.TransDate) AS FirstPurchaseDate, 
MAX(c.TransDate) AS LastPurchaseDate

FROM cleaned_retail_transactions c
CROSS JOIN max_date m
GROUP BY c.CustomerID, m.ref_date; 
