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


--track names and length in milliseconds for the songs with length longer than avg length, order by song lenth desc

select name , milliseconds
from track 
where milliseconds>( select avg(milliseconds) from track)
order by milliseconds desc


