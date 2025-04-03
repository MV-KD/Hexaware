--Retrieve Payments with Courier Information  

select p.PaymentID, p.CourierID, p.Amount, p.PaymentDate,c.SenderName, c.ReceiverName 
from Payment p 
join Courier c on p.CourierID = c.CourierID; 



--24. Retrieve Payments with Location Information  
select p.PaymentID, p.CourierID, p.LocationId, p.Amount, p.PaymentDate,  
l.LocationName, l.Address 
from Payment p  
join Location l on p.LocationId = l.LocationID; 


--25. Retrieve Payments with Courier and Location Information  
select p.PaymentID, p.CourierID, p.LocationId,c.SenderName, c.ReceiverName, c.TrackingNumber, c.status ,
p.Amount, p.PaymentDate,l.LocationName, l.Address 
from Payment p 
join Courier c on p.CourierID = c.CourierID 
join Location l on p.LocationId = l.LocationID; 


--26. List all payments with courier details  
select p.PaymentID, p.CourierID, p.Amount, p.PaymentDate,c.SenderName, c.ReceiverName ,c.status
from Payment p 
join Courier c on p.CourierID = c.CourierID; 


--27. Total payments received for each courier 
SELECT p.CourierID, c.SenderName, c.ReceiverName, c.TrackingNumber,  sum(p.Amount) as TotalPayment 
FROM Payment p 
join Courier c on p.CourierID = c.CourierID 
group by p.CourierID, c.SenderName, c.ReceiverName, c.TrackingNumber; 



--28. List payments made on a specific date  

select p.PaymentID, p.CourierID, p.LocationId, p.Amount, p.PaymentDate,c.SenderName, c.ReceiverName, c.TrackingNumber 
from Payment p 
JOIN Courier c on p.CourierID = c.CourierID 
where p.PaymentDate = '2025-01-22';


--29. Get Courier Information for Each Payment  

select p.PaymentID, p.CourierID, c.SenderName, c.ReceiverName, c.TrackingNumber, c.status ,c.PickupDate  
from Payment p 
join Courier c on p.CourierID = c.CourierID 

--30. Get Payment Details with Location  

select p.PaymentID, p.CourierID, p.Amount, p.PaymentDate,  
l.LocationID, l.LocationName, l.Address 
from Payment p 
join Location l on p.LocationID = l.LocationID;


--31. Calculating Total Payments for Each Courier  

select p.CourierID, sum(p.Amount) as TotalAmount 
from Payment p 
group by p.CourierID 
order by CourierID ; 


--32. List Payments Within a Date Range  

select *from Payment where PaymentDate between'2025-03-01' AND '2025-03-30'; 


--33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side

select u.UserID, c.SenderName, c.CourierID, c.SenderName, c.ReceiverName, c.Status
from Users u 
join Courier c on u.Name = c.SenderName
group by UserID,c.SenderName, c.CourierID, c.SenderName, c.ReceiverName, c.Status


--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side  
--35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side  
--36. List all users and all courier services, showing all possible combinations.  
select u.UserID,  u.Name as  UserName, s.ServiceID ,s.ServiceName, 
s.Cost 
from Users u 
CROSS JOIN CourierServices s; 


--37. List all employees and all locations, showing all possible combinations:  

select  e.EmployeeID,  e.Name,  l.LocationID, 
l.LocationName 
from EmployeeTable e 
CROSS JOIN Location l; 


--38. Retrieve a list of couriers and their corresponding sender information (if available) 
select c.CourierID, c.SenderName, c.SenderAddress from Courier c; 


--39. Retrieve a list of couriers and their corresponding receiver information (if available):  
select c.CourierID, c.ReceiverName, c.ReceiverAddress from Courier c; 

select c.CourierID, c.TrackingNumber, c.Status, c.SenderName, c.SenderAddress,
case when c.SenderName is not null then 'Available' 
else 'Not Available' 
end as SenderInfoStatus
from Courier c

--40. Retrieve a list of couriers along with the courier service details (if available): 


--41. Retrieve a list of employees and the number of couriers assigned to each employee:  
select e.EmployeeID,  e.Name, count(c.CourierID) as TotalCourier from EmployeeTable e
join Courier c on e.EmployeeID = c.EmployeeID 
GROUP BY e.EmployeeID, e.Name 
ORDER BY TotalCourier DESC; 


--42. Retrieve a list of locations and the total payment amount received at each location: 

select    L.LocationID,  L.LocationName,  sum(P.Amount) as TotalPayment
from Location L 
join Payment P on L.LocationID = P.LocationID 
group by L.LocationID, L.LocationName 
order by TotalPayment ; 


--43. Retrieve all couriers sent by the same sender (based on SenderName).  

select  SenderName,  CourierID,  TrackingNumber,  ReceiverName, 
ReceiverAddress, Status, DeliveryDate   
from Courier  
order by SenderName, DeliveryDate ;  


--44. List all employees who share the same role.  

select EmployeeID, Name, Role from EmployeeTable  
where Role IN (select Role from EmployeeTable group by Role having count(*) > 1)  
order by Role, Name; 

--45. Retrieve all payments made for couriers sent from the same location.


--46. Retrieve all couriers sent from the same location (based on SenderAddress).  

select * from Courier where SenderAddress IN 
( select SenderAddress from Courier group by SenderAddress having count(*) > 1 );



--47. List employees and the number of couriers they have delivered:

select EmployeeID, count(*) as NumberOfCouriersDelivered  
from Courier where Status = 'Delivered'  
group by EmployeeID; 



--48. Find couriers that were paid an amount greater than the cost of their respective courier services  

select  c.CourierID,  c.TrackingNumber,  p.Amount , 
cs.Cost as ServiceCost  from Payment p 
join Courier c on p.CourierID = c.CourierID 
join CourierServices cs on c.ServiceID = cs.ServiceID 
where p.Amount > cs.Cost; 

