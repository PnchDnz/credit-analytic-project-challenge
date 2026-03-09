
/* Porcentaje default, por mes de originacion */

SELECT DISTINCT
    TO_CHAR(origination_date, 'Month') AS mes,
    SUM(interest_rate) OVER (PARTITION BY TO_CHAR(origination_date, 'Month')) AS total_colocado
FROM dim_credit
ORDER BY 1
;

/* Porcentaje default, por mes de originacion y año */

SELECT 
    TO_CHAR(origination_date, 'YYYY') AS anio,
    TO_CHAR(origination_date, 'Month') AS mes,
    SUM(interest_rate) OVER (PARTITION BY TO_CHAR(origination_date, 'Month'), TO_CHAR(origination_date, 'YYYY')) AS total_colocado
FROM dim_credit
ORDER BY 1
;