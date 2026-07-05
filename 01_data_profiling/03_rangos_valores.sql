-- Reviso los valores mínimo, máximo y promedio de mis 3 columnas para RFM
-- Me ayuda a detectar valores raros antes de calcular los scores
SELECT
  MIN(Months_Inactive_12_mon) AS min_recencia,
  MAX(Months_Inactive_12_mon) AS max_recencia,
  ROUND(AVG(Months_Inactive_12_mon), 2) AS promedio_recencia,

  MIN(Total_Trans_Ct) AS min_frecuencia,
  MAX(Total_Trans_Ct) AS max_frecuencia,
  ROUND(AVG(Total_Trans_Ct), 2) AS promedio_frecuencia,

  MIN(Total_Trans_Amt) AS min_monetario,
  MAX(Total_Trans_Amt) AS max_monetario,
  ROUND(AVG(Total_Trans_Amt), 2) AS promedio_monetario
FROM `coherent-vision-500222-m3.bank_churners_rfm.bankchurners_raw`;
