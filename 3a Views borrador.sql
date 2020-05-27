use farma_dmart_ped;
SET lc_time_names = 'es_ES';
SET sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS H_PEDIDO (
    
    DProd_id			INT			NOT NULL,
    DTiem_id			INT			NOT NULL,
    
    Ventas				DECIMAL(9,2) 	NULL,
    Can_unidades		DECIMAL(9,2)	NULL,
    
    Can_clientes		INT	NULL,
    FOREIGN KEY (DProd_id) REFERENCES DPRODUCTO (DProd_id) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (DTiem_id) REFERENCES DTIEMPO (DTiem_id) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY ( DProd_id, DTiem_id)
);

insert into H_PEDIDO (
	
    DProd_id,
    DTiem_id,
   
    
    Can_unidades,
    Ventas,
    
    Can_clientes
)

SELECT 
DP.DProd_id,
DT.DTiem_id,
sum(G.Cantidad) as CANT_UNID,
sum(G.Ventas) as VENTAS,
COUNT(DISTINCT G.Cli_id) AS Cant_clientes
	FROM (SELECT 
			date_format(pe.Fecha_confirm, '%Y-%m-%d') AS Fecha,
			pe.Cli_id,
            p.Cod_prod, p.Nom_prod, c.Nom_cat, f.Nom_fam,
			ped.Cantidad,
			ped.Cantidad*(ped.Prec_venta_un - ped.Total_desc_un ) as Ventas

		 FROM farmadb.PEDIDO as pe
			inner join farmadb.PEDIDO_DET as ped on pe.Ped_id= ped.Ped_id
			inner join farmadb.PRODUCTO as p on ped.Prod_id= p.Prod_id 
			inner join farmadb.CATEGORIA as c on p.Cat_id= c.Cat_id 
			inner join farmadb.FAMILIA as f on c.Fam_id= f.Fam_id  ) as G
            
	inner join DPRODUCTO AS DP ON G.Cod_prod = DP.Cod_prod
    inner join DTIEMPO AS DT ON G.Fecha = DT.Fecha
    GROUP BY DProd_id, DT.DTiem_id
