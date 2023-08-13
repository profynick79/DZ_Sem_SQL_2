DROP DATABASE IF EXISTS dz_sql_sem_1;
create database DZ_SQL_sem_2;
USE DZ_sql_sem_2;

CREATE TABLE sales (
    id INT,
    order_date Date NOT NULL,
    count_product INT
    );
    
INSERT INTO sales (id, order_date, count_product) VALUES (
    1, "2021-01-01", "156"
    );

INSERT INTO sales (id, order_date, count_product) VALUES (
    2, "2021-01-02", "180"
    );

INSERT INTO sales (id, order_date, count_product) VALUES (
    3, "2021-01-03", "21"
    );

INSERT INTO sales (id, order_date, count_product) VALUES (
    4, "2021-01-04", "124"
    );

INSERT INTO sales (id, order_date, count_product) VALUES (
    5, "2021-01-05", "341"
    );
    
SELECT * from sales;    
USE dz_sql_sem_2; 
ALTER TABLE sales
ADD COLUMN type_order INT;

ALTER TABLE sales
DROP type_order;

SELECT * FROM sales;

SELECT 
	id,
    count_product,
CASE
	WHEN count_product BETWEEN 0 AND 99
		THEN "Small_order"
	WHEN count_product BETWEEN 100 AND 299
		THEN "Mean_order"
	WHEN count_product >= 300
		THEN "Big_order"
END AS type_order
FROM sales;

-- Task 3 --

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    employe_id VARCHAR(3) NOT NULL,
    amount DECIMAL(5,2) NOT NULL,
    order_status VARCHAR(10) NOT NULL
    );
    
INSERT INTO orders (employe_id, amount, order_status) VALUES (
    "e03", 15.00, "OPEN");

INSERT INTO orders (employe_id, amount, order_status) VALUES (
    "e01", 25.50, "OPEN");

INSERT INTO orders (employe_id, amount, order_status) VALUES (
    "e05", 100.70, "CLOSED");

INSERT INTO orders (employe_id, amount, order_status) VALUES (
    "e02", 22.18, "OPEN");

INSERT INTO orders (employe_id, amount, order_status) VALUES (
    "e04", 9.50, "CANCELLED");

    
SELECT order_id, order_status,
    CASE
		WHEN order_status = "OPEN"
			THEN "Order is in open state"
		WHEN order_status = "CLOSED"
			THEN "Order is closed"
		ELSE "Order is cancelled"
    END AS order_summary
    FROM orders;
