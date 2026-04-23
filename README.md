# SQL Practice

## Problem
Find top 3 employees overall and per department

## Concepts Used
- ROW_NUMBER
- DENSE_RANK
- Window Functions


# Year-over-Year (YoY) Sales Growth using LAG

## Problem
Calculate Year-over-Year (YoY) sales growth percentage using SQL window function.

---

## Approach
- Use `LAG()` to get previous year sales
- Use `ORDER BY` to maintain correct sequence
- Handle edge cases:
  - NULL values (first row)
  - Division by zero

---

## SQL Solution

```sql
WITH cte AS (
    SELECT 
        year,
        total_sales,
        LAG(total_sales) OVER (ORDER BY year) AS prev_sales
    FROM sales_data
)
SELECT 
    year,
    total_sales,
    prev_sales,
    CASE 
        WHEN prev_sales IS NULL OR prev_sales = 0 THEN NULL
        ELSE (total_sales - prev_sales) / CAST(prev_sales AS FLOAT) * 100
    END AS yoy_growth
FROM cte;
