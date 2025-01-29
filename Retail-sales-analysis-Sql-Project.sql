 -- SQL Retail Sales Analysis project- P1
 Create database  sql_project_p1;
 use sql_project_p1;
 
 create table retail_sales(
 transactions_id INT primary key,	
 sale_date	DATE,
 sale_time	TIME,
 customer_id INT,	
 gender varchar(15),
 age INT,
 category varchar(15),
 quantiy INT,
 price_per_unit	FLOAT,
 cogs	FLOAT,
 total_sale FLOAT
);

select * from retail_sales;

select count(*) from retail_sales;

-- Data Cleaning
Select * from retail_sales
where transactions_id is NULL;

select  * from retail_sales
where sale_date is null;


select * from retail_sales
where sale_time  is null;

Select * from retail_sales
where customer_id is null;

Select * from retail_sales
where gender is null;

Select * from retail_sales
where age is null;

Select * from retail_sales
where category is null;

Select * from retail_sales
where quantiy is null;

Select * from retail_sales
where price_per_unit is null;

select  * from retail_sales
where cogs is null;

Select * from retail_sales
where total_sale is null;

-- Find duplicates
Select transactions_id
from retail_sales
group by transactions_id
having count(*) > 1;

-- Delete null values

DELETE from retail_sales
where transactions_id is null
or sale_date is null
or sale_time is null
 or gender is null
 or category is null
 or quantiy is null
 or cogs is null
 or total_sale is null;

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;


-- Data Exploration 

-- How many sales we have?
SELECT sum(total_sale) as total_sale FROM retail_sales;

-- How many unique cutomers we have
Select count(distinct(customer_id))
from retail_sales;

select distinct category 
from retail_sales;



-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
select * from retail_sales
where sale_date='2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

Select *
from retail_sales
WHERE 
category = 'Clothing'
and sale_date between 2022-11-01 and 2022-11-30
and quantiy > 10;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
Select category ,
sum(total_sale)as total_sales
from retail_sales
group by category
order by total_sales DESC;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select 
round(avg(age),2) as Average_Age
from  retail_sales
where category ='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
Select * from  retail_sales
where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select category,
 gender,
 count(transactions_id)
 from retail_sales
 group by category, gender
 order by category;
 
 -- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

 SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank_year
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank_year=1;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
Select 
customer_id,
sum(total_sale) as total_sales
from retail_sales
group by customer_id
order by total_sales desc
limit 5;
 
 -- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
 select category,
 count(distinct customer_id)
FROM retail_sales
group by category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening
with hourly_sale
AS ( 
select *,
case 
when extract(Hour from sale_time) <=12 then 'Mornig'
when extract(Hour from sale_time) Between 12 AND 17 then 'afternoon'
else 'evening'
end as shift
from retail_sales
)
Select shift,
count(*) as total_orders
From hourly_sale
group by shift;


-- End of project
