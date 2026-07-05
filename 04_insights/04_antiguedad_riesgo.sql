-- Insight 4: ¿Qué % de clientes "En riesgo" o "Perdidos" son clientes antiguos (+36 meses)?
WITH riesgo_perdidos AS (
  SELECT
    seg.customer_id,
    seg.segmento,
    clean.meses_como_cliente,
    CASE
      WHEN clean.meses_como_cliente > 36 THEN 'Antiguo'
      ELSE 'No antiguo'
    END AS tipo_antiguedad
  FROM `coherent-vision-500222-m3.bank_churners_rfm.rfm_segmentado` AS seg
  JOIN `coherent-vision-500222-m3.bank_churners_rfm.clientes_clean` AS clean
    ON seg.customer_id = clean.customer_id
  WHERE seg.segmento IN ('En riesgo', 'Perdidos')
)
SELECT
  tipo_antiguedad,
  COUNT(*) AS cantidad_clientes,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS porcentaje
FROM riesgo_perdidos
GROUP BY tipo_antiguedad;
