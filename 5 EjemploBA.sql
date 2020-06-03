SELECT 
 DP.Nom_fam,
 sum(Ventas) AS TOAL_VENTAS
 FROM H_PEDIDO AS HP
 inner join DPRODUCTO AS DP ON HP.DProd_id = DP.DProd_id
group by DP.Nom_fam
 ;
 

SELECT 
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.H_PEDIDO as HP;

SELECT 
		DP.Nom_fam,
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.H_PEDIDO as HP
		inner join DPRODUCTO AS DP ON HP.DProd_id = DP.DProd_id
	GROUP BY DP.Nom_fam;
    
SELECT 
		DP.Nom_cat,
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.H_PEDIDO as HP
		inner join DPRODUCTO AS DP ON HP.DProd_id = DP.DProd_id
	GROUP BY DP.Nom_cat;

SELECT 
		DP.Nom_prod,
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.H_PEDIDO as HP
		inner join DPRODUCTO AS DP ON HP.DProd_id = DP.DProd_id
	GROUP BY DP.Nom_prod;

SELECT 
		DT.Mes_desc,
		sum(Ventas) as Ventas
	FROM farma_dmart_ped.H_PEDIDO as HP
		inner join DTIEMPO AS DT ON HP.DTiem_id = DT.DTiem_id
	GROUP BY DT.Mes_desc;
    
SELECT 
		DT.Mes_desc,
		sum(Can_unidades) as can_PROD
	FROM farma_dmart_ped.H_PEDIDO as HP
		inner join DTIEMPO AS DT ON HP.DTiem_id = DT.DTiem_id
	GROUP BY DT.Mes_desc;
    