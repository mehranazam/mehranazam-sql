use rcttc;


insert into customers(customer_first, customer_last, customer_email, customer_phone, customer_address)
select distinct 
customer_first, 
customer_last, 
customer_email, 
customer_phone, 
customer_address
from `rcttc-data`;






insert into theaters(theater_name, theater_address, theater_email, theater_phone)
select distinct
theater,
theater_address,
theater_email,
theater_phone
from `rcttc-data`;




insert into plays(play_name)
select distinct `show`
from `rcttc-data`;




insert into showings(theater_id, play_id, show_date)
select distinct
th.theater_id,
p.play_id,
rd.`date`
from `rcttc-data` rd
inner join theaters th on rd.theater = th.theater_name
inner join plays p on rd.`show` = p.play_name;





insert into tickets(customer_id, show_id, ticket_price, seat_num)
select distinct
c.customer_id,
sh.show_id,
rd.ticket_price,
rd.seat
from `rcttc-data` rd
inner join customers c on rd.customer_email = c.customer_email
inner join theaters th on th.theater_name = rd.theater
inner join showings sh on rd.`date` = sh.show_date and th.theater_id = sh.theater_id;





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


select * 
from tickets t
inner join customers c on c.customer_id = t.customer_id
where show_id = 5;


update tickets set
seat_num = 'B4'
where ticket_id = 98;

update tickets set
seat_num = 'C2'
where ticket_id = 100;

update tickets set
seat_num = 'A4'
where ticket_id = 101;


update customers set
customer_phone = '1-801-EAT-CAKE'
where customer_last = 'Swindles';

select
c.customer_id,
c.customer_first,
c.customer_last
from customers c
inner join tickets t on t.customer_id = c.customer_id
inner join showings sh on sh.show_id = t.show_id
inner join theaters th on th.theater_id = sh.theater_id
where th.theater_name = '10 Pin'
order by c.customer_id asc;






select ticket_id from
(
select
count(*),
sh.show_id,
c.customer_id
from tickets t
inner join showings sh on t.show_id = sh.show_id
inner join customers c on c.customer_id = t.customer_id
inner join theaters th on th.theater_id = sh.theater_id
where th.theater_name = '10 Pin'
group by sh.show_id, c.customer_id
having count(*) = 1
) as single_res
inner join tickets t on t.show_id = single_res.show_id 
and t.customer_id = single_res.customer_id
;



delete from tickets
where ticket_id in (25, 26, 29, 41, 50, 51, 59, 67, 68);



select *
from customers
where customer_last = 'Egle of Germany';



delete from tickets
where customer_id = 65;


delete from customers
where customer_id = 65;


