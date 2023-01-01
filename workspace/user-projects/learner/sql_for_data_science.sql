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

-- Q5.  How many individuals live either in Seattle or Phonenix?

SELECT count(person_id)
FROM people
WHERE location IN ('seattle', 'phoenix');

--Q6: How many individuals live in each of the cities?

SELECT location, count(person_id)
FROM people
GROUP BY location;