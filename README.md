# Apache-DA-Airflow 1.0
 
 
## Desarrollador del proyecto
 
- [Jhonatan Echavarria Henao](https://github.com/jechavarria1395)
 
# Objetivo
 
- Implementación de un flujo de ejecución en la que se ejecute un proceso ETL, utiliozando el conjunto de datos Sales.csv, la idea principal es que este conjunto de datos pase por todos los procesos necasarios para el despliegue y  visualización de los datos
 
 
# Herramientas del proyecto 
- Python 
- Apache Airflow 
- Postgresql 
- Aws S3 
- Quicksight
 
 
# Descripción del proyecto  
 
### Carpetas 
las carpetas estan en el orden en la que se debe ejecutar el proyecto paso a paso
 
- **Sales_Data** : carpeta que almacena la fuente de datos sales.csv, esta es un fuente de datos  secundaria, ya que se descargaron de la pagina Kaggle.
 
- **Request_send_Data** : Esta carpeta contiene los archivos.py que ejecutan el requerimiento de los datos y el envio hacia la base de datos en postgresql
 
- **Sql_Data** : Esta carpeta contiene los archivos.sql que ejecutan las consultas a la base de datos Postgresql, estas consultas van a interactuar con los Dags en Airflow  
 
- **Airflow_process_Data** : Esta carpeta contiene los archivos .py de los Dags que se generaron en Airflow, en este proceso se realizó ETL para la extracción de datos, transfomación de datos y carga de datos en la nube aws(bucket S3)
 
 
- **Aws_services** : Esta carpeta contiene los servicios utilizados en la nube AWS para el almacenamiento de los datos (bucket S3) y Quicksight para la conexión de la base de datos y la visualización.
 
 
## Contexto
 
El proyecto consiste en realizar el despliegue de una base de datos US Store-sales, con el fin de evidenciar cual es el proceso por el cual pasan los datos para disponibilizar la información, ya sea en tiempo real o de manera remota, para que cuaquier persona pueda verla, en este proceso tambien se utiliza Airflow como herramienta de flujo de datos y asi poder automatizar el proceso de ETL en el schedule que se necesite.
 
 
## Requerimientos
 
 
Realizar la automatización  ETL  para la disponibilzar la información en la nube AWS, ademas de realizar el analisis explotaratorio de datos para verificar las variables que seran seleccionadas en el modelo de machine learning. 
