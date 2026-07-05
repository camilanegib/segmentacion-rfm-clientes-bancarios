-- Insight 1: ¿Qué segmento concentra más gasto total del banco?
SELECT
  segmento,
  SUM(monto_total_transacciones) AS gasto_total
FROM `coherent-vision-500222-m3.bank_churners_rfm.rfm_segmentado` AS seg
JOIN `coherent-vision-500222-m3.bank_churners_rfm.clientes_clean` AS clean
  ON seg.customer_id = clean.customer_id
GROUP BY segmento
ORDER BY gasto_total DESC;
