DROP TABLE IF EXISTS examples.people;

CREATE TABLE examples.people (
    person_id int,
    name varchar(30),
    gender varchar(30),
    location varchar(30),
    birth_year int,
    birth_month varchar(30),
    birth_day int,
    job_title varchar(30),
    salary int
);

INSERT INTO examples.people
    VALUES ('1', 'james', 'male', 'seattle', '1984', '9', '15', 'software_developer', '115000'), 
	       ('2', 'mary', 'female', 'new_york', '1992', '1', '13', 'financial_analyst', '183000'), 
		   ('3', 'john', 'male', 'san_francisco', '1971', '4', '22', 'data_scientist', '165000'), 
		   ('4', 'patricia', 'female', 'phoenix', '1971', '8', '15', 'physician', '215000'), 
		   ('5', 'michael', 'male', 'new_york', '1966', '1', '13', 'retired', '25000'), 
		   ('6', 'jennifer', 'female', 'phoenix', '1994', '12', '12', 'data_scientist', '165000');

