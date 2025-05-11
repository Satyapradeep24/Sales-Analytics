create database salesanalytics;
use salesanalytics;

create table regions (
    region_id int primary key auto_increment,
    country varchar(50) not null,
    state varchar(50) not null,
    city varchar(50) not null
);

create table categories (
    category_id int primary key auto_increment,
    category_name varchar(100) not null
);

create table products (
    product_id int primary key auto_increment,
    product_name varchar(100) not null,
    category_id int not null,
    stock_quantity int not null default 0,
    foreign key (category_id) references categories(category_id)
);

create table customers (
    customer_id int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null,
    join_date date not null,
    region varchar(50) not null
);

create table sales (
    order_id int primary key auto_increment,
    customer_id int not null,
    product_id int not null,
    order_date date not null,
    quantity int not null default 1,
    price decimal(10,2) not null,
    foreign key (customer_id) references customers(customer_id),
    foreign key (product_id) references products(product_id)
);

insert into regions (country, state, city) values
('India', 'Andhra Pradesh', 'Vijayawada'),
('India', 'Telangana', 'Hyderabad'),
('USA', 'California', 'Los Angeles'),
('USA', 'New York', 'New York City'),
('UK', 'England', 'London');

insert into categories (category_name) values
('Electronics'),
('Clothing'),
('Home Appliances'),
('Books'),
('Sports Equipment');

insert into products (product_name, category_id, stock_quantity) values
('Smartphone', 1, 150),
('Laptop', 1, 80),
('T-shirt', 2, 200),
('Washing Machine', 3, 30),
('Cricket Bat', 5, 100),
('Novel - Fiction', 4, 300);

insert into customers (name, email, join_date, region) values
('Ravi Kumar', 'ravi@example.com', '2023-01-10', 'Vijayawada'),
('John Smith', 'john@example.com', '2023-02-05', 'New York City'),
('Emily Clark', 'emily@example.com', '2023-03-12', 'London'),
('Suresh Reddy', 'suresh@example.com', '2023-04-01', 'Hyderabad'),
('Priya Sharma', 'priya@example.com', '2023-04-20', 'Los Angeles');

insert into sales (customer_id, product_id, order_date, quantity, price) values
(1, 1, '2023-05-01', 1, 25000.00),
(2, 2, '2023-05-03', 1, 50000.00),
(3, 6, '2023-06-15', 2, 499.00),
(4, 5, '2023-07-10', 1, 1200.00),
(5, 4, '2023-07-11', 1, 18000.00),
(1, 3, '2023-08-01', 3, 699.00),
(2, 1, '2023-08-15', 1, 25000.00),
(3, 2, '2023-09-01', 1, 50000.00),
(4, 3, '2023-09-10', 2, 699.00),
(5, 6, '2023-10-05', 4, 499.00);

insert into customers (name, email, join_date, region) values
('Pradeep', 'pradeep@kluniversity.com', '2023-01-10', 'Vijayawada'),
('Suvarshitha', 'suvarshitha@kluniversity.com', '2023-02-14', 'Hyderabad'),
('Srikanth', 'srikanth@kluniversity.com', '2023-03-01', 'Vijayawada'),
('Lasya', 'lasya@kluniversity.com', '2023-03-20', 'Hyderabad'),
('Karim', 'karim@kluniversity.com', '2023-04-05', 'Vijayawada');

insert into sales (customer_id, product_id, order_date, quantity, price) values
(8, 1, '2023-11-03', 1, 25000.00),
(6, 3, '2023-11-04', 2, 699.00),
(9, 5, '2023-11-05', 1, 1200.00),
(7, 6, '2023-11-06', 3, 499.00),
(10, 2, '2023-11-07', 1, 50000.00),
(6, 4, '2023-11-08', 1, 18000.00),
(7, 1, '2023-11-10', 1, 25000.00),
(9, 2, '2023-11-11', 1, 50000.00),
(10, 3, '2023-11-13', 2, 699.00),
(8, 6, '2023-11-14', 4, 499.00),
(10, 5, '2023-11-15', 1, 1200.00),
(7, 3, '2023-11-17', 1, 699.00),
(6, 2, '2023-11-19', 1, 50000.00);
