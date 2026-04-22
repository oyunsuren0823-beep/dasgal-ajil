--Dasgal ajil 01
SELECT
customername, country, productname, sales, orderpriority
FROM public.superstore;

--Dasgal 02
SELECT*
FROM public.superstore
Limit 10;

--Dasgal 03
Select*
From public.superstore
Where Country= 'Australia';

--Dasgal 04
Select*
From public.superstore
Where customername like 'M%';

--Dasgal 05
Select*
From public.superstore
Where customername like '_n%';

--Dasgal 06
Select*
From public.superstore
Where subcategory IN('Phones','Bookcases');

--Dasgal 07
Select*
From public.superstore
Where quantity between 1 and 3;

--Dasgal 08
Select*
From public.superstore
where country='Mexico'
and subcategory='Phones';

--Dasgal 09
Select*
from public.superstore
Where segment= 'Corporate' or country='Turkey';

--Dasgal 10
Select*
from public.superstore
where quantity >3;

--Dasgal 11
Select Count(*)
from public.superstore
where country='Germany';

--Dasgal 12
Select SUM(Sales)
from public.superstore
where country= 'Germany' and category='Technology';

--Dasgal 13
Select Max(sales)
From public.superstore;

--Dasgal 14
Select Min(Sales)
from public.superstore;

--Dasgal 15
Select Avg(Sales)
from public.superstore;

--Dasgal 16
Select superstore.customername, sum(Sales)
from public.superstore
Group by customername;

--Dasgal 17
select customername, sum(sales), count(sales)
from public.superstore
Where orderdate between '2012-07-31' and '2013-07-31'
and country='Brazil'
and subcategory='Bookcases'
and postalcode is null
group by customername;

--Dasgal 02-1
Select orderdate,sum(sales)
from public.superstore
group by orderdate;

--Dasgal 02-2
select country, sum(sales)
from public.superstore
group by country;

--Dasgal 02-3
Select sum(quantity)
from public.superstore
where lower(orderpriority)='high';

--Dasgal 02-4
Select Orderpriority,avg(sales)
from public.superstore
group by Orderpriority;

--Dasgal 02-5
Select sum(discount)
from public.superstore
where country in ('United States', 'China');

--Dasgal 02-6
Select subcategory, sum(Sales)
from public.superstore
where orderdate between '2014-12-01' and '2014-12-31'
and subcategory='Chairs'
group by subcategory;

--Dasgal 02-7
Select country, subcategory,Max(sales)
From public.superstore
where country='China'
and subcategory='Phones'
group by country,subcategory;

--Dasgal 02-8
Select segment, productname, sum(quantity)
from public.superstore
where segment='Corporate' and productname='Samsung Smart Phone, Cordless'
Group by segment, productname;


--Dasgal 02-9
Select sum(sales), sum(quantity), sum(discount)
from public.superstore
where  orderdate between '2013-1-1' and '2013-6-30'
and country='China'
and orderpriority='Medium'
and subcategory='Phones'
group by customername;

--Dasgal 03-1
Select distinct market
from public.superstore;

--Dasgal 03-2
Select distinct CustomerName
from public.superstore;

--Dasgal 03-3
Select Productname,Quantity, 
case when quantity > 10 then 'Good'
when quantity < 10 then 'Bad' 
else 'Normal'
end as Angilal
from public.superstore;

--Dasgal 03-4
Select productname, quantity,
case when quantity < 5 then 'Really bad'
when quantity > 5 and quantity < 10 then 'Average'
when quantity > 10 then 'Really good'
else 'Normal'
end as Angilal
from public.superstore;

--Dasgal 03-5
Select UPPER(City) AS City_Uppercase
from public.superstore;

--Dasgal 03-6
Select lower(Country) as Country_lowercase
from public.superstore;

--Dasgal 03-7
CREATE TABLE public.superstore_2013_11 AS
SELECT *
FROM public.superstore
WHERE Orderdate >= DATE '2013-11-01'
AND Orderdate < DATE '2013-12-01';

--Dasgal 03-8
select *
from public.superstore a 
left join customer b on a.customername=b.person;

--Dasgal 03-9
select *
from public.superstore a 
inner join customer b on a.customername=b.person;

--Dasgal 03-10
SELECT b.person, SUM(a.sales) AS total_sales
FROM public.superstore a
INNER JOIN customer b 
ON a.customername = b.person
GROUP BY b.person;

--Dasgal 03-11
SELECT b.person, SUM(a.sales) AS total_sales
FROM customer b
LEFT JOIN public.superstore a
ON a.customername = b.person
GROUP BY b.person;

--Dasgal 03-12
SELECT b.person, SUM(a.sales) AS total_sales
FROM customer b
LEFT JOIN public.superstore a
ON a.customername = b.person
GROUP BY b.person
Order by total_sales Desc;

--Dasgal 03-13
SELECT SUM(a.sales) / COUNT(DISTINCT b.person) AS avg_sales_per_customer
FROM customer b
LEFT JOIN public.superstore a
ON a.customername = b.person;

--Dasgal 03-14
SELECT productname,MAX(sales) AS max_sales
FROM public.superstore
GROUP BY productname
Order by max_sales DESC;

--Dasgal 03-15
Create table public.sales_condition as 
SELECT b.person, SUM(a.sales) AS total_sales,
CASE WHEN SUM(a.sales) < 10000 THEN 'Bad'
WHEN SUM(a.sales) >= 10000 AND SUM(a.sales) < 15000 THEN 'Average'
WHEN SUM(a.sales) >= 15000 THEN 'Good'
END AS sales_condition
FROM public.superstore a
INNER JOIN customer b 
ON a.customername = b.person
GROUP BY b.person;

--Dasgal 3-16
SELECT Subcategory,MAX(Quantity) AS max_quantity,MIN(Quantity) AS min_quantity,ROUND(AVG(Quantity), 2) AS avg_quantity
FROM public.superstore
WHERE Region = 'East' AND State = 'New York'
GROUP BY Subcategory
Order by avg_quantity DESC;

--Dasgal 4-1
SELECT PRODUCTNAME, COUNT(CUSTOMERNAME) as customer, SUM(SALES) as total_sales
FROM public.superstore
WHERE Productname = 'Panasonic Printer, Red'
Group by productname;

--Dasgal 4-2
Select ProductName, MIN(discount) as min_discount, MAX(discount) as max_discount
from public.superstore
Group by productname
Order by max_discount DESC;

--Dasgal 4-3
WITH ProductPrices AS (SELECT ProductName,AVG(Sales / NULLIF(Quantity, 0)) AS unit_price
FROM public.superstore
GROUP BY ProductName)
SELECT ROUND(AVG(unit_price), 2) AS overall_average_price
FROM ProductPrices;

--Dasgal 4-4
CREATE TABLE public.china_sales AS
SELECT ProductName,SUM(Sales) AS total_sales,ROUND(AVG(Sales), 2) AS avg_sales
FROM public.superstore
WHERE Country = 'China' 
  AND Segment = 'Corporate' 
  AND Category = 'Furniture'
  AND EXTRACT(YEAR FROM OrderDate) = 2012
  AND EXTRACT(MONTH FROM OrderDate) = 1
GROUP BY ProductName;