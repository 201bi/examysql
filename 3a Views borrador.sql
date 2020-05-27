use farma_dmart_ped;


SELECT  
	p.Cod_prod, CONCAT(p.Nom_prod, ' ', p.Concent, ' ', p.Presentac, ' frac', p.Fracciones ) as Nom_prod, 
    p.Prec_compra, p.Prec_venta,
	c.Nom_cat,
	f.Nom_fam
FROM farmadb.PRODUCTO as p  
	inner join farmadb.CATEGORIA as c on p.Cat_id= c.Cat_id 
    inner join farmadb.FAMILIA as f on c.Fam_id= f.Fam_id;
