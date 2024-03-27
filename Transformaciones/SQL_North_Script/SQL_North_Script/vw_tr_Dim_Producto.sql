--USE STG_NORTE;
--SELECT * FROM dbo.stg_Categoria
--GO;

---VISTA TRANSFORMACION PRODUCTO
CREATE OR ALTER VIEW dbo.vw_tr_Dim_Producto

AS

SELECT DISTINCT
       ISNULL(P.IdProducto, -99) AS CodProducto,
       ISNULL(LTRIM(UPPER(P.Nombre)), '_Sin Nombre') AS NombreProducto,   
	   
	   ISNULL(P.IdCategoria,-99) AS CodCategoria,
       ISNULL(LTRIM(UPPER(C.Nombre)),'_Sin Nombre') AS NombreCategoria,

	   ---Funcion para transformar datos de 0 y 1 para activo e inactivo
	   CASE 
	        WHEN P.Descontinuado = 0 THEN UPPER('Activo')
			WHEN P.Descontinuado = 1 THEN UPPER('Inactivo')
			ELSE UPPER('Inconsistente')
			END AS Descontinuado,


		---Estampa de tiempo(muestra todos los datos del tiempo)
		P.BI_Control_extraccion AS Fecha_Extraccion,
		GETDATE() AS Fecha_Transformacion
	  



FROM  dbo.stg_productos P 

LEFT JOIN dbo.stg_Categoria C

ON P.IdCategoria=C.IdCategoria

---dbo.stg_Categoria


