-- Top de ventas por región
SELECT 
    SalesTerritoryRegion,
    SUM(SalesAmount) AS TotalVentas
FROM dbo.vw_FactInternetSales
GROUP BY SalesTerritoryRegion
ORDER BY TotalVentas DESC;