use farma_dmart_ped;
SET lc_time_names = 'es_ES';
SET sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


SELECT  -- E
	-- T
	p.Cod_prod, CONCAT(p.Nom_prod, ' ', p.Concent, ' ', p.Presentac, ' frac', p.Fracciones ) as Nom_prodxx, 
    p.Prec_compra, p.Prec_venta,
	c.Nom_cat,
	f.Nom_fam
FROM farmadb.PRODUCTO as p  
	inner join farmadb.CATEGORIA as c on p.Cat_id= c.Cat_id 
    inner join farmadb.FAMILIA as f on c.Fam_id= f.Fam_id;
    