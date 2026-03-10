### Pipeline de Datos (Conceptual) ###

"""
--- ¿Cómo moverías estos datos desde un sistema OLTP hacia un Data Warehouse en la nube?

- Los datos provenientes del sistema OLTP se extraerian y se cargarian hacia la nube. 
- Inicialmente, los datos se moverían hacia Google Cloud Storage. 
- Posteriormente, estos datos serían transformados y cargados hacia BigQuery, 
que funcionaría como el Data Warehouse donde se construiría el modelo dimensional para el análisis.

¿Qué herramienta usarías?

Para la orquestación del pipeline se utilizaría Cloud Composer (basado en Apache Airflow), 
que permitiría programar y coordinar el todo el proceso ETL (extraccion, transformación y carga de datos).

El flujo general sería:

-- Extracción de datos desde el sistema OLTP.
-- Carga de datos crudos en Cloud Storage.
-- Procesamiento y transformación mediante consultas SQL, proceso Python o Dataflow.
-- Carga de datos transformados al modelo dimensional en BigQuery.
"""