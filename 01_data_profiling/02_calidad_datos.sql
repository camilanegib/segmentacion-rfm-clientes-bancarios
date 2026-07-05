-- Reviso si hay valores nulos en las columnas que voy a usar para RFM
SELECT
  COUNT(*) AS total_filas,
  COUNTIF(Months_Inactive_12_mon IS NULL) AS nulos_recencia,
  COUNTIF(Total_Trans_Ct IS NULL) AS nulos_frecuencia,
  COUNTIF(Total_Trans_Amt IS NULL) AS nulos_monetario
FROM `coherent-vision-500222-m3.bank_churners_rfm.bankchurners_raw`;

-- Verifico si CLIENTNUM se repite (si no es único, hay clientes duplicados)
SELECT
  COUNT(*) AS total_filas,
  COUNT(DISTINCT CLIENTNUM) AS clientes_unicos
FROM `coherent-vision-500222-m3.bank_churners_rfm.bankchurners_raw`;
