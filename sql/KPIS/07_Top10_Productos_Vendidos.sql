-- Top 10 de productos
SELECT TOP 10
    Producto,
    SUM(OrderQuantity) AS CantidadVendida,
    SUM(SalesAmount) AS TotalVentas
FROM dbo.vw_FactInternetSales
GROUP BY Producto
ORDER BY TotalVentas DESC;