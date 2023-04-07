--Users Table DATA
INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User1','이진곤','19970601','82','053','수성로','user1@email.com','10000');

INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User2','박준호','11111111','82','053','악마로','user2@email.com','999999');

INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User3','소병수','11221212','82','053','폴로','user3@email.com','100000'); 
INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User4','장대건','13131013','82','053','뽀로로','user4@email.com','150000');
INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User5','서정빈','14140914','82','053','케로로','user5@email.com','900000');
--유저 테이블 컬럼 순서 변경중 우선 감추기
alter table Users modify user_email invisible;  
alter table Users modify user_balance invisible; 
alter table Users modify user_country invisible; 
alter table Users modify user_City invisible; 
alter table Users modify user_street invisible;
alter table Users modify user_registdate invisible; 
alter table Users modify user_birthdate invisible;
--다시 보이게
alter table users modify user_birthdate visible;
alter table users modify user_country visible;
alter table users modify user_city visible;
alter table users modify user_street visible;
alter table users modify user_email visible;
alter table users modify user_balance visible;
alter table users modify user_registdate visible;

-
select * from users;
select * from Country; 
select * from City;