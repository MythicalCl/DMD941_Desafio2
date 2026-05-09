-- (KPI) Pareto, categoria que genera el 80% de ventas
WITH VentasCategoria AS (
    SELECT
        Categoria,
        SUM(SalesAmount) AS TotalVentas
    FROM dbo.vw_FactInternetSales
    WHERE Categoria IS NOT NULL
    GROUP BY Categoria
),
Pareto AS (
    SELECT
        Categoria,
        TotalVentas,
        SUM(TotalVentas) OVER (ORDER BY TotalVentas DESC) AS VentasAcumuladas,
        SUM(TotalVentas) OVER () AS VentasTotales
    FROM VentasCategoria
),
ParetoFinal AS (
    SELECT
        Categoria,
        TotalVentas,
        VentasAcumuladas,
        VentasTotales,
        (VentasAcumuladas / VentasTotales) * 100 AS PorcentajeAcumulado,
        LAG((VentasAcumuladas / VentasTotales) * 100, 1, 0) 
            OVER (ORDER BY TotalVentas DESC) AS PorcentajeAnterior
    FROM Pareto
)
SELECT
    Categoria,
    TotalVentas,
    VentasAcumuladas,
    PorcentajeAcumulado
FROM ParetoFinal
WHERE PorcentajeAcumulado <= 80
   OR PorcentajeAnterior < 80
ORDER BY TotalVentas DESC;