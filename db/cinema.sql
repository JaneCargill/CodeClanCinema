DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;


CREATE TABLE customers(
id SERIAL8 primary key,
name VARCHAR(255),
funds FLOAT8
);

CREATE TABLE films(
id SERIAL8 primary key,
title VARCHAR(255),
price FLOAT8
);

CREATE TABLE tickets(
id SERIAL8 primary key, 
customer_id INT8 references customers(id),
film_id INT8 references films(id),
film_time VARCHAR(255)
);