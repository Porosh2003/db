-- create database and table
create database college;
use college;

create table students (
    id int primary key,
    name varchar(50),
    age int,
    department varchar(50)
);

-- insert (add data)
insert into students (id, name, age, department)
values 
(1, 'rahim', 20, 'cse'),
(2, 'karim', 21, 'eee'),
(3, 'sakib', 22, 'bba');

select * from students;

-- update (modify data)
update students
set age = 23
where id = 1;

-- delete (remove data)
delete from students
where id = 2;