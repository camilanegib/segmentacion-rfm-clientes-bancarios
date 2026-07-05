-- Calculo los scores R, F, M usando NTILE(5)
-- NTILE(5) divide a los clientes en 5 grupos iguales según el orden que le indique
CREATE OR REPLACE TABLE `coherent-vision-500222-m3.bank_churners_rfm.rfm_scores` AS
SELECT
  customer_id,
  -- R: mientras MÁS meses inactivo, PEOR. Por eso ordeno DESC:
  -- los más inactivos (peor) quedan en el grupo 1, los menos inactivos (mejor) en el grupo 5
  NTILE(5) OVER (ORDER BY meses_inactivo DESC) AS r_score,

  -- F: mientras MÁS transacciones, MEJOR. Por eso ordeno ASC:
  -- los que menos transaccionan (peor) quedan en el grupo 1, los que más (mejor) en el grupo 5
  NTILE(5) OVER (ORDER BY num_transacciones ASC) AS f_score,

  -- M: mientras MÁS gasto, MEJOR. Por eso ordeno ASC:
  -- los que menos gastan (peor) quedan en el grupo 1, los que más (mejor) en el grupo 5
  NTILE(5) OVER (ORDER BY monto_total_transacciones ASC) AS m_score

FROM `coherent-vision-500222-m3.bank_churners_rfm.clientes_clean`;
