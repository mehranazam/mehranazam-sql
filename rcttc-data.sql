use rcttc;


insert into customers(customer_first, customer_last, customer_email, customer_phone, customer_address)
select distinct 
customer_first, 
customer_last, 
customer_email, 
customer_phone, 
customer_address
from `rcttc-data`;



select * from customers;


insert into theaters(theater_name, theater_address, theater_email, theater_phone)
select distinct
theater,
theater_address,
theater_email,
theater_phone
from `rcttc-data`;

select * from theaters;


insert into plays(play_name)
select distinct `show`
from `rcttc-data`;

select * from plays;


insert into showings(theater_id, play_id, show_date)
select distinct
th.theater_id,
p.play_id,
rd.`date`
from `rcttc-data` rd
inner join theaters th on rd.theater = th.theater_name
inner join plays p on rd.`show` = p.play_name;

select * from showings;



insert into tickets(customer_id, show_id, ticket_price, seat_num)
select distinct
c.customer_id,
sh.show_id,
rd.ticket_price,
rd.seat
from `rcttc-data` rd
inner join customers c on rd.customer_first = c.customer_first
inner join showings sh on rd.`date` = sh.show_date;

select * from tickets;



select distinct
sh.show_id,
c.customer_id,
th.theater_name,
p.play_name,
sh.show_date,
c.customer_first,
c.customer_last,
t.seat_num
from customers c
inner join tickets t on t.customer_id = c.customer_id
inner join showings sh on sh.show_id = t.show_id
inner join plays p on p.play_id = sh.play_id
inner join theaters th on th.theater_id = sh.theater_id
where (c.customer_first = 'Pooh' or c.customer_first = 'Cullen' or
c.customer_last = 'Bedburrow' or c.customer_last = 'Guirau');



update tickets set
ticket_price = 22.25
where show_id = 5;

update tickets set
seat_num = 'B4'
where show_id = 5
and customer_id = 37;

update tickets set
seat_num = 'C2'
where show_id = 5
and customer_id = 38;


update customers set
customer_phone = '1-801-EAT-CAKE'
where customer_last = 'Swindles';

select
c.customer_id
from customers c
inner join tickets t on t.customer_id = c.customer_id
inner join showings sh on sh.show_id = t.show_id
inner join theaters th on th.theater_id = sh.theater_id
where th.theater_name = '10 Pin';

delete from tickets
where customer_id = 7 or
customer_id = 30 or
customer_id = 35 or
customer_id = 39 or
customer_id = 55 or
customer_id = 8 or
customer_id = 10 or
customer_id = 43 or
customer_id = 45 or
customer_id = 46 or
customer_id = 18 or
customer_id = 19 or
customer_id = 25 or
customer_id = 67 or
customer_id = 69 or
customer_id = 44 or
customer_id = 52 or
customer_id = 74;



delete from tickets
where ticket_id between 532 and 537;





delete from customers
where customer_id = 65;


