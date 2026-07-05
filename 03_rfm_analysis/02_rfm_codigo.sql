-- Uno los 3 scores en un solo código de 3 dígitos (ej: "534")
-- Esto me sirve como resumen rápido del comportamiento del cliente
SELECT
  customer_id,
  r_score,
  f_score,
  m_score,
  CONCAT(CAST(r_score AS STRING), CAST(f_score AS STRING), CAST(m_score AS STRING)) AS rfm_code
FROM `coherent-vision-500222-m3.bank_churners_rfm.rfm_scores`;
