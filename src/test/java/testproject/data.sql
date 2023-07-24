

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS users;
create table users (
                       id int (10) AUTO_INCREMENT,
                       name varchar(20) NOT NULL,
                       surname varchar(20) NOT NULL,
                       parent_name varchar(20) NOT NULL,
                       username varchar(40) NOT NULL,
                       password varchar(80) NOT NULL,
                       creation_date date NOT NULL,
                       last_edit_date date NOT NULL,
                       role enum('Admin','journalist','subscriber') NOT NULL,
                       PRIMARY KEY (id)
);
INSERT INTO users  VALUES (1,'name','surname','parentName','username','password','07-07-2000','07-07-2000','Admin');
create table news (
                     id int AUTO_INCREMENT,
                     text varchar(2000) NOT NULL,
                     title varchar(150) NOT NULL,
                     inserted_by_id int NOT NULL,
                     updated_by_id int NOT NULL,
                     creation_date date NOT NULL,
                     last_edit_date date NOT NULL,
                     PRIMARY KEY (id),
                     FOREIGN KEY (inserted_by_id) REFERENCES users (id),
                     FOREIGN KEY (updated_by_id) REFERENCES users (id)
);
insert into news VALUES (1,'1 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (2,'2 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (3,'3 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (4,'4 is that the dollar has risen by 5 percent','The dollar rose',        1,1,'07-07-2000','07-07-2000');
insert into news VALUES (5,'5 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (6,'6 is that the dollar has risen by 5 percent','The dollar rose',        1,1,'07-07-2000','07-07-2000');
insert into news VALUES (7,'7 is that the dollar has risen by 5 percent','The dollar rose',        1,1,'07-07-2000','07-07-2000');
insert into news VALUES (8,'8 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (9,'9 is that the dollar has risen by 5 percent','The dollar rose',        1,1,'07-07-2000','07-07-2000');
insert into news VALUES (10,'10 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (11,'11 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (12,'12 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (13,'13 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (14,'14 is that the dollar has risen by 5 percent','The dollar rose',        1,1,'07-07-2000','07-07-2000');
insert into news VALUES (15,'15 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (16,'16 is that the dollar has risen by 5 percent','The dollar rose',        1,1,'07-07-2000','07-07-2000');
insert into news VALUES (17,'17 is that the dollar has risen by 5 percent','The dollar rose',        1,1,'07-07-2000','07-07-2000');
insert into news VALUES (18,'18 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
insert into news VALUES (19,'19 is that the dollar has risen by 5 percent','The dollar rose',        1,1,'07-07-2000','07-07-2000');
insert into news VALUES (20,'20 is that the dollar has fallen by 5 percent','the fall of the dollar',1,1,'07-07-2000','07-07-2000');
create table comments (
                          id int (10) AUTO_INCREMENT,
                          text varchar(20) NOT NULL,
                          id_news varchar(50) NOT NULL,
                          updated_by_id varchar(15) NOT NULL,
                          creation_date date NOT NULL,
                          last_edit_date date NOT NULL,
                          PRIMARY KEY (id),
                          FOREIGN KEY (updated_by_id) REFERENCES users (id),
                          FOREIGN KEY (id_news) REFERENCES news (id)
);
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',1,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',1,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',1,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',1,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',1,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',1,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',1,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',1,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',1,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',1,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',2,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',2,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',2,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',2,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',2,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',2,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',2,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',2,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',2,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',2,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',3,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',3,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',3,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',3,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',3,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',3,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',3,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',3,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',3,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',3,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',4,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',4,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',4,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',4,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',4,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',4,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',4,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',4,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',4,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',4,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',5,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',5,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',5,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',5,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',5,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',5,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',5,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',5,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',5,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',5,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',6,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',6,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',6,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',6,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',6,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',6,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',6,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',6,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',6,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',6,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',7,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',7,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',7,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',7,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',7,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',7,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',7,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',7,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',7,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',7,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',8,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',8,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',8,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',8,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',8,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',8,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',8,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',8,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',8,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',8,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',9,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',9,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',9,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',9,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',9,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',9,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',9,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',9,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',9,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',9,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',10,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',10,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',10,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',10,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',10,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',10,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',10,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',10,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',10,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',10,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',11,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',11,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',11,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',11,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',11,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',11,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',11,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',11,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',11,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',11,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',12,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',12,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',12,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',12,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',12,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',12,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',12,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',12,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',12,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',12,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',13,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',13,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',13,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',13,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',13,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',13,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',13,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',13,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',13,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',13,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',14,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',14,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',14,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',14,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',14,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',14,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',14,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',14,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',14,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',14,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',15,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',15,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',15,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',15,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',15,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',15,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',15,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',15,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',15,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',15,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',16,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',16,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',16,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',16,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',16,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',16,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',16,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',16,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',16,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',16,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',17,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',17,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',17,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',17,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',17,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',17,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',17,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',17,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',17,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',17,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',18,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',18,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',18,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',18,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',18,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',18,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',18,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',18,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',18,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',18,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',19,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',19,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',19,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',19,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',19,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',19,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',19,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',19,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',19,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',19,1,'07-07-2000','07-07-2000');

insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('cool',20,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('awesome',20,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('pity',20,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ok',20,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('can by and better',20,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('as I thought',20,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('круто',20,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('так и должно быть',20,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('ну наконец',20,1,'07-07-2000','07-07-2000');
insert into comments (text, id_news, updated_by_id, creation_date, last_edit_date) values ('eee:)',20,1,'07-07-2000','07-07-2000');














