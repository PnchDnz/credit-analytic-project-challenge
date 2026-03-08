/* Dimension de clientes */

CREATE TABLE dim_customer (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    customer_type VARCHAR2(50)
);


/* Dimension de productos */

CREATE TABLE dim_product (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    product_type VARCHAR2(50),
    max_term_months NUMBER
);


/* Dimension de estado del credito */

CREATE TABLE dim_credit_status (
    status_id NUMBER PRIMARY KEY,
    status VARCHAR2(50),
    status_desc VARCHAR2(255)
);


/* Dimension de tipo de pago */

CREATE TABLE dim_payment_type (
    payment_type_id NUMBER PRIMARY KEY,
    payment_type VARCHAR2(50),
    channel VARCHAR2(50)
);


/* Dimension de creditos */

CREATE TABLE dim_credit (
    credit_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    origination_date DATE,
    amount NUMBER(12,2),
    term_months NUMBER,
    interest_rate NUMBER(5,2),
    status_id NUMBER,

    /* relacion con productos */
    CONSTRAINT fk_credit_product
        FOREIGN KEY (product_id)
        REFERENCES dim_product(product_id),

    /* relacion con estado de credito */
    CONSTRAINT fk_credit_status
        FOREIGN KEY (status_id)
        REFERENCES dim_credit_status(status_id)
);


/* Tabla de hechos principal */

CREATE TABLE fact_payments (
    payment_id NUMBER PRIMARY KEY,
    credit_id NUMBER,
    customer_id NUMBER,
    payment_type_id NUMBER,
    payment_date DATE,
    amount_paid NUMBER(12,2),
    days_late NUMBER,

    /* relacion con creditos */
    CONSTRAINT fk_fact_credit
        FOREIGN KEY (credit_id)
        REFERENCES dim_credit(credit_id),

    /* relacion con clientes */
    CONSTRAINT fk_fact_customer
        FOREIGN KEY (customer_id)
        REFERENCES dim_customer(customer_id),

    /* relacion con tipo de pago */
    CONSTRAINT fk_fact_payment_type
        FOREIGN KEY (payment_type_id)
        REFERENCES dim_payment_type(payment_type_id)
);


/* indices */

CREATE INDEX idx_fact_credit
ON fact_payments(credit_id);

CREATE INDEX idx_fact_customer
ON fact_payments(customer_id);

CREATE INDEX idx_fact_payment_type
ON fact_payments(payment_type_id);