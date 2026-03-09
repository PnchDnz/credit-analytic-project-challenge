# credit-analytic-project-challenge

## Descripción del proyecto

Proyecto que tiene como objetivo diseñar un modelo analítico de datos que permita analizar los créditos otorgados a PYMES. Se diseña un **modelo dimensinal tipo Data Warehous**e para analizar el desempeño de los creditos otorgados, mediante **consultas SQL y un pipe line conceptual**, aplicando principios de modelados de datos, una arquitectura analitica y calidad de datos.

---

Las 2 fuentes de datos utilizadas son las siguientes:

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


## Tabla: Pagos

| Campo        | Descripción                             |
| ------------ | --------------------------------------- |
| payment_id   | Identificador del pago                  |
| credit_id    | Identificador de crédito asociado       |
| payment_date | Fecha del pago                          |
| amount_paid  | Monto pagado                            |
| days_late    | Días de atraso                          |

---

# Objetivos

Construir un pequeño modelo analítico que permita responder:

* ¿Cuál es el monto total colocado por mes?
* ¿Cuál es la tasa de mora (créditos con días_late > 30)?
* ¿Cuál es el ingreso estimado por intereses por cohorte de originación?
* ¿Cuál es el % de default por mes de originación?


## Modelado de Datos

Se propone un **modelo dimensional tipo estrella**.


## Tabla de hechos principal

### fact_paymenst

| Columna         | Descripción                 |
| --------------- | --------------------------- |
| payment_id      | identificador del pago      |
| credit_id       | identificador del crédito   |
| customer_id     | identificador del cliente   |
| payment_type_id | identificadore tipo de pago |
| payment_date    | fecha del pago              |
| amount_paid     | monto pagado                |
| days_late       | días de atraso              |

---

## Dimensiones

Se poponen las siguiente dimensiones

### dim_credit

| columna          | Descripción                |
| ---------------- | -------------------------- |
| credit_id        | Identificador del crédito  |
| product_id       | identificador del producto |
| origination_date | fecha de originación       |
| amount           | monto del crédito          |
| term_months      | plazo                      |
| interest_rate    | tasa                       |
| status_id        | estado del crédito         |

---

### dim_credit_status

| Campo           | Descripción                                |
| --------------- | ------------------------------------------ |
| status_id       | identificador del estado                   |
| status          | estatus (active, late, default, closed)    |
| status_desc     | descripcion del estatus                    |

---

### dim_customer

| Columna           | Descripción                    |
| ----------------- | ------------------------------ |
| customer_id       | identificador del cliente      |
| customer_name     | nombre del cliente             |
| customer_type     | tipo de cliente (segmentacion) |

---

### dim_payment_type

| Columna         | Descripción                |
| --------------- | -------------------------- |
| payment_type_id | identificador tipo de pago |
| payment_type    | tipo de pago               |
| channel         | canal de pago              |

---

### dim_product

| Columna         | Descripción                     |
| --------------- | ------------------------------- |
| product_id      | identificador del producto      |
| product_name    | nombre del producto             |
| product_type    | tipo de crédito                 |
| max_term_months | plazo máximo                    |


## ¿Por qué modelo estrella?

Se eligió modelo estrella porque:

* Simplifica consultas analíticas
* Reduce joins complejos
* Mejores tiempos de consulta en BI
* Es el estándar en Data Warehouses analíticos

---

## SQL

### Monto total colocado por mes 

```sql
SELECT DISTINCT
    TO_CHAR(origination_date, 'Month') AS mes,
    SUM(amount) OVER (PARTITION BY TO_CHAR(origination_date, 'Month')) AS total_colocado
FROM dim_credit
ORDER BY 1
;