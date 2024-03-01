CREATE DATABASE donutshop;
CREATE USER donut_1 WITH PASSWORD 'testing';
GRANT ALL PRIVILEGES ON DATABASE donutshop to donut_1;

CREATE TABLE customers (
customer_id INTEGER NOT NULL, 
name VARCHAR(128) NOT NULL, 
phone VARCHAR(16) NOT NULL, 
PRIMARY KEY (customer_id) );

CREATE TABLE menu (
item_id INTEGER NOT NULL, 
name VARCHAR(128) NOT NULL,
category VARCHAR(128),
price DECIMAL(10,2) NOT NULL; 
PRIMARY KEY (item_id);

CREATE TABLE orders (
order_id INTEGER NOT NULL, 
item_id INTEGERNOT NULL, 
customer_id INTEGER NOT NULL, 
count INTEGER NOT NULL, 
PRIMARY KEY(order_id, customer_id, count), 
CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES menu(item_id),
CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id));

GRANT ALL PRIVILEGES ON menu, customers, orders TO donut_1;