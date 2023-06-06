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
select * from tbl_inventory;

select * from tbl_sales_list;

create table tbl_sales_list(
	primary_id int auto_increment primary key,
    member_id varchar(100) not null,
    constraint point_memberid foreign key (member_id) references tbl_member(member_id) on update cascade on delete cascade,
    inventory_code int not null ,
    constraint point_inventorycode2 foreign key  (inventory_code) references define_inventory_code(inventory_code) on update cascade on delete cascade,
    sales_date date default(current_date),
    count int not null
)engine=InnoDB character set=utf8;

select * 
			from tbl_sales_list as s inner join define_inventory_code as d
			on s.inventory_code=d.inventory_code;
            
select ifnull(sum(s.count),0) as count , inventory_name as product_category
			from tbl_sales_list as s inner join define_inventory_code as d
			on s.inventory_code=d.inventory_code
			group by s.inventory_code
			order by count desc , s.inventory_code asc
			limit 3;

insert into tbl_member(member_id, member_type, member_active,name,password) values('kjnam',0,1,'남기정','kj2023!');
select * from tbl_member;
insert into tbl_member(member_id, member_type, member_active,name,password) values('mkmin',1,1,'민미경','mk2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('kcy',1,1,'김치용','kc2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('gyryu',1,1,'류귀열','gyr2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('swyoo',1,1,'류석원','swy2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('jkrho',1,1,'노정규','jkr2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('cosmos',1,1,'장문수','cos2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('wcshin',1,1,'신우창','1234');
insert into tbl_member(member_id, member_type, member_active,name,password) values('sskim03',1,1,'김성석','ssk2023!');
insert into tbl_member(member_id, member_type, member_active,name,password) values('j.ann.lee',1,1,'이지영','j.an2023!');

update tbl_member
set password="1234"
where member_id="wcshin";
update tbl_member
set member_type=2
where member_id="kjnam";

insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(1001,'오뚜기)진라면매운컵',1300,'/resources/images/라면/오뚜기)진라면매운컵.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(1002,'농심)신라면큰사발컵',1400,'/resources/images/라면/농심)신라면큰사발컵.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(1003,'오뚜기)열라면컵',1300,'/resources/images/라면/오뚜기)열라면컵.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(1004,'삼양)삼양라면소컵',1100,'/resources/images/라면/삼양)삼양라면소컵.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(1005,'농심)라면왕김통깨',1700,'/resources/images/라면/농심)라면왕김통깨.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(1006,'농심)무파마큰사발컵',1800,'/resources/images/라면/농심)무파마큰사발컵.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(1007,'오뚜기)열려라참깨라면컵',2000,'/resources/images/라면/오뚜기)열려라참깨라면컵.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(1008,'팔도)틈새라면매운김치컵',1700,'/resources/images/라면/팔도)틈새라면매운김치컵.jpg');

insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(2001,'도)백종원백반한판',4500,'/resources/images/밥/도)백종원백반한판.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(2002,'도)동원리챔앤참치김치',5500,'/resources/images/밥/도)동원리챔앤참치김치.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(2003,'주)3XL크랩참치마요삼각',1600,'/resources/images/밥/주)3XL크랩참치마요삼각.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(2004,'도)백종원우삼겹비빔밥',4500,'/resources/images/밥/도)백종원우삼겹비빔밥.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(2005,'도)고깃집맛소금구이정식',5500,'/resources/images/밥/도)고깃집맛소금구이정식.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(2006,'도)백종원바싹불고기한판',4500,'/resources/images/밥/도)백종원바싹불고기한판.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(2007,'김)백종원비빔밥한줄',2900,'/resources/images/밥/김)백종원비빔밥한줄.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(2008,'김)자이언트삼색유부초밥',5900,'/resources/images/밥/김)자이언트삼색유부초밥.jpg');

insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(3001,'롯데)치토스바베큐맛164g',3400,'/resources/images/과자/롯데)치토스바베큐맛164g.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(3002,'롯데)도리토스나쵸치즈',1700,'/resources/images/과자/롯데)도리토스나쵸치즈.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(3003,'롯데)초코파이',5400,'/resources/images/과자/롯데)초코파이.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(3004,'오리온)포카칩어니언66g',1700,'/resources/images/과자/오리온)포카칩어니언66g.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(3005,'농심)포스틱84g',1700,'/resources/images/과자/농심)포스틱84g.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(3006,'롯데)꼬깔콘고소한맛134g',3400,'/resources/images/과자/롯데)꼬깔콘고소한맛134g.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(3007,'농심)바나나킥딸기60g',1700,'/resources/images/과자/농심)바나나킥딸기60g.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(3008,'롯데)빼빼로녹차',1700,'/resources/images/과자/롯데)빼빼로녹차.jpg');

insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(4001,'코카)스프라이트P500ml',2000,'/resources/images/음료수/코카)스프라이트P500ml.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(4002,'코카)파워에이드캔240ml',1200,'/resources/images/음료수/코카)파워에이드캔240ml.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(4003,'코카)코카제로레몬캔355ml',2000,'/resources/images/음료수/코카)코카제로레몬캔355ml.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(4004,'롯데)펩시콜라제로캔355ml',1900,'/resources/images/음료수/롯데)펩시콜라제로캔355ml.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(4005,'코카)조지아카페라떼캔',1200,'/resources/images/음료수/코카)조지아카페라떼캔.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(4006,'농심)웰치제로포도P500',2000,'/resources/images/음료수/농심)웰치제로포도P500.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(4007,'동아)데미소다피치캔250ml',1600,'/resources/images/음료수/동아)데미소다피치캔250ml.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(4008,'HK)티로그복숭아홍차P500',2200,'/resources/images/음료수/HK)티로그복숭아홍차P500.jpg');

insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(5001,'하겐)블루베리타르트미니',5900,'/resources/images/아이스크림/하겐)블루베리타르트미니.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(5002,'해태)부라보콘바닐라',2200,'/resources/images/아이스크림/해태)부라보콘바닐라.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(5003,'빙그레)메로나',1500,'/resources/images/아이스크림/빙그레)메로나.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(5004,'롯데푸드)빠삐코',1500,'/resources/images/아이스크림/롯데푸드)빠삐코.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(5005,'초코)초코비파인트',12400,'/resources/images/아이스크림/초코)초코비파인트.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(5006,'하겐)초코마카롱파인트',15900,'/resources/images/아이스크림/하겐)초코마카롱파인트.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(5007,'롯데)수박바',1200,'/resources/images/아이스크림/롯데)수박바.jpg');
insert into define_inventory_code(inventory_code,inventory_name, price,image_url) values(5008,'롯데)찰떡아이스',2200,'/resources/images/아이스크림/롯데)찰떡아이스.jpg');

