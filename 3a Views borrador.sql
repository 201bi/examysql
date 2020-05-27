use farma_dmart_ped;
SET lc_time_names = 'es_ES';
SET sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Dia, Mes, Trimestre, Año
insert into DTIEMPO (
	Fecha,
    Dia_semana_desc,
    Mes_cod	,
    Mes_desc,
    Trim_cod,
    Trim_desc,
	Anio
)
SELECT 
	date_format(pe.Fecha_confirm, '%Y-%m-%d')  as Fecha
    ,DAYNAME(pe.Fecha_confirm ) AS DIA_SEMANA
	,MONTH(pe.Fecha_confirm ) AS COD_MES
	,MONTHNAME(pe.Fecha_confirm ) AS DES_MES
	,QUARTER( pe.Fecha_confirm ) AS COD_TRIMESTRE
	,CONCAT('Trimestre ', QUARTER(pe.Fecha_confirm )) AS DES_TRIMESTRE
	,YEAR(pe.Fecha_confirm ) AS COD_ANIO
FROM farmadb.PEDIDO as pe WHERE pe.Fecha_confirm IS NOT NULL
       GROUP BY date_format(pe.Fecha_confirm, '%Y-%m-%d')
       ORDER BY date_format(pe.Fecha_confirm, '%Y-%m-%d');

