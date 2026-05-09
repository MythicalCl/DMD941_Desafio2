-- Ventas por año
SELECT 
    YEAR(Fecha) AS Anio,
    SUM(SalesAmount) AS TotalVentas
FROM dbo.vw_FactInternetSales
GROUP BY YEAR(Fecha)
ORDER BY Anio;