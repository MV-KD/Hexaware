--DATABASE CREATION

create database CMS;

--user table

create table Users(UserID int primary key  , Name varchar(255),Email varchar(255) unique, Password varchar(255),ContactNumber varchar(20),Address Text);

insert into Users values (1,'virat','virat@gmail.com','pass1111','9711223344','7 lion street,madurai');
insert into Users values (2,'dhoni','dhoni@gmail.com','pass2222','9766778899','17 king street,Trichy');
insert into Users values (3,'vijay','vijay@gmail.com','pass3333','9944556677','1 temple street,Trichy');

select *from Users;

--Courier table

create table Courier ( CourierID int primary key , SenderName varchar(255),SenderAddress text , ReceiverName varchar(255),ReceiverAddress text , 
Weight decimal(5,2),Status varchar(50),TrackingNumber varchar(20) unique, DeliveryDate date); 

insert into Courier values ( 001, 'virat','7 lion street,madurai','Anu','12 mainroad,Chennai',2.5,'delivered','TRK001','2025-01-01');
insert into Courier values ( 002, 'dhoni','17 king street,Trichy','sakshi','2 vikasa road,vellore',3.5,'delivered','TRK002','2025-03-07');
insert into Courier values ( 003, 'vijay','1 temple street,Trichy','mithra','4 mainroad,cuddalore',2.5,'transported','TRK003','2025-01-06');

select *from Courier

--courier services

create table CourierServices (  ServiceID int primary key , ServiceName varchar(100),Cost decimal(8,2));

insert into CourierServices values (1,'local',100.00);
insert into CourierServices values (2,'local',60.00);
insert into CourierServices values (3,'local',95.00);

select *from CourierServices;

--Employee table

create table EmployeeTable (EmployeeID int primary key , Name varchar(255),Email varchar(255) unique,ContactNumber varchar(20),Role varchar(50), Salary decimal(10,2));

insert into EmployeeTable values ( 111 , 'rajesh','rajesh@gmail.com','9133553377','delivery agent',3000.00);
insert into EmployeeTable values ( 112 , 'kumar','kumar@gmail.com','9136653377','support',2000.00);
insert into EmployeeTable values ( 113 , 'rahul','rahul@gmail.com','9133559787','delivery agent',3000.00);

select *from EmployeeTable;

--LOcation table

create table Location( LocationID int primary key, LocationName varchar(100), Address Text);

insert into Location values(1,'Madurai','7 lion street,madurai');

insert into Location values(2,'Trichy','17 king street,Trichy');
insert into Location values(3,'vellore','2 vikasa road,vellore');

select *from Location ;

--payment table
 create table Payment( PaymentID int primary key , CourierID int ,LocationID int , Amount decimal(10,2),PaymentDate date, 
 constraint FK_CID foreign key (CourierID) references Courier (CourierID)on delete cascade ,constraint FK_LID foreign key (LocationID) references Location(LocationID)on delete set null);

insert into Payment values(1, 001,1, 100.00, '2025-01-01');
insert into Payment values(2, 002,2,200.00, '2025-03-07');

select *from Payment;

