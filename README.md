# Segmentación RFM de Clientes Bancarios

Este es un proyecto de portafolio que hice para practicar SQL y análisis de datos, aplicando el modelo RFM (Recencia, Frecuencia, Monetario) sobre un dataset de clientes bancarios. Lo hice como parte de mi proceso para postular a prácticas de Marketing Analytics.

## ¿De qué trata?

Usé el dataset [BankChurners de Kaggle](https://www.kaggle.com/datasets/sakshigoyal7/credit-card-customers), que tiene información de 10,127 clientes de un banco (gasto, número de transacciones, si dejaron el banco o no, etc.). La idea era responder una pregunta que le importa a cualquier banco: ¿quiénes son mis mejores clientes y quiénes están a punto de irse?

Para eso usé el modelo RFM, que clasifica a los clientes según:
- **R (Recencia):** qué tan reciente fue su última actividad
- **F (Frecuencia):** cuántas veces transaccionan
- **M (Monetario):** cuánto gastan

Un detalle importante: este dataset no tiene fechas de transacciones individuales (no es un historial tipo "compra del 5 de enero, compra del 10 de febrero"), sino datos ya resumidos de los últimos 12 meses. Entonces tuve que usar columnas que sirvieran como "reemplazo" de R, F y M:

- Para Recencia usé `Months_Inactive_12_mon` (meses inactivo)
- Para Frecuencia usé `Total_Trans_Ct` (número de transacciones)
- Para Monetario usé `Total_Trans_Amt` (monto total transaccionado)

## Todo lo hice en BigQuery (SQL)

Fui armando el proyecto en fases, en el mismo orden en que se hace un análisis real:

**1. Data Profiling** — antes de tocar nada, revisé la tabla cruda: qué columnas tenía, si había valores nulos, si había clientes duplicados, y cuáles eran los mínimos/máximos de las columnas que iba a usar. Esto me sirvió para confirmar que el dataset estaba limpio (0 nulos, 0 duplicados).

**2. Data Cleaning** — de las 22 columnas originales, me quedé solo con las que realmente iba a usar (quité columnas raras que traía el dataset, como las de un clasificador Naive Bayes que no tenían que ver con mi análisis) y les puse nombres en español para que fuera más fácil de leer.

**3. Cálculo del RFM** — acá fueron 3 pasos:
   - Calculé los scores de R, F y M usando `NTILE(5)`, que divide a los clientes en 5 grupos según su comportamiento (1 = peor, 5 = mejor)
   - Uní los 3 scores en un código de 3 dígitos (ej: "534")
   - Le puse nombre a cada combinación de scores usando `CASE WHEN` (Campeones, En riesgo, Perdidos, etc.)

**4. Insights** — con la data ya segmentada, saqué varias conclusiones usando window functions (`RANK`, `PERCENT_RANK`, `AVG() OVER`, entre otras), por ejemplo qué segmento gasta más en total, o si los clientes que se van del banco (attrition) están más concentrados en algún segmento específico.

## Estructura de las carpetas

```
01_data_profiling/       -> queries para explorar y revisar la calidad de los datos
02_data_cleaning/        -> query para crear la tabla limpia con las columnas que uso
03_rfm_analysis/         -> cálculo de scores, código RFM y segmentación
04_insights/             -> las preguntas de negocio que respondí con SQL
dashboard/               -> el archivo de Power BI (pendiente de subir)
```

## Segmentos que definí

| Segmento | Cómo lo definí |
|---|---|
| Campeones | R, F y M altos |
| Clientes leales | Frecuencia alta |
| En riesgo | Antes eran buenos clientes (F y M altos) pero ya no están activos |
| Nuevos clientes | Activos hace poco, pero con pocas transacciones aún |
| Perdidos | R, F y M bajos |
| Necesitan atención | El resto, valores más intermedios |

## Lo que todavía me falta

- Terminar el dashboard en Power BI (voy a conectar las tablas `clientes_clean` y `rfm_segmentado`)
- Agregar capturas del dashboard acá en el README cuando esté listo

## Herramientas

Google BigQuery, SQL (GoogleSQL), Power BI.
