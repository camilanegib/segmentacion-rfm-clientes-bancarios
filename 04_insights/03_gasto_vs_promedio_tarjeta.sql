-- Insight 3: ¿Cómo se compara cada cliente contra el promedio de su categoría de tarjeta?
SELECT
  customer_id,
  categoria_tarjeta,
  monto_total_transacciones,
  AVG(monto_total_transacciones) OVER (PARTITION BY categoria_tarjeta) AS promedio_categoria,
  monto_total_transacciones - AVG(monto_total_transacciones) OVER (PARTITION BY categoria_tarjeta) AS diferencia_vs_promedio
FROM `coherent-vision-500222-m3.bank_churners_rfm.clientes_clean`
ORDER BY categoria_tarjeta, diferencia_vs_promedio DESC;
