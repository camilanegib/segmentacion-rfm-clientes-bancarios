-- Insight 5: ¿En qué percentil cae cada cliente dentro de su propio segmento?
SELECT
  seg.customer_id,
  seg.segmento,
  clean.monto_total_transacciones,
  PERCENT_RANK() OVER (PARTITION BY seg.segmento ORDER BY clean.monto_total_transacciones DESC) AS percentil
FROM `coherent-vision-500222-m3.bank_churners_rfm.rfm_segmentado` AS seg
JOIN `coherent-vision-500222-m3.bank_churners_rfm.clientes_clean` AS clean
  ON seg.customer_id = clean.customer_id
ORDER BY seg.segmento, percentil;
