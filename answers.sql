--1.) Write an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order

CREATE TABLE productDetail(
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);
-- Insert transformed data manually
INSERT INTO productDetail (orderId, customerName, product)
VALUES (101, 'John Doe', 'Laptop'),
       (101, 'John Doe', 'Mouse'),
       (102, 'Jane Smith', 'Tablet'),
       (102, 'Jane Smith', 'Keyboard'),
       (102, 'Jane Smith', 'Mouse'),
       (103, 'Emily Clark', 'Phone');


--2.) Write an SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

CREATE TABLE orders(
    orderId INT PRIMARY KEY,
    customerName VARCHAR(255)
);
--insert the details
INSERT INTO orders (orderId, customerName)
VALUES (101, 'John Doe'),
       (101, 'John Doe'),
       (102, 'Jane Smith'),
       (102, 'Jane Smith'),
       (102, 'Jane Smith'),
       (103, 'Emily Clark');


CREATE TABLE products(
    orderId INT,
    product VARCHAR(255),
    quantity INT,
    PRIMARY KEY (orderId, product),
    FOREIGN KEY (orderId) REFERENCES orders(orderId)
);

INSERT INTO products (orderId, product, quantity)
VALUES (101, 'Laptop', 2),
       (101, 'Mouse', 1),
       (102, 'Tablet', 3),
       (102, 'Keyboard', 1),
       (102, 'Mouse', 2),
       (103, 'Phone', 1);
