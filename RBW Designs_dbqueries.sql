/*RBW Designs- Rachel Burstiner and Brooke Wheeling*/

/* QUERIES THAT USE SELECT ALL*/
select * 
from Customer;

Select *
from Employee;

select*
from Materials;

select *
from Payment;

select * 
from Product;

select *
from Product_Type;

select *
from Sales;

select *
from Supplier;

/* QUERY THAT USES AN AGGREGATE FUNCTION*/
select EmployeeID, sum(totaldue)as TotalSales
from Sales
group by EmployeeID;

/*QUERY THAT SELECTS RECORDS FROM TWO TABLES USING INNER JOIN*/
select s.EmployeeID, Name, Territory, sum(totaldue)as TotalSales
from Sales as s join Employee as e
on s.EmployeeID=e.EmployeeID
group by s.EmployeeID, Name, Territory
order by sum(totaldue) desc;

/*QUERY THAT USES AN OUTER JOIN*/
select Name, Color, sum(OrderQty) as OrderQty
from Product as p left outer join Sales as s
on p.ProductID=s.ProductID
group by p.Name, Color;

/*QUERY THAT USES A SUBQUERY*/
select Territory, sum(TotalDue) as TotalDue,
100*sum(TotalDue)/(select Sum(TotalDue) From Sales)
 as '% of TotalSales'
from sales as s join employee as e
on e.EmployeeID=s.EmployeeID
group by Territory
order by 100*sum(TotalDue)/(select Sum(TotalDue) From Sales) desc;