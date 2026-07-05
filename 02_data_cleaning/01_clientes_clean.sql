-- Creo una tabla limpia solo con las columnas que voy a usar para el análisis
CREATE OR REPLACE TABLE `coherent-vision-500222-m3.bank_churners_rfm.clientes_clean` AS
SELECT
  CLIENTNUM AS customer_id,
  Attrition_Flag AS estado_cliente,
  Customer_Age AS edad,
  Gender AS genero,
  Dependent_count AS num_dependientes,
  Education_Level AS nivel_educativo,
  Marital_Status AS estado_civil,
  Income_Category AS categoria_ingreso,
  Card_Category AS categoria_tarjeta,
  Months_on_book AS meses_como_cliente,
  Total_Relationship_Count AS num_productos_contratados,
  Months_Inactive_12_mon AS meses_inactivo,
  Contacts_Count_12_mon AS num_contactos,
  Credit_Limit AS limite_credito,
  Total_Revolving_Bal AS saldo_revolvente,
  Total_Trans_Amt AS monto_total_transacciones,
  Total_Trans_Ct AS num_transacciones,
  Avg_Utilization_Ratio AS ratio_utilizacion
FROM `coherent-vision-500222-m3.bank_churners_rfm.bankchurners_raw`;

-- Reviso el tipo de dato de cada columna de mi tabla limpia
SELECT
  column_name,
  data_type
FROM `coherent-vision-500222-m3.bank_churners_rfm.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'clientes_clean';
