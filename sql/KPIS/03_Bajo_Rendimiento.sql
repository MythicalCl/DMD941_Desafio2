-- (KPI) Ubicaciones con menor rendimiento
SELECT TOP 5
    Pais,
    StateProvinceName,
    City,
    SalesTerritoryRegion,
    COUNT(DISTINCT SalesOrderNumber) AS TotalOrdenes,
    SUM(OrderQuantity) AS CantidadVendida,
    SUM(SalesAmount) AS TotalVentas
FROM dbo.vw_FactInternetSales
GROUP BY 
    Pais,
    StateProvinceName,
    City,
    SalesTerritoryRegion
ORDER BY TotalVentas ASC;