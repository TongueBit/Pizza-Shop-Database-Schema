create table pizza(
pizza_id int primary key auto_increment,
type varchar(40) not null,
price DECIMAL(6,2) NOT NULL
);

create table customer(
  customer_id int primary key auto_increment,
  name varchar(40) not null,
  phone_number varchar(20) not null
);

CREATE TABLE `order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  `total` decimal(6,2) not null,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
);

create table pizza_order(
pizza_id int not null,
order_id int not null,
quantity int not null,
foreign key (pizza_id) references pizza (pizza_id),
foreign key (order_id) references `order` (order_id)
);

INSERT INTO pizza (type, price)
VALUES ('Pepperoni & Cheese', 7.99);

INSERT INTO pizza (type, price)
VALUES ('Vegetarian', 9.99);

INSERT INTO pizza (type, price)
VALUES ('Meat Lovers', 14.99);

INSERT INTO pizza (type, price)
VALUES ('Hawaiian', 12.99);

insert into customer(name, phone_number)
values ( 'Trevor Page','226-555-4982');
insert into `order`(customer_id, order_date, total)
VALUES (LAST_INSERT_ID(), STR_TO_DATE('9/10/2014 9:47:00 AM', '%m/%d/%Y %h:%i:%s %p'), 22.98);
insert into pizza_order(pizza_id, order_id, quantity) 
values (1, LAST_INSERT_ID(), 1), (3, LAST_INSERT_ID(), 1);

insert into customer(name, phone_number)
values ( 'John Doe','555-555-9498');
insert into `order`(customer_id, order_date, total)
VALUES (LAST_INSERT_ID(), STR_TO_DATE('9/10/2014 01:20:00 AM', '%m/%d/%Y %h:%i:%s %p'), 39.97);
insert into pizza_order(pizza_id, order_id, quantity) 
values (2, LAST_INSERT_ID(), 1), (3, LAST_INSERT_ID(), 2);

insert into `order`(customer_id, order_date, total)
VALUES (1, STR_TO_DATE('9/10/2014 9:47:00 AM', '%m/%d/%Y %h:%i:%s %p'), 27.98);
insert into pizza_order(pizza_id, order_id, quantity) 
values (3, LAST_INSERT_ID(), 1), (4, LAST_INSERT_ID(), 1);

select c.name, sum(o.total) total_spent from customer c join `order` o on c.customer_id = o.customer_id group by c.customer_id;

select c.name, sum(o.total) total_cost, o.order_date from customer c join `order` o on c.customer_id = o.customer_id group by c.customer_id, o.order_date;




