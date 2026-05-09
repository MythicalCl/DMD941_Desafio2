# Desafío Práctico 2 - DMD941

## Base utilizada
AdventureWorksDW2019 restaurada desde archivo .bak en SQL Server.

## Avance Carlos Contreras
- Restauración de la base de datos.
- Exploración inicial de tablas dimensionales y tablas de hechos.
- Identificación de FactInternetSales como tabla de hechos.
- Identificación de dimensiones: DimDate, DimProduct, DimCustomer, DimGeography y DimSalesTerritory.
- Creación de la vista vw_FactInternetSales para integrar ventas, productos, clientes, fechas y territorio.

## Herramientas
- SQL Server
- SQL Server Management Studio
- GitHub

## Avance Kevin Alvarado
- Configuración de entorno local y conexión a la base de datos para pruebas.
- Desarrollo de consulta SQL para calcular el crecimiento de ventas mensual comparado con el año anterior (YoY) usando funciones de ventana.
- Desarrollo de consulta SQL para identificar las categorías de productos que representan más del 80% de los ingresos (Regla de Pareto).
- Desarrollo de consulta SQL para identificar el Top 5 de sucursales con menor rendimiento según su ubicación geográfica.
- Carga del script `consultas_analisis.sql` y capturas de evidencia de los resultados al repositorio.
