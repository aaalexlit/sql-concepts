DROP TABLE IF EXISTS examples.salary;

CREATE TABLE examples.salary (city VARCHAR(30), average_salary int);

INSERT INTO examples.salary VALUES
	('san_francisco', '54500'),
	('seattle', '54100'),
	('new_york', '34400'),
	('phoenix', '31800');