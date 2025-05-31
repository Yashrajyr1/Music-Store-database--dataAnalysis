-- who is the senior most employee based on job title

select * from employee
order by levels desc
limit 1


--Which country have the most invoices

select billing_country, count(billing_country) as c
from invoice
group by billing_country
order by c desc
limit 1


--what are top 3 values of total invoice

select customer_id, total
from invoice
order by total desc 
limit 3


-- Which city with highest sum of invoice

select billing_city, sum(total) as s
from invoice
group by billing_city
order by s desc
limit 1


-- which customer spent most money

select i.customer_id, c.first_name, c.last_name, sum(i.total) as s
from invoice as i 
join customer as c on i.customer_id=c.customer_id
group by i.customer_id, c.first_name, c.last_name
order by s desc
limit 1


--email, fisrt , last name, genre of all rock music listeners, order by email alphabetically 

select --g.genre_id, g.name, t.track_id, il.invoice_id, i.customer_id,
distinct c.email, c.first_name, c.last_name
from track as t
join genre as g on t.genre_id=g.genre_id
join invoice_line as il on t.track_id=il.track_id
join invoice as i on il.invoice_id=i.invoice_id
join customer as c on i.customer_id=c.customer_id
where g.name like 'Rock'
order by email 


--artist_name and total track count of the top 10 rock bands

select al.artist_id, ar.name, count(track_id) as c
from track as t
join genre as g on t.genre_id=g.genre_id
join album as al on t.album_id=al.album_id
join artist as ar on al.artist_id=ar.artist_id
where g.name like 'Rock'
group by al.artist_id, ar.name
order by c desc
limit 10


--track names and length in milliseconds for the songs with length longer than avg length, order by song length desc

select name , milliseconds
from track 
where milliseconds>( select avg(milliseconds) from track)
order by milliseconds desc


--amount spent by each customer on artist, return customer name , artist name and total spent

WITH most_popular_genre AS 
(
    SELECT COUNT(il.quantity) AS purchases, c.country, g.name, g.genre_id, 
	ROW_NUMBER() OVER(PARTITION BY c.country ORDER BY COUNT(il.quantity) DESC) as RowNo 
    FROM invoice_line as il
	JOIN invoice as i ON i.invoice_id = il.invoice_id
	JOIN customer as c ON c.customer_id = i.customer_id
	JOIN track as t ON t.track_id = il.track_id
	JOIN genre as g ON g.genre_id = t.genre_id
	GROUP BY 2,3,4
	ORDER BY 2 ASC, 1 DESC
)
SELECT * FROM most_popular_genre WHERE RowNo <= 1


--genre with highest amount of purchase, each country along with top genre, if max purchase equal for any country , return all

select i.billing_country,g.name, sum(il.quantity) as amount_of_purchase
from invoice_line as il 
join track as t on il.track_id = t.track_id
join invoice as i on il.invoice_id=i.invoice_id
join genre as g on t.genre_id=g.genre_id
group by 1,2
order by 1


--customer who spent most on music for each country

With rank as (
With spent as 
(select i.billing_country, c.first_name, sum(il.unit_price*il.quantity) as total_spent
from invoice as i 
join customer as c on i.customer_id=c.customer_id
join invoice_line as il on il.invoice_id=i.invoice_id
group by i.billing_country, c.first_name
)
select spent.billing_country, spent.first_name, total_spent, 
rank() over (partition by billing_country order by total_spent desc) as ranks
from spent
)
select rank.billing_country, rank.first_name, total_spent, ranks
from rank
where ranks=1


