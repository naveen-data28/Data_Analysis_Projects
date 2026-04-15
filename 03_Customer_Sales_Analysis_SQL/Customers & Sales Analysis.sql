create database project;
use project;

create table Customers (
     CustomerID int,
     Name varchar(50),
     City varchar(50)
);

insert into Customers values 
(1, 'Arun', 'Chennai'),
(2, 'Bala', 'Mumbai'),
(3, 'Cathy', 'Delhi'),
(4, 'David', 'Chennai'),
(5, 'Esha', 'Mumbai');

create table Orders (
     OrderID int,
     CustomerID int,
     product varchar(50),
     Amount int
);

insert into Orders values 
(1, 1, 'Laptop', 50000),
(2, 2, 'Phone', 20000),
(3, 1, 'Mouse', 2000),
(4, 3, 'Tablet', 30000),
(5, 4, 'Laptop', 55000),
(6, 2, 'Shoes', 4000),
(7, 5, 'Phone', 25000);

select c.city, sum(o.Amount) as total_revnue from Customers c 
join Orders o on c.CustomerID = o.CustomerID 
group by c.City;                                                          

select name, total_amt from (
select c.Name, sum(o.Amount) as total_amt,
dense_rank() over(order by sum(o.Amount) desc)as rnk from Customers c 
join Orders o on c.customerID = o.CustomerID 
group by c.name)t
where rnk <= 3;                                                           

select c.Name, sum(o.Amount) as total_amt from Customers c 
join Orders o on c.CustomerID = o.CustomerID 
group by c.Name
having sum(o.Amount) > 
      (select avg(total) from 
          (select sum(o.Amount) as total from Orders o 
		   join Customers c on o.CustomerID = c.CustomerID 
           group by c.Name)t
		);                                                              
        
select c.Name, count(o.OrderID) as num_ord from Customers c 
join Orders o on c.CustomerID = o.CustomerID 
group by c.Name;                                                       

select City, total_revenue from (
select c.city, sum(o.Amount) as total_revenue from Customers c 
join Orders o on c.CustomerID = o.CustomerID 
group by c.City)t
order by total_revenue desc 
limit 1;                                                               
                                                
select Name, total_spend, rank() over(order by total_spend desc)as rnk from (
     select c.name, sum(o.Amount) as total_spend from Customers c 
     join Orders o on c.CustomerID = o.CustomerID 
     group by c.Name)t;                                                  
     
select c.Name from Customers c 
join Orders o on c.CustomerID = o.CustomerID 
group by c.Name, c.City
having sum(o.Amount) > (select avg(total_amt) from (
select sum(o.Amount) as total_amt from Customers c2
join Orders o2 on c2.customerID = o2.CustomerID
where c2.City = c.City
group by c2.CustomerID)t);                                               

 
