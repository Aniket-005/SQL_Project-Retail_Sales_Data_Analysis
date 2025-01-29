<img src= "sales analysis.png" alt="Example Image" width="300"> 


# SQL-Project--Retail-Sales-Data-Analysis
## About
The Retail Sales Analysis Project aims to analyze retail sales data using SQL. It focuses on data cleaning, exploratory data analysis (EDA), and key performance indicator (KPI) calculations to gain insights into customer purchasing behavior, sales trends, and business performance. The project provides valuable insights that can help businesses optimize sales strategies and improve decision-making.

## Purposes of the Project
This project is focused on analyzing retail sales data using SQL. Based on the script, the main objectives of the project appear to be:

## About Data
This project's data was obtained from the github for analysis sales data to retrive datainsights, understand customer purchasing behavoir and to make decision as per the future predictions  
The data contains 11 columns and 1987 rows:

<img src=image-1.png alt="Example Image" width="400">

## Analysis List:
1. Data Management & Cleaning
Database & Table Creation:
Creates a database sql_project_p1.
Defines a table retail_sales with key fields like transactions_id, sale_date, customer_id, category, total_sale, etc.
Data Cleaning Queries:
Identifies missing (NULL) values in key columns such as transactions_id, sale_date, customer_id, price_per_unit, etc.
2. Sales Performance Analysis
Total Transactions Count:
Uses COUNT(*) to determine the number of sales transactions.
Revenue Analysis:
Fields like price_per_unit, quantity, cogs (Cost of Goods Sold), and total_sale suggest revenue and profit calculations.
Customer Demographics Analysis:
Fields like gender, age, and category indicate that sales might be analyzed based on customer segmentation.
3. Identifying Sales Trends
Sales by Category:
The category column likely helps analyze which product categories perform best.
Time-Based Analysis:
sale_date and sale_time allow for sales trends by day, month, or hour.
4. KPI Calculation
Revenue, COGS, and Profit Margins
Customer Purchase Behavior (age, gender-based insights)
Sales Volume Trends Over Time

## Approach Used
***1.	Data Wrangling***

During this initial phase, the data is examined to detect any NULL or missing values, and strategies for data replacement are implemented to address and substitute these values effectively.
- Build a database
- Create a table and insert the data.
- Select columns with null values in them. Null values are not present in our database because, in creating the tables, NOT NULL was specified for each field, effectively filtering out any null values.

***2.  Exploratory Data Analysis (EDA)***
Conducting exploratory data analysis is essential to address the project's listed questions and objectives.

## Business Questions to Answer

### Data Exploration
1.	How many sales we have?
2.  How many unique cutomers we have?

### Data Analysis & Business Key Problems & Answers
My Analysis & Findings
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
