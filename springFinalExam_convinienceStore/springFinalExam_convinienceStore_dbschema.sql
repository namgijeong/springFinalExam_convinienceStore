create database conviniencestore character set=utf8;
use conviniencestore;
/*
컬럼 타입이 DATE 라면 current_date 를 사용해야 현재 날짜를 default 값으로 지정할 수 있다.

컬럼 타입이 DATETIME 이라면 current_time과 current_timestamp, now() 모두 사용 가능하다
*/
create table tbl_member(
	primary_id int auto_increment primary key,
    member_id varchar(100) not null unique key,
    member_type int not null default 1,
    member_active int not null default 1,
    name varchar(100),
    password varchar(100) not null
    
)engine=InnoDB character set=utf8;

create table define_inventory_code(
	inventory_code int not null primary key,
    inventory_name  varchar(100) not null unique key,
    price int not null,
    image_url varchar(150)
)engine=InnoDB character set=utf8;

create table tbl_inventory(
	primary_id int auto_increment primary key,
    inventory_code int not null ,
    constraint point_inventorycode foreign key  (inventory_code) references define_inventory_code(inventory_code) on update cascade on delete cascade,
    come_in_date  date ,
    out_in_date date ,
    count int not null
)engine=InnoDB character set=utf8;

create table tbl_sales_list(
	primary_id int auto_increment primary key,
    member_id varchar(100) not null,
    constraint point_memberid foreign key (member_id) references tbl_member(member_id) on update cascade on delete cascade,
    inventory_code int not null ,
    constraint point_inventorycode2 foreign key  (inventory_code) references define_inventory_code(inventory_code) on update cascade on delete cascade,
    sales_date date default(current_date),
    count int not null
)engine=InnoDB character set=utf8;

insert into tbl_member(member_id, member_type, member_active,name,password) values('kjnam',0,1,'남기정','kj2023!');
select * from tbl_member;
insert into tbl_member(member_id, member_type, member_active,name,password) values('mkmin',1,1,'민미경','mk2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('kcy',1,1,'김치용','kc2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('gyryu',1,1,'류귀열','gyr2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('swyoo',1,1,'류석원','swy2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('jkrho',1,1,'노정규','jkr2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('cosmos',1,1,'장문수','cos2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('wcshin',1,1,'신우창','wcs2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('sskim03',1,1,'김성석','ssk2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('j.ann.lee',1,1,'이지영','j.an2023!');