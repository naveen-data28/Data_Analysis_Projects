create database sql_mini_project;
use sql_mini_project;

/*  EMPLOYEE TABLE  */

create table employees_2 (
      emp_id int primary key, 
      emp_name varchar(50),
      department_id int,
      salary int,
      city varchar(50)
);

insert into employees_2 (emp_id, emp_name, department_id, salary, city) values
(1,'Arjun',101,60000,'Delhi'),
(2,'Priya',102,75000,'Mumbai'),
(3,'Ravi',103,50000,'Chennai'),
(4,'Sneha',101,80000,'Delhi'),
(5,'Karan',102,55000,'Mumbai'),
(6,'Divya',103,65000,'Bangalore'),
(7,'Raj',104,72000,'Chennai');


/*  DEPARTMENT TABLE  */

create table departments_2 (
       department_id int primary key,
       department_name varchar(50),
       location varchar(50)
);

insert into departments_2 (department_id, department_name, location) values 
(101,'IT','Delhi'),
(102,'Finance','Mumbai'),
(103,'HR','Chennai'),
(104,'Marketing','Pune'),
(105,'Sales','Bangalore');


/*  SALES DATA TABLE  */

create table sales_data2 (
       sale_id int primary key,
       emp_name varchar(50),
       department varchar(50),
       product varchar(50),
       quantity int, 
       amount int,
       sale_amount varchar(10)
);

insert into sales_data2 (sale_id, emp_name, department, product, quantity, amount, sale_amount) values
(1,'Arjun','IT','Laptop',1,40000,'Jan'),
(2,'Priya','Finance','Mouse',5,1500,'Jan'),
(3,'Ravi','HR','Keyboard',3,4500,'Jan'),
(4,'Sneha','IT','Laptop',2,120000,'Feb'),
(5,'Karan','Finance','Monitor',1,18000,'Feb'),
(6,'Divya','HR','Laptop',1,60000,'Mar'),
(7,'Raj','IT','Mouse',10,3000,'Mar'),
(8,'Meena','Finance','Laptop',1,60000,'Mar'),
(9,'Arjun','IT','Monitor',1,70000,'Mar'),
(10,'Priya','Finance','Laptop',1,85000,'Mar');


/*  SALES RANK_TABLE USING WINDOWS FUNCTION  */

create table sales_rank2 (
       sale_id int,
       emp_name varchar(50),
       department varchar(50),
       amount int 
);

insert into sales_rank2 (sale_id, emp_name, department, amount) values
(1, 'Arjun', 'IT', 60000),
(2, 'Priya', 'Finance', 1500),
(3, 'Ravi', 'HR', 4500),
(4, 'Sneha', 'IT', 120000),
(5, 'Karan', 'Finance', 18000),
(6, 'Divya', 'HR', 60000),
(7, 'Raj', 'IT', 70000); 
