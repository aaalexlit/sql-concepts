DROP TABLE IF EXISTS examples.misc_part2;

CREATE TABLE examples.misc_part2 (
	name VARCHAR(30),
	last_contacted DATE,
	contact_type VARCHAR(30)
);

INSERT INTO examples.misc_part2
VALUES
	('joseph', '2016-08-01', 'phone_call'),
	('elizabeth', '2022-01-23', 'sms'),
	('david', NULL, 'sms'),
	('sarah', '2021-09-13', NULL),
	('thomas', '2008-01-18', 'sms'),
	('jessica', '2013-04-17', 'email'),
	('charles', '2022-08-24', NULL),
	('lisa', NULL, 'postal_mail');