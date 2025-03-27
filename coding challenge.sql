
--Provide a SQL script that initializes the database for the Pet Adoption Platform ”PetPals”.

create database Pets

--Create tables for pets, shelters, donations, adoption events, and participants.
--Define appropriate primary keys, foreign keys, and constraints.
--Ensure the script handles potential errors, such as if the database or tables already exist.

create table pets ( petID int primary key , name varchar(20), age int, breed varchar(20), 
type varchar(20) , available_for_adoptation bit );

 
insert into pets values (1, 'jimmy' , 3 , 'labrador', 'dog', 1);
insert into pets values (2, 'friday' , 1, 'golden retriver', 'dog', 1);
insert into pets values (3, 'edith' , 2, 'labrador', 'dog', 0);
insert into pets values (4, 'thor' , 1 , 'german shepard', 'dog', 1);
insert into pets values (5, 'wolverine' , 3 , 'bull dog', 'dog', 1);
insert into pets values (6, 'falcon' , 2 , 'labrador', 'dog', 0);
insert into pets values (7, 'nepula' , 1 , 'persian', 'cat', 1);
insert into pets values (8, 'gamora' , 1 , 'persian', 'cat', 0);
insert into pets values (9, 'pepper' , 3 , 'golden retriver', 'dog', 1);
insert into pets values (10, 'roggers' , 2 , 'german shepard', 'dog', 1);


alter table pets add ownerID int;

update pets set ownerID=1 where petID=1;
update pets set ownerID=2 where petID=2;
update pets set ownerID=3 where petID=3;
update pets set ownerID=null where petID=4;
update pets set  ownerID=null where petID=5;
update pets set ownerID=6 where petID=6;
update pets set ownerID=null where petID=7;
update pets set ownerID=8 where petID=8;
update pets set ownerID=9 where petID=9;
update pets set ownerID=10 where petID=10;

alter table pets add shelterID int
alter table pets add constraint SID_FK foreign key (shelterID) references shelter(shelterID) on delete set null ;

update pets set shelterID=1 where petID=1;
update pets set shelterID=2 where petID=2;
update pets set shelterID=3 where petID=3;
update pets set shelterID=4 where petID=4;
update pets set shelterID=5 where petID=5;
update pets set shelterID=6 where petID=6;
update pets set shelterID=7 where petID=7;
update pets set shelterID=8 where petID=8;
update pets set shelterID=9 where petID=9;
update pets set shelterID=10 where petID=10;

select *from pets

alter table pets add adopterID int null;

update pets set adopterID=1  where petID=3;
update pets set adopterID=3 where petID=6;
update pets set adopterID=6 where petID=8;

create table shelter (shelterID int primary key , name varchar(20) , Location varchar(20));

insert into shelter values (1,'paws','chennai');
insert into shelter values (2,'cat hub','madurai');
insert into shelter values (3,'meow place','chennai');
insert into shelter values (4,'bow bow','coimbatore');
insert into shelter values (5,'love ','madurai');
insert into shelter values (6,'paws hub','trichy');
insert into shelter values (7,'cat heaven','tuticorin');
insert into shelter values (8,'angel pets','chennai');
insert into shelter values (9,'animal area','coimbatore');
insert into shelter values (10,'paw kingdom','chennai');

select *from shelter

create table donations (donationID int primary key , donor_name varchar(20),donation_type varchar(20),donation_amount decimal(10,2), donation_item varchar(20) ,donation_date datetime);

insert into donations values ( 1,'yash','money',2000.00, null , '2025-01-09 10:07:09'); 
insert into donations values ( 2,'ravi','food',0.00, 'dog food' , '2025-02-19 13:12:09');
insert into donations values ( 3,'arsath','money',1000.00, null , '2024-11-23 10:18:01');
insert into donations values ( 4,'resh','medicine',0.00, 'antibiotics' , '2025-01-09 03:17:09');
insert into donations values ( 5,'santhosh','toys',0.00, 'plastics' , '2025-01-07 10:07:19');
insert into donations values ( 6,'kumar','money',3000.00, null , '2025-03-04 10:09:13');
insert into donations values ( 7,'hari','food',0.00, 'dog food' , '2025-01-13 10:07:09');
insert into donations values ( 8,'abdul','medicine',0.00, 'syringes' , '2025-01-29 05:00:09');
insert into donations values ( 9,'gowtham','money',500.00,null,'2025-03-14 10:07:39.000');
insert into donations values  (10, 'priya','money',2500.00,null,'2025-02-06 11:17:47');
select *from donations


create table adoptationevents ( eventID int primary key , event_name varchar (20) , event_date datetime , location varchar(20));

insert into adoptationevents values ( 1,'adoptation','2025-01-29 05:00:09','chennai');
insert into adoptationevents values ( 2,'pet fair','2025-01-29 05:00:09','madurai')
insert into adoptationevents values ( 3,'pet home','2025-01-29 05:00:09','trichy')
insert into adoptationevents values ( 4,'love fair','2025-01-29 05:00:09','chennai')
insert into adoptationevents values ( 5,'hope','2025-01-29 05:00:09','cpimbatore')
insert into adoptationevents values ( 6,'pet fest','2025-01-29 05:00:09','madurai')
insert into adoptationevents values ( 7,'home','2025-01-29 05:00:09','chennai')
insert into adoptationevents values ( 8,'kings and queens','2025-01-29 05:00:09','madurai')
insert into adoptationevents values ( 9,'adopt','2025-01-29 05:00:09','trichy')
insert into adoptationevents values ( 10,'save me','2025-01-29 05:00:09','chennai')

select *from adoptationevents



create table participants ( participantID int primary key , participant_name varchar(20), participant_type varchar(20), eventID int , constraint EID_FK foreign key (eventID) references adoptationevents(eventID)on delete cascade);

insert into participants values (1,'mithra','donor',1);
insert into participants values (2,'ramesh','adopter',2);
insert into participants values (3,'sanjeev','donor',3);
insert into participants values (4,'reema','adopter',4);
insert into participants values (5,'shalini','donor',5);
insert into participants values (6,'mithun','adopter',6);
insert into participants values (7,'eswar','adopter',7);
insert into participants values (8,'parkavi','adopter',8);
insert into participants values (9,'kumar','adopter',9);
insert into participants values (10,'ramaa','donor',10);

select *from participants



create table adopters( adopterID int primary key , name varchar(20));

insert into adopters values ( 1,'ramesh');
insert into adopters values ( 2,'reema');
insert into adopters values ( 3,'mithun');
insert into adopters values ( 4,'eswar');
insert into adopters values ( 5,'parkavi');
insert into adopters values ( 6,'kumar');

select *from adopters



--5. Write an SQL query that retrieves a list of available pets (those marked as available for adoption)
--from the "Pets" table. Include the pet's name, age, breed, and type in the result set. Ensure that
--the query filters out pets that are not available for adoption

select name , age , breed , type from pets where available_for_adoptation=1;



--6. Write an SQL query that retrieves the names of participants (shelters and adopters) registered
--for a specific adoption event. Use a parameter to specify the event ID. Ensure that the query
--joins the necessary tables to retrieve the participant names and types.

select * from participants p 
join adoptationevents e on p.eventID=e.eventID
where e.eventID='2'

--7. Create a stored procedure in SQL that allows a shelter to update its information (name and
--location) in the "Shelters" table. Use parameters to pass the shelter ID and the new information.
--Ensure that the procedure performs the update and handles potential errors, such as an invalid
--shelter ID.

declare @shelterID int
declare @newname varchar(20)
declare @newlocation varchar(20)

 

if exists (select * from shelter where shelterID= @shelterID)
begin

   update name=@newname , loaction=@newlocation
   where shelterID=@shelterID
end 
else 

print 'invalid ID'




  

--8. Write an SQL query that calculates and retrieves the total donation amount for each shelter (by
--shelter name) from the "Donations" table. The result should include the shelter name and the
--total donation amount. Ensure that the query handles cases where a shelter has received no
--donations.

select s.name as sheltername , coalesce(sum(d.donation_amount),0) as totalamount from shelter s
join donations d on s.shelterID=d.donationID 
group by s.name;

--9. Write an SQL query that retrieves the names of pets from the "Pets" table that do not have an
--owner (i.e., where "OwnerID" is null). Include the pet's name, age, breed, and type in the result
--set.

select name ,age , breed ,type from pets where ownerID is null;



--10. Write an SQL query that retrieves the total donation amount for each month and year (e.g.,
--January 2023) from the "Donations" table. The result should include the month-year and the
--corresponding total donation amount. Ensure that the query handles cases where no donations
--were made in a specific month-year.

select  sum(donation_amount ) as total from donations d

order by total




--11. Retrieve a list of distinct breeds for all pets that are either aged between 1 and 3 years or older
--than 5 years.

select distinct breed from pets where age between 1 and 3 or age > 5;



--12. Retrieve a list of pets and their respective shelters where the pets are currently available for
--adoption.

select p.name , s.name from pets p
join shelter s on p.shelterID=s.shelterID
where available_for_adoptation=1;

--13. Find the total number of participants in events organized by shelters located in specific city.
--Example: City=Chennai

select count(p.participantID) as totalparticipants from participants p
join adoptationevents ae on ae.eventID = p.eventID
join shelter s on ae.location= s.Location
where s.Location='chennai'

--14. Retrieve a list of unique breeds for pets with ages between 1 and 5 years.

select distinct breed from pets where age between 1 and 5;

--15. Find the pets that have not been adopted by selecting their information from the 'Pet' table.

select *from pets where available_for_adoptation=1;


--16. Retrieve the names of all adopted pets along with the adopter's name from the 'Adoption' and
--'User' tables.

select p.name , a.name from pets p 
join adopters a on p.adopterID=a.adopterID where exists  (select * from pets where available_for_adoptation=0);

--17. Retrieve a list of all shelters along with the count of pets currently available for adoption in each
--shelter.

select s.name , count(p.petId) from shelter s
join pets p on s.shelterID= p.shelterID
where available_for_adoptation=1
group by s.name

18. Find pairs of pets from the same shelter that have the same breed.

select p1.name as pet1 , p2.name,s.name from pets p1
join pets p2 on p1.shelterID = p2.shelterID and p1.petID!=p2.petID
join shelter s on  p2.shelterID = s.shelterID
where p1.breed=p2.breed




19. List all possible combinations of shelters and adoption events.

select s.name , ae.event_name from shelter s
cross join adoptationevents ae

--20. Determine the shelter that has the highest number of adopted pets.

select top 1 with ties s.name , count(p.petID) as count from shelter s
join pets p on s.shelterID=p.shelterID
group by s.name
order by count desc