select emp_name, department_id, salary 
from employees_2
where salary > 
       (select avg(salary) from employees_2);

       
select d.department_name, sum(e.salary) as total_salary 
from employees_2 e 
inner join departments_2 d on e.department_id = d.department_id
group by d.department_name;


select d.department_name, avg(e.salary) as avg_salary 
from employees_2 e 
inner join departments_2 d on e.department_id = d.department_id 
group by d.department_name
having avg(e.salary) > 60000;


select e.emp_name, sum(s.amount) as total_sales 
from employees_2 e 
left join sales_data2 s on e.emp_name = s.emp_name 
group by e.emp_name;


with emp_total as (
select emp_name, sum(amount) as total_sales 
from sales_data2
group by emp_name
)
select emp_name, total_sales from emp_total
order by total_sales desc
limit 3;


select d.department_name, e.emp_name, e.salary from employees_2 e 
inner join departments_2 d on e.department_id = d.department_id 
where e.salary = (
        select max(e.salary) from employees_2 e2
        where e2.department_id = e.department_id
);


select sale_id, emp_name, department, amount, 
       sum(amount) over(partition by department order by sale_id) as running_total_dept
from sales_data2
order by department, sale_id;


with emp_total as (
select emp_name, department, sum(amount) as total_sales from sales_data2
group by emp_name, department

)
select emp_name, department, total_sales,
       dense_rank() over(partition by department order by total_sales desc) as dept_rank
from emp_total;


with emp_totals as (
select emp_name, department, sum(amount) as total_sales from sales_data2
group by emp_name, department

)
select et.emp_name, et.department, et.total_sales from emp_totals et
where et.total_sales > (
         select avg(total_sales) from emp_totals e2 
         where e2.department = et.department);
         
         
with emp_total as (
select emp_name, department, sum(amount) as total_sales from sales_data2
group by emp_name, department

), ranked as (
select et.*, dense_rank() over(partition by et.department order by et.total_sales desc) as rnk
from emp_total et

)
select emp_name, department, total_sales
from ranked
where rnk = 1; 
