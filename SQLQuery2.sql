use practice3;

CREATE TABLE sales_data (
    year INT,
    total_sales INT
);

INSERT INTO sales_data (year, total_sales) VALUES
(2019, 1000),
(2020, 1200),
(2021, 1500),
(2022, 1300),
(2023, 1800);

select * from sales_data;

With CTE AS
(
select year,total_sales,
LAG(total_sales) over(order by year) as prev_year_sales
from sales_data
)

select *,
(total_sales-prev_year_sales)/ cast(prev_year_sales as float) *100 as yoy_growth_pct
from cte;

-- Handling edge case___
With CTE_1 AS
(
select year,total_sales,
lag(total_sales) over(order by year) as prev_year_sales from sales_data
)

select year, total_sales,prev_year_sales,
case when prev_year_sales is null or prev_year_sales=0 then Null
     else (total_sales-prev_year_sales)/cast(prev_year_sales as float)* 100 END AS yoy_growth_pct
from CTE_1;