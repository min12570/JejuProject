//table create
CREATE TABLE people (
id INT(6) PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL
);

//insert
insert into people values (1, "kim","ahreum");
insert into people values (2, "to","you");

//select
select * from people;
