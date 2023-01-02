
DROP TABLE IF EXISTS examples.misc_part1;

CREATE TABLE examples.misc_part1 (
	name VARCHAR(30),
	last_contacted DATE,
	contact_type VARCHAR(30)
);

INSERT INTO examples.misc_part1
VALUES
	('michael', '2022-09-09', 'email'),
	('elizabeth', '2022-01-23', 'sms'),
	('david', NULL, 'sms'),
	('linda', NULL, 'phone_call'),
	('william', '2002-01-28', 'postal_mail'),
	('barbara', '2019-12-01', 'email'),
	('richard', '2022-08-29', NULL),
	('susan', '2020-09-20', NULL);