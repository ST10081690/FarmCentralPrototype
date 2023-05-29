create table [USER_TYPE](
ut_id int not null identity (1,1) primary key,
u_type varchar (200) not null
);

insert into [USER_TYPE] values
('Employee'),
('Farmer');


create table [USER] (
u_id int not null identity (1,1) primary key,
username varchar(150) not null,
u_name varchar(200) not null,
u_surname varchar(200) not null,
u_password varchar(250) not null,
ut_id int not null,

constraint fk_userType foreign key (ut_id) references [USER_TYPE](ut_id)

);


insert into [USER] values
('fc_emp01', 'Marcus', 'Cameron', 'farmCentral4L', 1),
('fc_emp02', 'Thomas', 'Jenkins', 'St0ckin9', 1),
('fc_farmer01', 'Andrew', 'Peter', 'FieldCrops10', 2);


create table [PRODUCT_TYPE] (
pt_id int not null identity (1,1) primary key,
p_type varchar (150) not null
);

insert into [PRODUCT_TYPE] values
('Livestock'),
('Fruit'),
('Vegetable');


create table [PRODUCT] (
p_id int not null identity (1,1) primary key,
p_name varchar (200) not null,
p_price varchar (MAX) not null,
quantity int not null,
date_added varchar (11) not null,
u_id int not null,
pt_id int not null,

constraint fk_userID foreign key (u_id) references [USER](u_id),
constraint fk_productType foreign key (pt_id) references [PRODUCT_TYPE](pt_id)

);

SELECT * FROM [PRODUCT];
SELECT * FROM [USER];