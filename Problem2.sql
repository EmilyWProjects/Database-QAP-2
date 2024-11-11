CREATE TABLE products (

    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL

);

CREATE TABLE customers (

    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,

);

CREATE TABLE orders (

    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)

);

CREATE TABLE order_items (

    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)

);


INSERT INTO products (product_name, price, stock_quantity) VALUES
('Knife Set', 50.99, 20),
('Mirror', 30.99, 20),
('Doll', 20.99, 30),
('Necklace', 80.99, 15),
('Television', 200.99, 10);


INSERT INTO customers (first_name, last_name, email) VALUES
('Frederick', 'Kroger', 'frederick_kroger@example.com'),
('Annie', 'Wilkerson', 'annie_wilkerson@example.com'),
('Charles', 'Leroy', 'charles_leroy@example.com'),
('Sarah', 'Morgan', 'sarah_morgan@example.com');
('Carietta', 'Black', 'carietta_black@example.com');


INSERT INTO orders (customer_id, order_date) VALUES
(1, '2021-01-01'),
(2, '2022-02-02'),
(3, '2023-03-03'),
(4, '2024-04-04'),
(1, '2025-05-05');


INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 5),
(2, 2, 2),
(2, 1, 1),
(3, 3, 3),
(3, 4, 4),
(4, 4, 4),
(4, 5, 3),
(5, 5, 5),
(5, 2, 2);
