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
-- 			is there a direct relationship at all? 					yes
-- 			can a ticket be associated with multiple theaters?		no
-- 			can a theater be associated with multiple tickets?		yes

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

show_date date not null





);



create table tickets(

ticket_id int primary key auto_increment,

ticket_price decimal (4, 2) not null,

seat_num char(2) not null





);



create table customers_tickets(

customer_id int,

ticket_id int,

constraint pk_customer_ticket primary key (customer_id, ticket_id),

constraint fk_customer_customer_ticket foreign key(customer_id) references customers(customer_id),

constraint fk_ticket_customer_ticket foreign key(ticket_id) references tickets(ticket_id)

);


create table theaters_tickets(

theater_id int,

ticket_id int,

constraint pk_theater_ticket primary key (theater_id, ticket_id),

constraint fk_theater_theater_ticket foreign key(theater_id) references theaters(theater_id),

constraint fk_ticket_theater_ticket foreign key(ticket_id) references tickets(ticket_id)

);



create table theaters_showings(

theater_id int,

show_id int,

constraint pk_theater_showing primary key(theater_id, show_id),

constraint fk_theater_theater_showing foreign key(theater_id) references theaters(theater_id),

constraint fk_showing_theater_showing foreign key(show_id) references showings(show_id)

);


create table plays_showings(


play_id int,

show_id int,

constraint pk_play_showing primary key(play_id, show_id),

constraint fk_play_play_showing foreign key(play_id) references plays(play_id),

constraint fk_showing_play_showing foreign key(show_id) references showings(show_id)

);

create table tickets_showings(

ticket_id int,

show_id int,

constraint pk_ticket_showing primary key(ticket_id, show_id),

constraint fk_ticket_ticket_showing foreign key(ticket_id) references tickets(ticket_id),

constraint fk_showing_ticket_showing foreign key(show_id) references showings(show_id)

);