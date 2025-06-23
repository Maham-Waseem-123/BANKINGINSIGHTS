show databases;
use bankingdb;
show tables;

-- 1.	Top 5 cities with the highest number of customers
select * from customers;
select city, count(customer_id) as total_customers from customers
group by city
order by count(customer_id) desc limit 5;

-- 2.	Total loan amount issued by loan type.
show tables;
select * from loans;
select loan_type, sum(loan_amount) as total_loan
from loans
group by loan_type
order by sum(loan_amount) desc;

-- 3.	Customers who have more than 2 accounts.
show tables;
select * from accounts;
select c.name, count(a.customer_id) as Total_accounts
from customers as c inner join accounts as a 
on c.customer_id = a.customer_id
group by c.name
order by count(a.customer_id) desc;

-- 4.	Average transaction amount per account type.
select * from accounts;
select account_type, round(avg(balance),1) as average_amount
from accounts 
group by account_type
order by round(avg(balance),1) desc;

-- 5.	Rank branches based on total employee salaries.
show tables;
select * from employees;

select branch, sum(salary) as total_salary,
Rank () over (order by sum(salary) desc) as ranks
from employees
group by branch;


-- 6.	List customers who haven't made a transaction in the last 30 days.
select * from transactions;

select c.name, datediff(curdate(), max(t.transaction_date)) as Days_since_last_transaction
from customers as c  inner join accounts as a 
on c.customer_id = a.customer_id
inner join 
transactions as t on a.account_id = t.account_id
group by c.name
having datediff(curdate(), max(t.transaction_date)) > 30;

-- 7.	Number of male vs female customers by city.
select * from customers;
select city, 
count(case when gender = 'M' then 1 End) as male_customers , 
count(case when gender = 'F' then 1 End) as female_customers
from customers
group by city;

-- 9.	Display loan details along with approving employee name.
show tables;
select * from loan_approvals;

select e.name, e.branch as employee_branch, l.loan_type, l.loan_amount
from employees as e inner join loan_approvals as la 
on e.employee_id = la.employee_id
inner join 
loans as l on l.loan_id = la.loan_id;

-- 10.	Retrieve names of employees approving most loans.
show tables;
select * from loan_approvals;

select e.name, count(la.approval_id) as approvals
from employees as e left join loan_approvals as la 
on e.employee_id = la.employee_id
group by e.name
having count(la.approval_id) >1;

-- 13.	Write a procedure to retrieve high-value customers (balance > 1M).
select * from accounts;

Delimiter //
create procedure high_value_customers()
begin
select c.name, a.balance from customers as c  inner join accounts as a on c.customer_id = a.customer_id
where a.balance > 1000000;
End;
//
Delimiter ;

call high_value_customers();

-- 14.	Create a BEFORE INSERT trigger to ensure no negative balance is allowed in Accounts.

select * from accounts;
Delimiter //
create trigger No_negative_balance
Before Insert 
on accounts for each row 
Begin 
if new.balance < 0 then 
set new.balance = 0 ;
end if;
end;
//
delimiter ; 

insert into accounts (customer_id, account_type, balance, created_at) values 
(2, 'Savings', -11,curdate());

-- 15.	Write a procedure to count total active loans using OUT parameter.
select * from loans;

Delimiter //
create procedure total_active(out total_active_loans int)
begin
select count(loan_id) into total_active_loans from loans where status = 'Active';
end;
//
Delimiter ;

call total_active(@total_active_loans);
select @total_active_loans;

-- 16.	Use a subquery to show customers with balance below average

select * from accounts;
SELECT c.name, a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE a.balance < (SELECT AVG(balance) FROM Accounts);

