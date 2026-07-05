-- Le pongo nombre de negocio a cada combinación de scores
SELECT
  customer_id,
  r_score,
  f_score,
  m_score,
  rfm_code,
  CASE
    WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Campeones'
    WHEN f_score >= 4 THEN 'Clientes leales'
    WHEN r_score <= 2 AND f_score >= 4 AND m_score >= 4 THEN 'En riesgo'
    WHEN r_score >= 4 AND f_score <= 2 THEN 'Nuevos clientes'
    WHEN r_score <= 2 AND f_score <= 2 AND m_score <= 2 THEN 'Perdidos'
    ELSE 'Necesitan atencion'
  END AS segmento
FROM `coherent-vision-500222-m3.bank_churners_rfm.rfm_codigo`;
