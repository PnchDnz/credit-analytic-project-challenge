/* Monto total colocado por mes */
SELECT DISTINCT
    TO_CHAR(origination_date, 'Month') AS mes,
    SUM(amount) OVER (PARTITION BY TO_CHAR(origination_date, 'Month')) AS total_colocado
FROM dim_credit
ORDER BY 1
;