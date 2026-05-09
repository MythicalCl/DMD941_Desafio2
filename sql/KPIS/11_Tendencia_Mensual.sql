-- Comportamiento mensual de ventas
SELECT 
    YEAR(Fecha) AS Anio,
    MONTH(Fecha) AS Mes,
    SUM(SalesAmount) AS TotalVentas
FROM dbo.vw_FactInternetSales
GROUP BY 
    YEAR(Fecha),
    MONTH(Fecha)
ORDER BY 
    Anio,
    Mes;