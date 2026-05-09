-- Número de ordenes vendidas
SELECT 
    COUNT(DISTINCT SalesOrderNumber) AS TotalOrdenes
FROM dbo.vw_FactInternetSales;