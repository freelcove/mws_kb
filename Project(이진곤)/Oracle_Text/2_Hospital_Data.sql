--��ȸ��
select * from HospitalClass;
select * from Grade;
select *from Hospital;

--HospitalClass Table Data
INSERT INTO HospitalClass VALUES
('1', '1��');
INSERT INTO HospitalClass VALUES
('2', '2��');
INSERT INTO HospitalClass VALUES
('3', '3��');

--Grade Table Data
INSERT INTO Grade VALUES
(1, '�ǿ�');
INSERT INTO Grade (GradeCode, Name)	VALUES
(2, 'ġ���ǿ�');
INSERT INTO Grade (GradeCode, Name)	VALUES
(3, '���ǿ�');
INSERT INTO Grade (GradeCode, Name)	VALUES
(4, '�����');
INSERT INTO Grade (GradeCode, Name)	VALUES
(5, '����');
INSERT INTO Grade (GradeCode, Name)	VALUES
(6, 'ġ������');
INSERT INTO Grade (GradeCode, Name)	VALUES
(7, '�ѹ溴��');
INSERT INTO Grade (GradeCode, Name)	VALUES
(8, '��纴��');
INSERT INTO Grade (GradeCode, Name)	VALUES
(9, '���ź���');
INSERT INTO Grade (GradeCode, Name)	VALUES
(10, '���պ���');
INSERT INTO Grade (GradeCode, Name)	VALUES
(11, '������պ���');

--Hospital Table Data
INSERT INTO Hospital (Hospitalcode, name, classcode, gradecode, countrycode, citycode, Bednum, hp) VALUES 
(1, '��������к���', 3, 11, '82', '053', 1000, '053-111-1111');
INSERT INTO Hospital VALUES 
(2, '����ȣ���պ���', 2, 10, '82', '053', 800, '053-222-2222');
INSERT INTO Hospital VALUES 
(3, '�����ѹ溴��', 1, 7, '82', '053', 100, '053-333-3333');
INSERT INTO Hospital VALUES 
(4, '��ǿ�纴��', 1, 8, '82', '053', 150, '053-444-4444');
INSERT INTO Hospital VALUES 
(5, '������ǿ�', 1, 1, '82', '053', 30, '053-555-5555');