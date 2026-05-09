WITH VentasPorCategoria AS (
    SELECT 
        pc.EnglishProductCategoryName AS Categoria,
        SUM(f.SalesAmount) AS TotalVentas
    FROM FactInternetSales f
    JOIN DimProduct p ON f.ProductKey = p.ProductKey
    JOIN DimProductSubcategory psc ON p.ProductSubcategoryKey = psc.ProductSubcategoryKey
    JOIN DimProductCategory pc ON psc.ProductCategoryKey = pc.ProductCategoryKey
    GROUP BY pc.EnglishProductCategoryName
),
VentasAcumuladas AS (
    SELECT 
        Categoria,
        TotalVentas,
        SUM(TotalVentas) OVER (ORDER BY TotalVentas DESC) AS VentasAcumuladas,
        SUM(TotalVentas) OVER () AS VentasTotales
    FROM VentasPorCategoria
)
SELECT 
    Categoria,
    TotalVentas,
    (TotalVentas / VentasTotales) * 100 AS PorcentajeDelTotal,
    (VentasAcumuladas / VentasTotales) * 100 AS PorcentajeAcumulado
FROM VentasAcumuladas
ORDER BY TotalVentas DESC;