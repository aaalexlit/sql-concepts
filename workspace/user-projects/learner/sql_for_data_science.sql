SET search_path TO examples;

-- Q1. Grab all the data available in table people and salary

SELECT * FROM people;

SELECT * FROM salary;

-- Q3. Show me only the data from the following columns: ['name', 'gender', 'job_title'].

SELECT name, gender, job_title 
FROM people p; 

-- Q4. Which individuals work in New York?

SELECT name
FROM people
WHERE location = 'new_york'; 

-- Q5. How many individuals live either in Seattle or Phonenix?

SELECT count(person_id)
FROM people
WHERE location IN ('seattle', 'phoenix');

-- Q6. How many individuals live in each of the cities?

SELECT location, count(person_id)
FROM people
GROUP BY location;

-- Q7. What is the total salaries in Phoenix and New York?

SELECT location
, SUM(salary) AS total_salary
FROM people
WHERE location = 'phoenix'
 OR location = 'new_york'
GROUP BY location;

-- Q8. Show me the individual names, their locations and salaries, 
-- along with the average salary in each location.

SELECT p.name
, p.location
, p.salary
, s.average_salary
FROM people p
LEFT JOIN salary s ON p.location = s.city;

-- Q9. Create a new column in people that breaks down the job titles 
-- into tech and non-tech. Only return names, job titles, the new category 
-- named as job_group and salaries.

SELECT name
, job_title
, CASE
  WHEN job_title IN ('software_developer', 'data_scientist') THEN 'tech'
  WHEN job_title IN ('financial_analyst', 'physician') THEN 'non-tech'
  ELSE job_title
 END AS job_group
 , salary
FROM people;

-- Q10. Which job_group makes more money on average? 
-- Order the results from the highest to the lowest job_group

SELECT job_group
, AVG(salary) AS average_salary
FROM
 (
  SELECT person_id
  , CASE
    WHEN job_title IN ('software_developer', 'data_scientist') THEN 'tech'
    WHEN job_title IN ('financial_analyst', 'physician') THEN 'non-tech'
    ELSE job_title
   END AS job_group
   , salary
  FROM people
 ) as t
GROUP BY job_group
ORDER BY average_salary DESC;

-- Q11: Create a rank of the salaries overall and 
-- also by gender from highest to the lowest salary

SELECT name
, gender
, salary
, RANK() OVER(ORDER BY salary DESC) AS salary_rank_overall
, RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS salary_rank_by_gender
FROM people
ORDER BY salary_rank_overall
, salary_rank_by_gender;

-- Q12: Create a running sum of each salary both overall 
-- (i.e. sum at row 2 should be row 1 + row 2, 
-- sum at row 3 should be sum of row 1 + row 2 + row 3, and so forth) 
-- and also by gender, ordered by age (from older to younger). 
-- Also include a column that shows the total salary at each row.

SELECT name
, gender
, birth_year
, salary
, SUM(salary) OVER(ORDER BY birth_year 
                   ROWS between UNBOUNDED PRECEDING
                   AND CURRENT ROW) AS running_total_salary_overall
, SUM(salary) OVER(PARTITION BY gender
  ORDER BY birth_year ROWS between UNBOUNDED PRECEDING
   AND CURRENT ROW) AS running_total_salary_by_gender
, SUM(salary) OVER(ORDER BY birth_year ROWS between UNBOUNDED PRECEDING
   AND UNBOUNDED FOLLOWING) AS total_salary
FROM people
ORDER BY running_total_salary_overall
, running_total_salary_by_gender;

-- Grab all the data from misc_part1 and misc_part2

SELECT * FROM misc_part1;

SELECT * FROM misc_part2;

-- Q13: I see that both tables include the same columns. 
-- Can you combine them into one table? 
-- Sort the results by name and also identify which row belongs to which table.

SELECT *
, 1 AS misc_table_number
FROM misc_part1
UNION ALL
SELECT *
, 2 AS misc_table_number
FROM misc_part2
ORDER BY name;

-- Q14: Looking at the results of Q13, it looks like both tables included 
-- the same data for david and elizabeth. 
-- Can you create the same table but only include unique rows 
-- (i.e. de-dupe the results)? No need to show which table rows belong to.

SELECT *
FROM misc_part1
UNION
SELECT *
FROM misc_part2
ORDER BY name;

-- Q15: Create a temporary table named combined_table that 
-- includes distinct rows of the combined tables (similar to Q14). 
-- Where last_contacted value is missing, enter the value as 1901-01-01. 
-- We also know that contact_type that is missing is phone_call so fill those in as well.

WITH combined_table as (
 SELECT *
 FROM misc_part1
 UNION
 SELECT *
 FROM misc_part2
 ORDER BY name
)
SELECT name
, COALESCE(last_contacted, '1901-01-01') as last_contacted
, COALESCE(contact_type, 'phone_call') AS contact_type
FROM combined_table;

-- Q16: Starting with the combined_table, create separate columns 
-- for year, quarter, month and date of the last time individuals 
-- were contacted, where such a date is available.

WITH combined_table as (
 SELECT *
 FROM misc_part1
 UNION
 SELECT *
 FROM misc_part2
 ORDER BY name
)
SELECT name
, last_contacted
, DATE_PART('year', last_contacted) AS year_contacted
, DATE_PART('quarter', last_contacted) AS quarter_contacted
, DATE_PART('month', last_contacted) AS month_contacted
, DATE_PART('day', last_contacted) AS day_contacted
, contact_type
FROM combined_table
WHERE last_contacted IS NOT NULL;