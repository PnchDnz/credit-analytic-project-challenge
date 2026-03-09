/* Ingreso estimado por mes de cohorte par aun año en especifico */

SELECT
    TO_CHAR(origination_date, 'Month') AS MES,
    SUM(amount * (interest_rate/100) * (term_months/12)) AS INTERESES_ESTIMADOS
FROM dim_credit
WHERE TO_CHAR(origination_date, 'YYYY') = '2022'
GROUP BY TO_CHAR(origination_date, 'Month')
ORDER BY 1
;

/* Ingreso estimado por mes de cohorte y año */

SELECT
    TO_CHAR(origination_date, 'YYYY') as ANIO,
    TO_CHAR(origination_date, 'Month') AS MES,
    SUM(amount * (interest_rate/100) * (term_months/12), TO_CHAR(origination_date, 'YYYY')) AS INTERESES_ESTIMADOS
FROM dim_credit
GROUP BY TO_CHAR(origination_date, 'Month')
ORDER BY 1
;