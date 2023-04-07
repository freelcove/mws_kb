--���� : ���� �ּ� ���̺�
CREATE TABLE country
(
country_code VARCHAR2(10) PRIMARY KEY,
country_name_kr VARCHAR2(100) NOT NULL
);

--���� : ���� �ּ� ���̺�
CREATE TABLE city
(
city_code VARCHAR2(10) PRIMARY KEY,
city_name_kr VARCHAR2(100) NOT NULL,
city_country_code VARCHAR2(10) REFERENCES country(country_code)
);

--���� : ����� ���̺�
CREATE TABLE USERS
(
user_id VARCHAR2(100) PRIMARY KEY,
user_email VARCHAR2(100) NOT NULL UNIQUE,
user_balance NUMBER(38,2) DEFAULT 0,
user_country VARCHAR2(10) REFERENCES country(country_code),
user_city VARCHAR2(10) REFERENCES city(city_code),   
user_street VARCHAR2(100), 
user_registdate DATE,
user_birthdate DATE,
user_name VARCHAR2(100) NOT NULL
);

INSERT INTO country VALUES ('82','�ѱ�');
INSERT INTO country VALUES ('1','�̱�');

INSERT INTO city VALUES ('02','����','82');
INSERT INTO city VALUES ('042','����','82');
INSERT INTO city VALUES ('053','�뱸','82');
INSERT INTO city VALUES ('051','�λ�','82');
INSERT INTO city VALUES ('1','������','1');
INSERT INTO city VALUES ('2','����','1');