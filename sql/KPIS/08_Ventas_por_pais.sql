-- Top de ventas por país
SELECT 
    Pais,
    SUM(SalesAmount) AS TotalVentas
FROM dbo.vw_FactInternetSales
GROUP BY Pais
ORDER BY TotalVentas DESC;