create database book;
use book;
create table user(user_id  int primary key,
user_password int,
first_name varchar(50),
last_name varchar(50),
sign_up_on_date date,
emali_id varchar(50));
drop table user;
insert into user(user_id,user_password,first_name,last_name,sign_up_on_date,emali_id)values
(101,1234567,"suravi","rakshit","08-01-22","suravi@gmail.com"),
(102,2345678,"sayani","rakshit","07-02-22","sayani@gmail.com"),
(103,3456789,"joy","dule","05-03-22","joy@gmail.com"),
(104,4567893,"brasha","sen","09-08-22","bbha@gmail.com"),
(105,5678904,"polas","roy","07-08-23","pola@gmail.com");
select*from user;
create table publish(publisher_id int primary key,
publisher varchar(50),
distributor varchar(50),
releases_count int,
last_releases date);
insert into publish(publisher_id,publisher,distributor,releases_count,last_releases)values
(1,"SR","DR",45,"09-08-22"),
(2,"RD","HJ",23,"08-07-23"),
(4,"UY","HG",56,"06-05-24"),
(5,"FG","GH",89,"05-05-21"),
(6,"DF","GH",78,"04-06-22");
select*FROM publish;
create table author(author_id int primary key,
name varchar(50),
last_name varchar(50),
publications_count int);
insert into author(author_id,name,last_name,publications_count)values
(4,"ty","yu",67),
(5,"Dani","gosh",90),
(6,"moni","gosh",89),
(7,"dolon","bose",56),
(8,"koyel","hj",87);
select*from author;
create table books(book_id int primary key,
book_code int,
book_name varchar(50),
author_id int,
publisher_id int,
book_vertion varchar(50),
releases_date date,
available_from date,

foreign key (author_id) references author(author_id),
foreign key (publisher_id) references publish(publisher_id));
insert into books(book_id,book_code,book_name,author_id,publisher_id,book_vertion,releases_date,available_from)values
(101,12,"gimmy",4,1,"hindi","09-08-22","09-09-22"),
(102,23,"lilli",5,4,"bengali","08-08-23","07-09-23"),
(103,34,"giba",7,6,"urdu","05-07-24","07-09-24"),
(104,45,"konika",8,5,"eng","09-08-22","06-07-23"),
(105,56,"gitanjali",6,6,"hindi","08-06-22","09-06-23");
select*from books;


drop table books;
create table reader(reader_id int primary key,
first_name varchar(50),
last_name varchar(50),
registered_on date,
books_issued_total int,
books_issued_current int,
is_issued boolean,
last_issue_date date);
insert into reader(reader_id,first_name,last_name,registered_on,books_issued_total,books_issued_current,is_issued,last_issue_date)values
(1,"DF","FG","09-08-22",12,2,TRUE,"09-07-22"),
(2,"DF","GF","06-08-23",23,14,FALSE,"04-08-22"),
(3,"FD","FG","08-08-23",34,5,TRUE,"09-05-23"),
(4,"GH","JK","07-06-22",66,7,FALSE,"06-09-22"),
(5,"JK","KL","06-04-22",45,28,FALSE,"05-05-22");
select*from reader;
create table booked(issue_id int primary key,
book_id int,
issued_to int,
issued_on date,
return_on date,
payment_transaction_id int,
foreign key (book_id)references books(book_id),
foreign key(issued_to)references reader(reader_id));
insert into booked(issue_id,book_id ,issued_to,issued_on,return_on,payment_transaction_id)values
(1,101,2,"09-09-22","09-08-22",2233),
(2,102,4,"08-07-22","07-07-22",3456),
(3,103,1,"06-09-23","09-09-23",4567),
(4,104,5,"07-07-23","08-07-24",4568),
(5,105,2,"05-04-22","04-05-22",5678);
select*from booked;
select book_id, return_on from booked
where issue_id>04-05-22; 
select book_id,return_on,issued_on
from booked
inner join reader
on booked.issued_to=reader.reader_id;
select return_on,issued_on
from booked
left join books
on booked.book_id= books.book_id;
 update booked
set book_id="109"
where book_id="105";
select*from booked;






