CREATE TABLE retail_transactions (
    InvoiceNo VARCHAR2(50),
    StockCode VARCHAR2(50),
    Description VARCHAR2(1000),
    Quantity NUMBER,
    InvoiceDate VARCHAR2(50),
    UnitPrice NUMBER(10, 2),
    CustomerID VARCHAR2(50),
    Country VARCHAR2(100)
);