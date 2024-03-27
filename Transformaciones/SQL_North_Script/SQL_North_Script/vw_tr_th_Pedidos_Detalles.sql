--CREATE OR ALTER VIEW vw_tr_th_Pedidos_Detalles

--AS 

SELECT 
        ISNULL(P.IdPedido,-99) AS CodPedido,
		ISNULL (CAST(P.IdCliente AS nvarchar(10)),'-99') AS CodCliente,
		ISNULL(CAST(P.IdEmpleado AS nvarchar(10)),'-99') AS CodEmpleado,
		ISNULL(CAST(P.IdDespachador AS nvarchar(10)),'-99') AS CodDespachador,
		ISNULL(PD.IdProducto,-99) AS CodProducto,
		ISNULL(P.FPedido,'1990-12-31 00:00:00.000') AS CodTiempo,
		CHECKSUM(
		ISNULL(LTRIM(UPPER(P.EntregaPais)),'_Sin Pais'),
		ISNULL(LTRIM(UPPER(P.EntregaRegion)),'_Sin Region'),
		ISNULL(LTRIM(UPPER(P.EntregaCiudad)),'_Sin Ciudad')) AS CodGeografia,
		---METRICAS
		---NATURALES
		ISNULL(PD.Cantidad,0) AS Cantidad,
		ISNULL(PD.PrecioUnd,0) AS PrecioUnd,
		ISNULL(PD.Descuento,0) AS Descuento,
		
		---ARTIFICIALES
		---VALOR BRUTO
		ISNULL(PD.Cantidad,0) *
		ISNULL(PD.PrecioUnd,0) AS ValorBruto,
		---VALOR DESCUENTO
		ISNULL(PD.Cantidad,0) *
		ISNULL(PD.PrecioUnd,0) *
		ISNULL(PD.Descuento,0) AS DescuentoAplicado,
		---PRECIO TOTAL CON DESCUENTO
		
		(ISNULL(PD.Cantidad,0) *
		ISNULL(PD.PrecioUnd,0) *
		(1-ISNULL(PD.Descuento,0))) AS ValorTotalDescuento,


		PD.BI_Control_extraccion AS Fecha_Extraccion,
		GETDATE() AS Fecha_Transformacion


FROM   stg_Pedidos P
       LEFT JOIN stg_Pedidos_detalle PD
	   ON P.IdPedido = PD.IdPedido


     
       