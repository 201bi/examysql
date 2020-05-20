SELECT 
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.h_pedido as HP;

SELECT 
		DP.Nom_fam,
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.h_pedido as HP
		inner join DPRODUCTO AS DP ON HP.DProd_id = DP.DProd_id
	GROUP BY DP.Nom_fam;
    
SELECT 
		DP.Nom_cat,
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.h_pedido as HP
		inner join DPRODUCTO AS DP ON HP.DProd_id = DP.DProd_id
	GROUP BY DP.Nom_cat;

SELECT 
		DP.Nom_prod,
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.h_pedido as HP
		inner join DPRODUCTO AS DP ON HP.DProd_id = DP.DProd_id
	GROUP BY DP.Nom_prod;

SELECT 
		DT.Mes_desc,
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.h_pedido as HP
		inner join DTIEMPO AS DT ON HP.DTiem_id = DT.DTiem_id
	GROUP BY DT.Mes_desc;