# DA 1. Mental Health

<img src="https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/Mental-Health.jpg" width="490" height="240">  

## Introduction

Welcome! This project is a personal initiative aimed at improving my data analysis skills and expanding my knowledge. Through hands-on work with datasets, data cleaning, visualization, and analysis, I aim to strengthen my abilities and gain practical experience in solving real-world problems.

## About the project

In this project I examine the impact of remote work on mental health using a synthetic Kaggle dataset. An interactive dashboard demonstrates descriptive analytics, providing clear insights into past trends and patterns.

🎯 Main goals: 
- Improve practical data analysis skills through hands-on practice
- Learn and apply techniques for data cleaning and preprocessing
- Develop effective data visualization and dashboard design
- Explore descriptive analytics to identify trends and patterns
- Strengthen ability to present insights clearly and professionally

---

🔗 **Usefull links**:

.csv dataset: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/Impact_of_Remote_Work_on_Mental_Health.csv)

.sql cleaning: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/Cleaning.sql)

.twbx project: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/DA%201.%20Mental%20Health.twbx)

public tableau project: [click here](https://public.tableau.com/app/profile/maksym.yakushev/viz/DA1_MentalHealth/Dashboard)

---

## Table of Contents
- [Data Familiarization: Understand the structure, variables, and content of the dataset](#data-familiarization-understand-the-structure-variables-and-content-of-the-dataset)
- [Data Cleaning: Preprocess the data by handling missing values, outliers, and inconsistencies to ensure quality for analysis](#data-cleaning-preprocess-the-data-by-handling-missing-values-outliers-and-inconsistencies-to-ensure-quality-for-analysis)
- [Identifying key trends and patterns](#identifying-key-trends-and-patterns)
- [Dashboard Creation: Build interactive dashboards using Tableau to visualize key trends and patterns in the data](#dashboard-creation-build-interactive-dashboards-using-tableau-to-visualize-key-trends-and-patterns-in-the-data)
- [Presentation: Summarize findings and insights in a clear and concise presentation to communicate results effectively](#presentation-summarize-findings-and-insights-in-a-clear-and-concise-presentation-to-communicate-results-effectively)
- [Conclusion](conclusion)

## Data Familiarization: Understand the structure, variables and content of the dataset

**Dataset Overview:**

🔗 **Link to the Original Dataset**: [click here](https://www.kaggle.com/datasets/waqi786/remote-work-and-mental-health)

The dataset used in this project is sourced from Kaggle. It's a synthetically generated dataset designed to simulate workplace trends related to remote work and mental health. The data does not represent real-world information and is intended solely for educational purposes, exploratory analysis. Consists of a single sheet (non-relational), containing all relevant data in one table.

📝 **Columns Description**

| **Column** | **Data type** | **Description** |
|---|---|---|
| **employee_id** | text | Unique identifier for each employee | 
| **age** | integer | Age of the employee (min: 22; max: 60) |
| **gender** | text | Gender of employee (Male, Female, Non-binary, Prefer not to say) |
| **job_role** | text | Assigned job role (Software Engineer, Project Manager, Sales, HR, Data Scientist, Designer, Marketing) |
| **industry** | text | Category of industry (Finance, Retail, Consulting, Manufacturing, Healthcare, IT, Education) |
| **years_of_experience** | integer | Employee years of experience (min: 1; max: 35) |
| **work_location** | text |Work setting (Hybrid, Onsite, Remote) |
| **hour_worked_per_week** | integer | Employee hours worked per week (min: 20; max: 60) |
| **number_of_virtual_meetings** | integer | Number of virtual meetings (min: 0; max: 15) |
| **work_life_balance_rating** | integer | Rating of work-life balance (1 to 5 rating scale, where 1 represents - bad and 5 represents - good) |
| **stress_level** | text | Level of stress (High, Medium, Low) |
| **mental_health_condition** | text | Condition of mental health (Depression, Burnout, Anxiety, None) |
| **access_to_mental_health_resources** | text | Does the employee have access to mental health resources? (Yes, No) |
| **productivity_change** | text | Is there Productivity Change? (No Change, Increase, Decrease) |
| **social_isolation_rating** | integer | Rating of social isolation (1 to 5 rating scale, where 1 represents - no social isolation and 5 represents - social isolation) |
| **satisfaction_with_remote_work** | text | Satisfaction with remote work (Unsatisfied, Neutral, Satisfied) |
| **company_support_for_remote_work** | integer | Rating of company support of remote work (1 to 5 rating scale, where 1 represents - bad and 5 represents - good) |
| **physical_activity** | text | How often does the employee have physical activity? (Daily, Weekly, None) |
| **sleep_quality** | text | Quality of sleep (Average, Good, Poor) |
| **Region** | text | region (Africa, Asia, South America, North America, Europe, Oceania) |

  Once I familiarized myself with the dataset, let's move on to the next stage.

## Task 2. Data Cleaning: Preprocess the data by handling missing values, outliers, and inconsistencies to ensure quality for analysis

Link to Cleaning script: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/Cleaning.sql)

Let's start with Dataset overview!

First of all I have to check if everything is working and displaying correctly.

```sql
SELECT * 
FROM health
LIMIT 5;
```

Result: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/queries_sql/view_first_5_rows.csv)

Next, I have to do a sanity check. For example, making sure that an employee isn't 1 year old or 157 years old and so on. Let's consider the following columns: **age**, **years\_of\_experience**, **hours\_worked\_per\_week**, and **number\_of\_virtual\_meetings**.

```sql
SELECT
  MIN(age) AS min_age
  , MAX(age) AS max_age
  , MIN(years_of_experience) AS min_years_of_experience
  , MAX(years_of_experience) AS max_years_of_experience
  , MIN(hours_worked_per_week) AS min_hours_worked_per_week
  , MAX(hours_worked_per_week) AS max_hours_worked_per_week
  , MIN(number_of_virtual_meetings) AS min_number_of_virtual_meetings
  , MAX(number_of_virtual_meetings) AS max_number_of_virtual_meetings
FROM health;
```

Result: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/queries_sql/sanity_check.csv)

| min_age | max_age | min_years_of_experience |	max_years_of_experience |	min_hours_worked_per_week |	max_hours_worked_per_week	| min_number_of_virtual_meetings | max_number_of_virtual_meetings |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 22 | 60 | 1 | 35 | 20 | 60 | 0 | 15 |

If I need to see what values exist in the columns I can use the following query

```sql
SELECT
  DISTINCT gender
FROM health;
```

Result: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/queries_sql/gender_column.csv)

| gender |
| --- |
| Female |
| Male |
| Non-binary |
| Prefer not to say |

But if there is a need to view the values for all columns I can use resource-efficient queries for column overview

```sql
WITH gender_values AS (
  SELECT
    DISTINCT gender
  FROM health
),
job_role_values AS (
  SELECT
    DISTINCT job_role
  FROM health
),
industry_values AS (
  SELECT
    DISTINCT industry
  FROM health
),

...

SELECT
  'Gender' AS column_name
  , gender AS value
FROM gender_values

UNION ALL

SELECT
  'Job Role' AS column_name
  , job_role AS value 
FROM job_role_values

UNION ALL

SELECT
  'Industry' AS column_name
  , industry AS value 
FROM industry_values

...
```

Result: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/queries_sql/resource_efficient_queries.csv)

The next step is checking for duplicates. We can use this fast method

```sql
SELECT
  COUNT(employee_id) - COUNT(DISTINCT employee_id) AS count_duplicates
FROM health;
```

Result: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/queries_sql/duplicates_check_fast.csv)

| count_duplicates |
| --- |
| 0 |

But for a more detailed overview I can execute the following query

```sql
SELECT
  employee_id
  , COUNT(*)
FROM health
GROUP BY
  employee_id
HAVING
  COUNT(*) > 1
ORDER BY
  COUNT(*) DESC;
```

Result:

| employee_id | count |
| --- | --- |
| | |

The next step is checking for NULLs values. Let's run the following query

```sql
SELECT
  COUNT(*) FILTER (WHERE employee_id IS NULL) AS employee_id_NULL
  , COUNT(*) FILTER (WHERE age IS NULL) AS age_NULL
  , COUNT(*) FILTER (WHERE gender IS NULL) AS gender_NULL
  , COUNT(*) FILTER (WHERE job_role IS NULL) AS job_role_NULL
  , COUNT(*) FILTER (WHERE industry IS NULL) AS industry_NULL
  , COUNT(*) FILTER (WHERE years_of_experience IS NULL) AS years_of_experience_NULL
  , COUNT(*) FILTER (WHERE work_location IS NULL) AS work_location_NULL
  , COUNT(*) FILTER (WHERE hours_worked_per_week IS NULL) AS hours_worked_per_week_NULL
  , COUNT(*) FILTER (WHERE number_of_virtual_meetings IS NULL) AS number_of_virtual_meetings_NULL
  , COUNT(*) FILTER (WHERE work_life_balance_rating IS NULL) AS work_life_balance_rating_NULL
  , COUNT(*) FILTER (WHERE stress_level IS NULL) AS stress_level_NULL
  , COUNT(*) FILTER (WHERE mental_health_condition IS NULL) AS mental_health_condition_NULL
  , COUNT(*) FILTER (WHERE access_to_mental_health_resources IS NULL) AS access_to_mental_health_resources_NULL
  , COUNT(*) FILTER (WHERE productivity_change IS NULL) AS productivity_change_NULL
  , COUNT(*) FILTER (WHERE social_isolation_rating IS NULL) AS social_isolation_rating_NULL
  , COUNT(*) FILTER (WHERE satisfaction_with_remote_work IS NULL) AS satisfaction_with_remote_work_NULL
  , COUNT(*) FILTER (WHERE company_support_for_remote_work IS NULL) AS company_support_for_remote_work_NULL
  , COUNT(*) FILTER (WHERE physical_activity IS NULL) AS physical_activity_NULL
  , COUNT(*) FILTER (WHERE sleep_quality IS NULL) AS sleep_quality_NULL
  , COUNT(*) FILTER (WHERE region IS NULL) AS region_NULL
FROM health;
```

Result: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/queries_sql/%20check_nulls.csv)

Also this dataset contains ratings and I have to check the columns. According to the criteria ratings can be from 1 to 5. So, let's run the following query

```sql
SELECT
  COUNT(work_life_balance_rating) AS count_wlbr_greather_then_five
  , COUNT(social_isolation_rating) AS count_sir_greather_then_five
  , COUNT(company_support_for_remote_work) AS count_csfrw_greather_then_five
FROM health
WHERE
  work_life_balance_rating > 5
  OR work_life_balance_rating < 1
  OR social_isolation_rating > 5
  OR social_isolation_rating < 1
  OR company_support_for_remote_work > 5
  OR company_support_for_remote_work < 1;
```

Result: [click here](https://github.com/MaksymYakushev/DA1.MentalHealth/blob/main/data/queries_sql/check_rating_columns.csv)

| count_wlbr_greather_then_five | count_sir_greather_then_five | count_csfrw_greather_then_five |
| --- | --- | --- |
| 0 | 0 | 0 |

**At this stage:**
- The data has passed a basic quality check;
- It has been found to be clean, consistent, and free of anomalies or duplicates;
- I can proceed to the next step.

## Task 3. Identifying key trends and patterns

## Task 4. Dashboard Creation: Build interactive dashboards using Tableau to visualize key trends and patterns in the data

## Task 5. Presentation: Summarize findings and insights in a clear and concise presentation to communicate results effectively

## Conclusion
