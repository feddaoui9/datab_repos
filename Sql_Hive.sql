-- Databricks notebook source
CREATE TABLE EEmployeees(name STRING, salary FLOAT, subordinates ARRAY<STRING>, deductions MAP<STRING,FLOAT>, adress STRUCT<street:STRING,city:STRING,state:STRING,zip:INT>)
PARTITIONED BY(country STRING, state STRING);

-- COMMAND ----------

INSERT INTO TABLE EEmployeees
PARTITION (country='France', state='Paris')
VALUES ('John Doe', 5000.00, ARRAY('Mary Smith', 'Bob Johnson'), MAP('health', 101.00, 'taxes', 500.00), STRUCT('123 Main St', 'Paris', 'Ile-de-France', 75001));

-- COMMAND ----------

INSERT INTO TABLE EEmployeees
PARTITION (country='France', state='Paris')
VALUES ('Anes FED', 5000.00, ARRAY('Mary Werghech', 'Bob Marlet'), MAP('health', 101.00, 'taxes', 409.00), STRUCT('Werghech', 'Paris', 'Ile-de-France', 75001));

-- COMMAND ----------

SELECT * FROM EEmployeees

-- COMMAND ----------

SELECT * FROM EEmployeees WHERE deductions.health > 100

-- COMMAND ----------

SELECT * FROM EEmployeees WHERE adress.street like "W%"

-- COMMAND ----------


