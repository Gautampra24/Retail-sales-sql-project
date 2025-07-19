--Creating Table for retails_sales

CREATE TABLE retails(
	transactions_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(20),
	age INT,
	category VARCHAR(20),
	quantiy INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT
); 


TRUNCATE TABLE retails
--drop table retails;

SELECT COUNT(*) FROM retails;


SELECT * FROM retails

-- Checking NULL VALUE 

SELECT * FROM retails
WHERE transactions_id IS NULL
	OR sale_date IS NULL
	OR sale_time IS NULL
	OR gender IS NULL
	OR category IS NULL
	OR quantiy IS NULL
	OR price_per_unit IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL


--Deleting the NULL values data (Data Cleaning)

DELETE FROM retails
WHERE transactions_id IS NULL
	OR sale_date IS NULL
	OR sale_time IS NULL
	OR gender IS NULL
	OR category IS NULL
	OR quantiy IS NULL
	OR price_per_unit IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL

--Data Exploration

--1. How many sales in the data? 

SELECT COUNT(total_sale) AS NUMBER_OF_SALES FROM retails;


--2. How many unique customer we have?

SELECT COUNT(DISTINCT customer_id) AS No_Customer FROM retails;

--How many category we have in this table uniquely.

SELECT DISTINCT category AS No_Category FROM retails


--Now we have have done Data Analysis and Solve key Business Problems.

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT
	*
FROM
	RETAILS
WHERE
	SALE_DATE = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

SELECT * FROM retails
	WHERE category = 'Clothing' 
	AND quantiy >=4 
	AND TO_CHAR(sale_date, 'YYYY-MM')= '2022-11';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT category, SUM(total_sale), COUNT(*) AS Net_Orders
	FROM retails
	GROUP BY 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT category, ROUND(AVG(age),2) AS avg_age
FROM retails
WHERE category = 'Beauty'
GROUP BY 1;

	

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * FROM retails
WHERE total_sale >1000
ORDER BY total_sale DESC;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT gender, category, COUNT(transactions_id)
	FROM retails
	GROUP BY 1, 2;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

SELECT
	month_rank,
	Year,
	Month,
	AVG_Sales
FROM
	(
SELECT 
	EXTRACT(YEAR FROM sale_date) AS Year,
	EXTRACT(MONTH FROM sale_date) AS Month,
	AVG(total_sale) AS AVG_Sales,
	RANK() OVER (
		PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS month_rank
	FROM retails
	GROUP BY 1,2 
) AS T1
WHERE month_rank =1




-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT
	ranks,
	customer_id,
	highest_total_sales
	FROM (
	SELECT 
		customer_id, 
		SUM(total_sale) AS highest_total_sales,
		RANK() OVER (ORDER BY SUM(total_sale) DESC) AS ranks
		FROM retails
		GROUP BY customer_id
		ORDER BY 2 DESC
		) AS T1
	WHERE ranks <=5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
	category,
	COUNT(DISTINCT customer_id) AS Number_Cust
	FROM retails
	GROUP BY category;


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sales
AS (
SELECT*,
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) <12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
END AS shift
FROM retails
)
SELECT
	shift,
	COUNT(*) AS Total_sales
	FROM hourly_sales
	GROUP BY shift
	
--- This Project Ended.		
 
SELECT*FROM retails
	










