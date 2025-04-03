-- list all customer

 select *from Users;

 -- list all order for specific customer

 select *from Courier where SenderName =(select Name from Users where UserID=5);

 --list all couriers

 select *from Courier

 select *from Courier where TrackingNumber='TRK004';

 select *from Courier WHERE CourierID = 9 AND Status = 'delivered';

 select *from Courier WHERE Status != 'delivered';

 select * from Courier Where DeliveryDate = cast(GETDATE() as date);

 select getdate();

 select *from Courier where Status='transported';

 Select * from Courier where Weight BETWEEN 1 AND 5;

 select* from EmployeeTable Where Name like '%john%';

 select * from Payment where Amount > 50;

 select CourierID, count(*) as TotalPackages from Courier GROUP BY CourierID;
