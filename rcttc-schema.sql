-- entities
-- 1. customers
-- 2. theaters
-- 3. plays
-- 4. tickets
-- 5. showings


-- consider pair-wise entity relationships

-- 1, 2
-- 			is there a direct relationship at all? 					no

-- 1, 3
-- 			is there a direct relationship at all? 					no

-- 1, 4
-- 			is there a direct relationship at all? 					yes
-- 			can a ticket be associated with multiple customers?		no
-- 			can a customer be associated with multiple tickets?		yes

-- 1, 5
-- 			is there a direct relationship at all? 					no

-- 2, 3
-- 			is there a direct relationship at all? 					no

-- 2, 4
-- 			is there a direct relationship at all? 					no

-- 2, 5
-- 			is there a direct relationship at all? 					yes
-- 			can a showing be associated with multiple theaters?		no
-- 			can a theater be associated with multiple showings?		yes

-- 3, 4
-- 			is there a direct relationship at all? 					no

-- 3, 5
-- 			is there a direct relationship at all? 					yes
-- 			can a showing be associated with multiple plays?		no
-- 			can a play be associated with multiple showings?		yes

-- 4, 5
-- 		    is there a direct relationship at all? 					yes
-- 			can a showing be associated with multiple tickets?		yes
-- 			can a ticket be associated with multiple showings?		no


drop database if exists rcttc;
create database rcttc;


use rcttc;


create table customers(

customer_id int primary key auto_increment,

customer_first char(50) not null,

customer_last char(50) not null,

customer_email char(50) not null,

customer_phone char(50),

customer_address char(50)

);


create table theaters(

theater_id int primary key auto_increment,

theater_name char(100) not null,

theater_phone char(100) not null,

theater_address char(100) not null,

theater_email char(100) not null

);




create table plays(

play_id int primary key auto_increment,


play_name char(50) not null

);


create table showings(

show_id int primary key auto_increment,

show_date date not null,

theater_id int not null,

play_id int not null,

constraint fk_showing_theater_id
foreign key(theater_id)
references theaters(theater_id),

constraint fk_showing_play_id
foreign key(play_id)
references plays(play_id)
);



create table tickets(

ticket_id int primary key auto_increment,

ticket_price decimal (4, 2) not null,

seat_num char(2) not null,

customer_id int not null,

show_id int not null,

constraint fk_ticket_customer_id
foreign key(customer_id)
references customers(customer_id),


constraint fk_ticket_show_id
foreign key(show_id)
references showings(show_id)

);


