use farma_dmart_ped;
CREATE TABLE IF NOT EXISTS DPRODUCTO (
	DProd_id		INT				AUTO_INCREMENT,
	Cod_prod		VARCHAR(100)	NULL,
    Nom_prod		VARCHAR(100)	NULL,
    Prec_compra		DECIMAL(9,2)	NULL,
    Prec_venta		DECIMAL(9,2)	NULL,
	Nom_cat			VARCHAR(100)	NULL,
    Nom_fam 		VARCHAR(100)	NULL,
    PRIMARY KEY (DProd_id)
);
CREATE TABLE IF NOT EXISTS DTIEMPO (
	DTiem_id		INT			AUTO_INCREMENT,
	Fecha			DATE	NULL,
    Dia_semana_desc	VARCHAR(12)	NULL,
    Mes_cod		    VARCHAR(2)	NULL,
    Mes_desc		VARCHAR(12)	NULL,
    Trim_cod		VARCHAR(1)	NULL,
    Trim_desc		VARCHAR(20)	NULL,
	Anio			VARCHAR(4)	NULL,
    PRIMARY KEY (DTiem_id)
);
CREATE TABLE IF NOT EXISTS DCLIENTE (
	DCli_id		INT				AUTO_INCREMENT,
	Nom_cli		VARCHAR(100)	NOT NULL,
	PRIMARY KEY (DCli_id)               
);
CREATE TABLE IF NOT EXISTS DVENDEDOR (
	DVend_id		INT				AUTO_INCREMENT,
	Nom_vend	VARCHAR(100)	NOT NULL,
	PRIMARY KEY (DVend_id)               
);

CREATE TABLE IF NOT EXISTS H_PEDIDO (
    DTiem_id			INT			NOT NULL,
    DProd_id			INT			NOT NULL,
    DCli_id			    INT			NOT NULL,
    DVend_id		    INT			NOT NULL,
    Ventas				DECIMAL(9,2) 	NULL,
    Can_unidades		DECIMAL(9,2)	NULL,
    Costos				DECIMAL(9,2)	NULL,
    Descuentos			DECIMAL(9,2)	NULL,
    Can_min_confirmacion		DECIMAL(9,2)	NULL,
    Can_min_despacho			DECIMAL(9,2)	NULL,
    Can_horas_entrega			DECIMAL(9,2)	NULL,
    Can_clientes		INT	NULL,
    FOREIGN KEY (DTiem_id) REFERENCES DTIEMPO (DTiem_id) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (DProd_id) REFERENCES DPRODUCTO (DProd_id) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (DCli_id) REFERENCES DCLIENTE (DCli_id) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (DVend_id) REFERENCES DVENDEDOR (DVend_id) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (DTiem_id, DProd_id, DCli_id, DVend_id)
);


/*
SELECT  -- date_format(pe.Fecha_crea, '%Y-%m-%d') as dia,
    TIMESTAMPDIFF(MINUTE,pe.Fecha_crea, pe.Fecha_confirm) AS min_confirmacion
    -- ,TIMEDIFF(pe.Fecha_confirm, pe.Fecha_crea) as g
    -- ,time_to_sec( TIMEDIFF(pe.Fecha_confirm, pe.Fecha_crea) )/3600 as g2
    ,TIMESTAMPDIFF(MINUTE,pe.Fecha_confirm, pe.Fecha_envio) AS min_despacho
    -- ,TIMESTAMPDIFF(HOUR,pe.Fecha_envio, pe.Fecha_entrega) AS horas_entrega
    ,ROUND( time_to_sec( TIMEDIFF(pe.Fecha_entrega, pe.Fecha_envio) ) /3600, 2) as horas_entrega2
FROM farmadb.pedido as pe
;

SET FOREIGN_KEY_CHECKS = 0;
delete FROM farma_dmart_ped.dproducto;
SET FOREIGN_KEY_CHECKS = 1;

-- Esto muestra las unidades vendidas, VENTAS, ... por producto
SELECT 
DP.DProd_id, DP.Cod_prod,
sum(G.Ventas) as VENTAS,
sum(G.Cantidad) as CANT_UNID,
sum(G.Costos) as COSTOS,
sum(G.Descuentos) as DESCTOS,
sum(G.min_confirmacion) as CANT_MIN_CONFIRM,
sum(G.min_despacho) as CANT_MIN_DESPACH,
sum(G.horas_entrega2) as CANT_HORAS_ENTREGA
FROM
(SELECT  
    TIMESTAMPDIFF(MINUTE,pe.Fecha_crea, pe.Fecha_confirm) AS min_confirmacion
    ,TIMESTAMPDIFF(MINUTE,pe.Fecha_confirm, pe.Fecha_envio) AS min_despacho
    ,ROUND( time_to_sec( TIMEDIFF(pe.Fecha_entrega, pe.Fecha_envio) ) /3600, 2) as horas_entrega2
    ,ped.Prod_id
    ,p.Cod_prod
    ,p.Nom_prod
    ,c.Nom_cat
	,f.Nom_fam
    ,ped.Cantidad
    ,ped.Cantidad*ped.Prec_compra_un as Costos
    ,ped.Cantidad*(ped.Prec_venta_un - ped.Total_desc_un ) as Ventas
    ,ped.Cantidad*(ped.Total_desc_un ) as Descuentos
FROM farmadb.pedido as pe
	inner join farmadb.pedido_det as ped on pe.Ped_id= ped.Ped_id 
    inner join farmadb.producto as p on ped.Prod_id= p.Prod_id 
    inner join farmadb.categoria as c on p.Cat_id= c.Cat_id 
    inner join farmadb.familia as f on c.Fam_id= f.Fam_id )  AS G
    
    inner join DPRODUCTO AS DP ON G.Cod_prod = DP.Cod_prod
	GROUP BY DP.DProd_id
;

-- Ahora con la dimension Tiempo
SELECT 
DP.DProd_id, DP.Cod_prod,
sum(G.Ventas) as VENTAS,
sum(G.Cantidad) as CANT_UNID,
sum(G.Costos) as COSTOS,
sum(G.Descuentos) as DESCTOS,
sum(G.min_confirmacion) as CANT_MIN_CONFIRM,
sum(G.min_despacho) as CANT_MIN_DESPACH,
sum(G.horas_entrega2) as CANT_HORAS_ENTREGA,
DTiem_id
FROM
	(SELECT  
		date_format(pe.Fecha_crea, '%Y-%m-%d') AS Fecha
		,TIMESTAMPDIFF(MINUTE,pe.Fecha_crea, pe.Fecha_confirm) AS min_confirmacion
		,TIMESTAMPDIFF(MINUTE,pe.Fecha_confirm, pe.Fecha_envio) AS min_despacho
		,ROUND( time_to_sec( TIMEDIFF(pe.Fecha_entrega, pe.Fecha_envio) ) /3600, 2) as horas_entrega2
		,ped.Prod_id
		,p.Cod_prod
		,p.Nom_prod
		,c.Nom_cat
		,f.Nom_fam
		,ped.Cantidad
		,ped.Cantidad*ped.Prec_compra_un as Costos
		,ped.Cantidad*(ped.Prec_venta_un - ped.Total_desc_un ) as Ventas
		,ped.Cantidad*(ped.Total_desc_un ) as Descuentos
	FROM farmadb.pedido as pe
		inner join farmadb.pedido_det as ped on pe.Ped_id= ped.Ped_id 
		inner join farmadb.producto as p on ped.Prod_id= p.Prod_id 
		inner join farmadb.categoria as c on p.Cat_id= c.Cat_id 
		inner join farmadb.familia as f on c.Fam_id= f.Fam_id )  AS G
    
    inner join DPRODUCTO AS DP ON G.Cod_prod = DP.Cod_prod
    inner join DTIEMPO AS DT ON G.Fecha = DT.Fecha
	GROUP BY DP.DProd_id, DTiem_id
;


-- Ahora con Cliente
SELECT 
DP.DProd_id, DP.Cod_prod,
sum(G.Ventas) as VENTAS,
sum(G.Cantidad) as CANT_UNID,
sum(G.Costos) as COSTOS,
sum(G.Descuentos) as DESCTOS,
sum(G.min_confirmacion) as CANT_MIN_CONFIRM,
sum(G.min_despacho) as CANT_MIN_DESPACH,
sum(G.horas_entrega2) as CANT_HORAS_ENTREGA,
DT.DTiem_id,
DCLI.DCli_id
FROM (
	SELECT  
		date_format(pe.Fecha_crea, '%Y-%m-%d') AS Fecha
		,TIMESTAMPDIFF(MINUTE,pe.Fecha_crea, pe.Fecha_confirm) AS min_confirmacion
		,TIMESTAMPDIFF(MINUTE,pe.Fecha_confirm, pe.Fecha_envio) AS min_despacho
		,ROUND( time_to_sec( TIMEDIFF(pe.Fecha_entrega, pe.Fecha_envio) ) /3600, 2) as horas_entrega2
		,ped.Prod_id
		,p.Cod_prod
		,p.Nom_prod
		,c.Nom_cat
		,f.Nom_fam
		,ped.Cantidad
		,ped.Cantidad*ped.Prec_compra_un as Costos
		,ped.Cantidad*(ped.Prec_venta_un - ped.Total_desc_un ) as Ventas
		,ped.Cantidad*(ped.Total_desc_un ) as Descuentos
        ,cli.Nom_cli
	FROM farmadb.pedido as pe
		inner join farmadb.pedido_det as ped on pe.Ped_id= ped.Ped_id 
		inner join farmadb.producto as p on ped.Prod_id= p.Prod_id 
		inner join farmadb.categoria as c on p.Cat_id= c.Cat_id 
		inner join farmadb.familia as f on c.Fam_id= f.Fam_id 
        inner join farmadb.cliente as cli on pe.Cli_id= cli.Cli_id 
	)  AS G
    
    inner join DPRODUCTO AS DP ON G.Cod_prod = DP.Cod_prod
    inner join DTIEMPO AS DT ON G.Fecha = DT.Fecha
    inner join DCLIENTE AS DCLI ON G.Nom_cli = DCLI.Nom_cli
	GROUP BY DP.DProd_id, DT.DTiem_id, DCLI.DCli_id
;



-- all, es decir con vendedor
SELECT 
DP.DProd_id, DP.Cod_prod,
sum(G.Ventas) as VENTAS,
sum(G.Cantidad) as CANT_UNID,
sum(G.Costos) as COSTOS,
sum(G.Descuentos) as DESCTOS,
sum(G.min_confirmacion) as CANT_MIN_CONFIRM,
sum(G.min_despacho) as CANT_MIN_DESPACH,
sum(G.horas_entrega2) as CANT_HORAS_ENTREGA,
DT.DTiem_id,
DCLI.DCli_id,
DVEND.DVend_id
FROM (
	SELECT  
		date_format(pe.Fecha_crea, '%Y-%m-%d') AS Fecha
		,TIMESTAMPDIFF(MINUTE,pe.Fecha_crea, pe.Fecha_confirm) AS min_confirmacion
		,TIMESTAMPDIFF(MINUTE,pe.Fecha_confirm, pe.Fecha_envio) AS min_despacho
		,ROUND( time_to_sec( TIMEDIFF(pe.Fecha_entrega, pe.Fecha_envio) ) /3600, 2) as horas_entrega2
		,ped.Prod_id
		,p.Cod_prod
		,p.Nom_prod
		,c.Nom_cat
		,f.Nom_fam
		,ped.Cantidad
		,ped.Cantidad*ped.Prec_compra_un as Costos
		,ped.Cantidad*(ped.Prec_venta_un - ped.Total_desc_un ) as Ventas
		,ped.Cantidad*(ped.Total_desc_un ) as Descuentos
        ,cli.Nom_cli
        ,v.Nom_vend
	FROM farmadb.pedido as pe
		inner join farmadb.pedido_det as ped on pe.Ped_id= ped.Ped_id 
		inner join farmadb.producto as p on ped.Prod_id= p.Prod_id 
		inner join farmadb.categoria as c on p.Cat_id= c.Cat_id 
		inner join farmadb.familia as f on c.Fam_id= f.Fam_id 
        inner join farmadb.cliente as cli on pe.Cli_id= cli.Cli_id 
        inner join farmadb.vendedor as v on pe.Vend_id= v.Vend_id 
	)  AS G
    
    inner join DPRODUCTO AS DP ON G.Cod_prod = DP.Cod_prod
    inner join DTIEMPO AS DT ON G.Fecha = DT.Fecha
    inner join DCLIENTE AS DCLI ON G.Nom_cli = DCLI.Nom_cli
    inner join DVENDEDOR AS DVEND ON G.Nom_vend = DVEND.Nom_vend
	GROUP BY DP.DProd_id, DT.DTiem_id, DCLI.DCli_id, DVEND.DVend_id
;
*/

