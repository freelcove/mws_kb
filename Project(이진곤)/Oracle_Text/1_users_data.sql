--Users Table DATA
INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User1','������','19970601','82','053','������','user1@email.com','10000');

INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User2','����ȣ','11111111','82','053','�Ǹ���','user2@email.com','999999');

INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User3','�Һ���','11221212','82','053','����','user3@email.com','100000'); 
INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User4','����','13131013','82','053','�Ƿη�','user4@email.com','150000');
INSERT INTO Users 
(user_id, user_name, user_birthdate, user_country, user_city, user_street, user_email, user_balance)
VALUES
('User5','������','14140914','82','053','�ɷη�','user5@email.com','900000');
--���� ���̺� �÷� ���� ������ �켱 ���߱�
alter table Users modify user_email invisible;  
alter table Users modify user_balance invisible; 
alter table Users modify user_country invisible; 
alter table Users modify user_City invisible; 
alter table Users modify user_street invisible;
alter table Users modify user_registdate invisible; 
alter table Users modify user_birthdate invisible;
--�ٽ� ���̰�
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