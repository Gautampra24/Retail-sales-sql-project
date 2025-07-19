# Retail Sales SQL Data Analysis Project

## Project Overview

This SQL project focuses on analyzing a fictional **retail sales dataset** using PostgreSQL. The primary goal is to clean the data, perform exploratory data analysis (EDA), and solve real-world business problems through SQL queries. This project demonstrates practical data wrangling, pattern recognition, and data-driven decision-making capabilities.

---

## Problem Statement

A retail company has provided a dataset containing transaction-level sales records. The objective is to:

* Clean and prepare the data.
* Perform exploratory analysis.
* Solve key business problems.
* Derive actionable insights such as best sales month, top customers, average customer age per category, and hourly sales shifts.

---

## Technologies Used

* **PostgreSQL**
* **SQL** (DDL, DML, Aggregate Functions, Window Functions, CTEs)

---

## Tasks Performed

### Data Cleaning

* Created the `retails` table with appropriate datatypes.
* Truncated and reloaded the dataset.
* Identified and removed `NULL` values using SQL `DELETE` statements.

### Exploratory Data Analysis (EDA)

* Counted total sales and unique customers.
* Identified unique categories.
* Investigated customer age and category relationships.
* Analyzed sales trends by month and time of day.

---

## Business Questions Solved

| No. | Business Question              | Summary                                                             |
| --- | ------------------------------ | ------------------------------------------------------------------- |
| 1   | Sales on a specific date       | Fetched all transactions on `2022-11-05`                            |
| 2   | High clothing sales            | Filtered sales in 'Clothing' category with quantity ≥ 4 in Nov-2022 |
| 3   | Category-wise sales            | Aggregated `total_sale` per category                                |
| 4   | Beauty buyers age              | Found average age of customers in ‘Beauty’ category                 |
| 5   | High-value transactions        | Listed all transactions with sales > ₹1000                          |
| 6   | Gender/category-wise orders    | Counted transactions grouped by gender and category                 |
| 7   | Best-selling months            | Ranked average monthly sales to find top months per year            |
| 8   | Top customers                  | Identified 5 customers with highest total sales using `RANK()`      |
| 9   | Unique category-wise customers | Counted distinct customers per category                             |
| 10  | Sales shift timing             | Created shifts (Morning, Afternoon, Evening) from `sale_time`       |

---

## Time-Based Sales Shift Analysis

| Shift     | Time Range   |
| --------- | ------------ |
| Morning   | Before 12 PM |
| Afternoon | 12 PM - 5 PM |
| Evening   | After 5 PM   |

This shift classification helped identify peak hours and can be used for staffing decisions or promotions planning.

---

## Key Insights

* **Highest average sales** occurred in specific months across years — indicating seasonal trends.
* **Top 5 customers** drove a significant portion of revenue.
* **Beauty category buyers** had a younger average age.
* **Afternoon** was the busiest shift — useful for workforce planning.

---

## File Structure

```bash
├── SQL_Queries.sql        # All SQL code for table creation, cleaning, and analysis
├── README.md              # This file
```

---

## Conclusion

This project improved my understanding of real-life data cleaning and SQL analysis. It also demonstrated how businesses can extract valuable insights using only SQL and no external tools.

