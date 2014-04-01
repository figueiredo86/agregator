drop database if exists sincronismo;

create database sincronismo;

use sincronismo;

drop table if exists company;
create table company (
 id int(10) not null auto_increment,
 name varchar(100) not null,
 addr varchar(100) not null,
 tel int(10) not null,
 email varchar(100) not null,
 contact varchar(100) not null,
 product_id int (10) not null,
 bind_addr varchar(100) not null,
 primary key (id),
 unique (bind_addr)
);

drop table if exists product;
create table product (
 id int(10) not null auto_increment,
 name varchar(100),
 contract boolean default "1" not null,
 primary key (id),
 unique (contract),
 unique (name)
);

drop table if exists ip_phone;
create table ip_phone (
 id int(10) not null auto_increment,
 tel_id int(10) not null,
 company_id int(10) not null,
 mac_addr varchar(100) not null,
 available boolean default "1" not null,
 exten int(10) default null,
 primary key (id),
 unique (mac_addr)
);

drop table if exists user_exten;
create table user_exten (
 id int(10) not null auto_increment,
 username varchar(100) not null,
 exten int(20) not null,
 password varchar(100) not null,
 email varchar(100) not null,
 company_id int(10) not null,
 mac_addr varchar(100) not null,
 accountcode int(10) not null,
 callgroup int(10) not null default "1",
 pickupgroup int(10) not null default "1",
 callerid varchar(100) not null,
 context varchar(100) not null default "classe2",
 host varchar(100) not null default "dynamic",
 nat varchar(10) not null default "no",
 port int(10) not null default "5060",
 exten_type varchar(100) not null default "friend",
 qualify varchar(10) not null default "yes",
 allowtransfer varchar(10) not null default "yes",
 call_limit int(10) not null default "2",
 deny varchar(100) not null default "0.0.0.0/0.0.0.0",
 permit varchar(100) not null default "0.0.0.0/0.0.0.0",
 primary key (id),
 unique (exten),
 unique (mac_addr)
);

drop table if exists device;
create table device (
 id int(10) not null auto_increment, 
 manufactor varchar(100) not null,
 name varchar(100) not null,
 model varchar(100) not null,
 available boolean default "1" not null,
 primary key (id),
 unique (model)
);

drop table if exists queue;
create table queue (
 id int(10) not null auto_increment,
 name varchar(100) not null,
 company_id int(10) not null default "0",
 announce varchar(100) not null default "60",
 joinempty varchar(10) not null default "yes",
 leavewhenempty varchar(10) not null default "yes",
 musicclass varchar(100) not null default "default",
 strategy varchar(100) not null default "rrmemory",
 primary key (id),
);

alter table company
 add constraint fk_company_product_id
 foreign key (product_id)
 references product (id);

alter table user_exten
 add constraint fk_user_exten_company_id
 foreign key (company_id)
 references company (id);

alter table user_exten
 add constraint fk_user_exten_mac_addr
 foreign key (mac_addr)
 references ip_phone (mac_addr);

alter table ip_phone
 add constraint fk_ip_phone_tel_id
 foreign key (tel_id)
 references device (id);

alter table device 
 add constraint fk_device_available
 foreign key (available) 
 references ip_phone (available);

alter table queue
 add constraint fk_queue_company_ud
 foreign key (company_id)
 references company (id);

insert into company values (
 '',
 'sincronismo',
 'Rua Tacito de Almdeida,196',
 1133235550,
 'sincronismo@sincronismo',
 'Fuleco',
 1,
 '192.168.0.80'
);

insert into device values (
 '',
 'Yealink',
 'Yealink',
 'T19P',
 1 
);

insert into ip_phone values (
 '',
 1,
 '',
 '0015655f35c0',
 1,
 null
);

insert into ip_phone values (
 '',
 1,
 '',
 '0015655f35c1',
 1,
 null
);

insert into ip_phone values (
 '',
 1,
 '',
 '0015655f35c9',
 1,
 null
);

insert into ip_phone values (
 '',
 1,
 '',
 '0015655f35c5',
 1,
 null
);

insert into product values (
 '',
 'Pabx Fisico',
 1
);
