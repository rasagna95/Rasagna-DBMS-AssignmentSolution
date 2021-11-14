1) You are required to create two tables PASSENGER and PRICE with the following
attributes and properties :

create table PASSENGER(Passenger_name varchar(255), Category varchar(255), Gender varchar(255), Boarding_City varchar(255),Destination_City varchar(255),Distance int,Bus_Type varchar(255));

create table PRICE(Bus_Type varchar(255), Distance int, Price int);

--------------------------------------------------------------------------------------------------
2) Insert the following data in the tables

insert into `PASSENGER` values("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
insert into `PASSENGER` values("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into `PASSENGER` values("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
insert into `PASSENGER` values("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into `PASSENGER` values("Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper");
insert into `PASSENGER` values("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into `PASSENGER` values("Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper");
insert into `PASSENGER` values("Manish","Non-AC","match","Hyderabad","Bengaluru",500,"Sitting");
insert into `PASSENGER` values("Piyush","AC","M","Pune","Nagpur",700,"Sitting");


insert into `PRICE` values("Sleeper",350,770);
insert into `PRICE` values("Sleeper",500,1100);
insert into `PRICE` values("Sleeper",600,1320);
insert into `PRICE` values("Sleeper",700,1540);
insert into `PRICE` values("Sleeper",1000,2200);
insert into `PRICE` values("Sleeper",1200,2640);
insert into `PRICE` values("Sleeper",1500,3300);
insert into `PRICE` values("Sitting",350,434);
insert into `PRICE` values("Sitting",500,620);
insert into `PRICE` values("Sitting",600,744);
insert into `PRICE` values("Sitting",700,868);
insert into `PRICE` values("Sitting",1000,1240);
insert into `PRICE` values("Sitting",1200,1488);
insert into `PRICE` values("Sitting",1500,1860);

-------------------------------------------------------------------------------------------------
3) How many females and how many male passengers travelled for a minimum distance of
600 KM s?

select distinct(Gender),count(Gender) from PASSENGER where Distance >= 600 group by Gender;

-------------------------------------------------------------------------------------------------
4) Find the minimum ticket price for Sleeper Bus.

select min(Price) from PRICE where Bus_Type='Sleeper';

-------------------------------------------------------------------------------------------------
5) Select passenger names whose names start with character 'S'

select Passenger_name from PASSENGER where Passenger_name like 'S%';

-------------------------------------------------------------------------------------------------
6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
Destination City, Bus_Type, Price in the output


select a.select,a.Boarding_City,a.Destination_City,a.Bus_Type,b.Price from PASSENGER a,PRICE b where a.Distance=b.Distance
and a.Bus_Type=b.Bus_Type;

------------------------------------------------------------------------------------------------
7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a
distance of 1000 KM s

select a.Passenger_name,b.Price from PASSENGER a,PRICE b where a.Distance=b.Distance
and a.Bus_Type=b.Bus_Type and a.Distance=1000;


------------------------------------------------------------------------------------------------
8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
Panaji?
select Bus_Type,Price from PRICE where Distance=600;

------------------------------------------------------------------------------------------------

9) List the distances from the "Passenger" table which are unique (non-repeated
distances) in descending order.

select distinct(Distance) from PASSENGER order by Distance desc;

------------------------------------------------------------------------------------------------
10) Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables

select Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) FROM PASSENGER) FROM PASSENGER;
------------------------------------------------------------------------------------------------
11) Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise


select Distance
    , Price, Bus_Type
    , case when Price >= 1000 then 'Expensive'
    when Price < 1000 and Price >=500 THEN 'Average Cost'
    ELSE 'Cheap otherwise' end as Category
from PRICE
