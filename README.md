# credit-analytic-project-challenge

## Descripción del proyecto

Proyecto que tiene como objetivo diseñar un modelo analítico de datos que permita analizar los créditos otorgados a PYMES, esto incluyte: modelado dimensional de datos, consultas SQL y un pipe line conceptual.


Dasdas las 2 siguientes fuentes de datos:

## Tabla: Créditos

| Campo            | Descripción                                        |
| ---------------- | -------------------------------------------------- |
| credit_id        | Identificador del crédito                          |
| customer_id      | Identificador del cliente                          |
| origination_date | Fecha de originación del crédito                   |
| amount           | Monto otorgado                                     |
| term_months      | Plazo del crédito                                  |
| interest_rate    | Tasa de interés                                    |
| status           | Estado del crédito (active, late, default, closed) |


## Pagos

| Campo        | Descripción                             |
| ------------ | --------------------------------------- |
| payment_id   | Identificador del pago                  |
| credit_id    | identificador de crédito asociado       |
| payment_date | Fecha del pago                          |
| amount_paid  | Monto pagado                            |
| days_late    | Días de atraso                          |

---

# Objetivos

Construir un pequeño modelo analítico que permita responder:

• ¿Cuál es el monto total colocado por mes?
• ¿Cuál es la tasa de mora (créditos con días_late > 30)?
• ¿Cuál es el ingreso estimado por intereses por cohorte de originación?
• ¿Cuál es el % de default por mes de originación?

