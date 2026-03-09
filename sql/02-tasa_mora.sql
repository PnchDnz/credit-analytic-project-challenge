/* Tasa de mora (creditos con días_late > 30) */

SELECT
    COUNT(DISTINCT CASE WHEN days_late > 30 THEN credit_id END) /
    COUNT(DISTINCT credit_id) * 100 AS "TASA_MORA_>30"
FROM fact_payments
;