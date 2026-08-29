select *
from sample_superstore;

select sum(Sales) as Total_Sum, sum(Profit) as Total_Profit, count(`Order ID`)
from sample_superstore;

select Region, Round(sum(Sales),5)as Total_sales, Round(sum(Profit),5) as Total_Profit
from sample_superstore
group by Region 
Order by Region DESC;

select Category, `Sub-Category`, Round(sum(Sales),5)as Total_sales, Round(sum(Profit),5) as Total_Profit
from sample_superstore
group by Category, `Sub-Category`
order by Category DESC;

select `Customer Name`, Round(sum(Sales),5)as Total_sales
from sample_superstore
group by `Customer Name`
order by Total_sales DESC limit 10
;

Select `Sub-Category`, Round(avg(Profit),4) as AVG_Profit
from sample_superstore
group by `Sub-Category`
having AVG_Profit <0;

describe sample_superstore;

select year(str_to_date(`Order Date`, '%m/%d/%Y'))as Years, month(str_to_date(`Order Date`, '%m/%d/%Y')) as Months , round(sum(sales),4) as Total_sales
from sample_superstore
group by Years, Months
order by Years ASC;

select `Ship Mode`, AVG(datediff(STR_TO_DATE(`Ship Date`, '%m/%d/%Y'),
           STR_TO_DATE(`Order Date`, '%m/%d/%Y'))) as AVG_Delay
from sample_superstore
group by `Ship Mode`
;

SELECT Segment,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit,
       ROUND(SUM(Sales) / (SELECT SUM(Sales) FROM sample_superstore) * 100, 2) AS sales_Per,
       ROUND(SUM(Profit) / (SELECT SUM(Profit) FROM sample_superstore) * 100, 2) AS profit_Per
FROM sample_superstore
GROUP BY Segment;

select Category , sales, rank() over(partition by Category order by sales ASC) as Category_Rank
from sample_superstore;


SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount > 0 AND Discount <= 0.10 THEN '0–10%'
        WHEN Discount > 0.10 AND Discount <= 0.30 THEN '10–30%'
        ELSE '30%+'
    END AS discount_bucket,
    AVG(Profit) AS avg_profit
FROM sample_superstore
GROUP BY discount_bucket;

