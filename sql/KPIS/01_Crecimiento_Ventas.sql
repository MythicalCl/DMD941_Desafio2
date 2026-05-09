-- (KPI) Crecimiento mensual vs año anterior
WITH VentasMensuales AS (
    SELECT
        YEAR(Fecha) AS Anio,
        MONTH(Fecha) AS Mes,
        SUM(SalesAmount) AS VentasMes
    FROM dbo.vw_FactInternetSales
    GROUP BY YEAR(Fecha), MONTH(Fecha)
),
VentasConYoY AS (
    SELECT
        Anio,
        Mes,
        VentasMes,
        LAG(VentasMes, 12) OVER (ORDER BY Anio, Mes) AS VentasMismoMesAnioAnterior
    FROM VentasMensuales
)
SELECT
    Anio,
    Mes,
    VentasMes,
    VentasMismoMesAnioAnterior,
    VentasMes - VentasMismoMesAnioAnterior AS DiferenciaYoY,
    CASE 
        WHEN VentasMismoMesAnioAnterior IS NULL OR VentasMismoMesAnioAnterior = 0 THEN NULL
        ELSE ((VentasMes - VentasMismoMesAnioAnterior) / VentasMismoMesAnioAnterior) * 100
    END AS PorcentajeCrecimientoYoY
FROM VentasConYoY
ORDER BY Anio, Mes;