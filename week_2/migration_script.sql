create database assignment_two;

use assignment_two;

create table superstore (
    row_id int,
    order_id varchar(20),
    order_date date,
    ship_date date,
    ship_mode varchar(50),
    customer_id varchar(20),
    customer_name varchar(100),
    segment varchar(50),
    country varchar(50),
    city varchar(50),
    state varchar(50),
    postal_code int,
    region varchar(50),
    product_id varchar(30),
    category varchar(50),
    sub_category varchar(50),
    product_name text,
    sales decimal(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

show global variables like 'local_infile';

set global local_infile = 1;


load data local infile 'D:/Celebal/week_2/Sample - Superstore.csv'
into table superstore
character set latin1
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;



select * from superstore;




select count(*) from superstore;

show create table superstore;

describe superstore;

select * from superstore where region = "East";

select * from superstore where category = 'Furniture' and sub_category = 'chairs';


select * from superstore where sales > 1000;


select category, sum(sales) as total_sales from superstore group by category;

select category, avg(sales) as avg_sales from superstore group by category;

select category, avg(sales) as avg_sales from superstore where postal_code > 5000 group by category;

select category, sum(sales) as total_sales from superstore group by category order by total_sales desc;


select customer_name, sum(sales) as total_sales from superstore group by customer_name order by total_sales desc;

select product_name, sum(sales) as total_sales from superstore group by product_name order by total_sales desc limit 10;

select * from superstore where sales < 0;
