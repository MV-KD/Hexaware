--Find couriers that have a weight greater than the average weight of all couriers  

select * from Courier where weight > (select avg(weight) from Courier)

--Find the names of all employees who have a salary greater than the average salary
select name from EmployeeTable where salary > (select avg(salary) from EmployeeTable)
--Find the total cost of all courier services where the cost is less than the maximum cost  

select sum(Cost) AS TotalCost 
from courierservices 
where Cost < (select max(Cost) from courierservices); 

--Find all couriers that have been paid for 

Select c.* 
from courier c 
where EXISTS ( select 1 from payment p  where p.CourierID = c.CourierID ); 

--Find the locations where the maximum payment amount was made  

select l.*, p.Amount  
from Location l 
join Payment p on l.LocationID = p.LocationID 
where p.Amount = (select max(Amount) from Payment);  

--Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'): 

select *  from Courier where Weight > all (select Weight from Courier where SenderName = 'virat'); 
