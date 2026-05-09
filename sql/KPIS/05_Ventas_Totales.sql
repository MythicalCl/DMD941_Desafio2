-- (KPI) Cantidad de productos vendidos
SELECT 
    SUM(OrderQuantity) AS TotalProductosVendidos
FROM dbo.vw_FactInternetSales;