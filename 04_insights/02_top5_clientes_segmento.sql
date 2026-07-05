-- Insight 2: ¿Quiénes son los 5 clientes que más gastan dentro de cada segmento?
WITH base AS (
  SELECT
    seg.customer_id,
    seg.segmento,
    SUM(clean.monto_total_transacciones) AS monto_total
  FROM `coherent-vision-500222-m3.bank_churners_rfm.rfm_segmentado` AS seg
  JOIN `coherent-vision-500222-m3.bank_churners_rfm.clientes_clean` AS clean
    ON seg.customer_id = clean.customer_id
  GROUP BY seg.customer_id, seg.segmento
)
SELECT
  customer_id,
  segmento,
  monto_total,
  ROW_NUMBER() OVER (PARTITION BY segmento ORDER BY monto_total DESC) AS puesto
FROM base
QUALIFY puesto <= 5;
