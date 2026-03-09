/* Total del credito pagado */

SELECT
    c.credit_id,
    c.amount AS monto_credito,
    SUM(p.amount_paid) AS total_pagado,
    ROUND((SUM(p.amount_paid) / c.amount) * 100, 2) AS porcentaje_credito_pagado
FROM fact_payments p
JOIN dim_credit c
  ON p.credit_id = c.credit_id
GROUP BY c.credit_id, c.amount
;


/* Total pagado para creditos cerrados*/

SELECT
    c.credit_id,
    p.customer_id,
    c.amount,
    SUM(p.amount_paid) AS total_paid
FROM fact_payments p
JOIN dim_credit c
  ON p.credit_id = c.credit_id
WHERE status_id = 4 --'closed'
GROUP BY c.credit_id, c.amount, p.customer_id
;