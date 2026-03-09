/* Monto total colocado por mes */
SELECT DISTINCT
    TO_CHAR(origination_date, 'Month') AS mes,
    SUM(amount) OVER (PARTITION BY TO_CHAR(origination_date, 'Month')) AS total_colocado
FROM dim_credit
ORDER BY 1
;

/* Monto total colocado por mes y año */
SELECT DISTINCT
    TO_CHAR(origination_date, 'YYYY') AS anio,
    TO_CHAR(origination_date, 'Month') AS mes,
    SUM(amount) OVER (PARTITION BY TO_CHAR(origination_date, 'Month'),TO_CHAR(origination_date, 'YYYY')) AS total_colocado
FROM dim_credit
ORDER BY 1
;

/* Monto total colocado por mes para un año en especifico */
SELECT DISTINCT
    TO_CHAR(origination_date, 'Month') AS mes,
    SUM(amount) OVER (PARTITION BY TO_CHAR(origination_date, 'Month')) AS total_colocado
FROM dim_credit
WHERE TO_CHAR(origination_date, 'YYYY') = '2024'
ORDER BY 1
;