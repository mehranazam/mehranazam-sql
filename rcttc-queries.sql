use rcttc;

select 
sh.show_date,
p.play_name
from showings sh
inner join plays p on p.play_id = sh.play_id
where show_date between '2021-10-01' and '2021-12-31';

select distinct
customer_first,
customer_last
from customers;

select distinct
customer_first,
customer_last,
customer_email
from customers
where customer_email not like '%.com';

select
t.ticket_price,
p.play_name,
sh.show_date
from tickets t
inner join showings sh on sh.show_id = t.show_id
inner join plays p on p.play_id = sh.play_id
order by t.ticket_price asc
limit 3;

select distinct
c.customer_first,
c.customer_last,
p.play_name,
sh.show_date
from customers c
inner join tickets t on t.customer_id = c.customer_id
inner join showings sh on sh.show_id = t.show_id
inner join plays p on p.play_id = sh.play_id;

select
c.customer_first,
c.customer_last,
p.play_name,
sh.show_date,
t.seat_num,
th.theater_name
from customers c
inner join tickets t on t.customer_id = c.customer_id
inner join showings sh on sh.show_id = t.show_id
inner join plays p on p.play_id = sh.play_id
inner join theaters th on th.theater_id = sh.theater_id;

select
customer_first,
customer_last
from customers
where customer_address = '';

select
c.customer_first,
c.customer_last,
c.customer_email,
c.customer_phone,
c.customer_address,
t.seat_num,
p.play_name,
t.ticket_price,
sh.show_date,
th.theater_name,
th.theater_address,
th.theater_phone,
th.theater_email
from customers c
inner join tickets t on t.customer_id = c.customer_id
inner join showings sh on sh.show_id = t.show_id
inner join plays p on p.play_id = sh.play_id
inner join theaters th on th.theater_id = sh.theater_id;

