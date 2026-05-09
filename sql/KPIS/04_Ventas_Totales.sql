-- (KPI) Ventas totales. Total General vendido
SELECT 
    SUM(SalesAmount) AS VentasTotales
FROM dbo.vw_FactInternetSales;