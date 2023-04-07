--조회록
select * from HospitalClass;
select * from Grade;
select *from Hospital;

--HospitalClass Table Data
INSERT INTO HospitalClass VALUES
('1', '1차');
INSERT INTO HospitalClass VALUES
('2', '2차');
INSERT INTO HospitalClass VALUES
('3', '3차');

--Grade Table Data
INSERT INTO Grade VALUES
(1, '의원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(2, '치과의원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(3, '한의원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(4, '조산원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(5, '병원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(6, '치과병원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(7, '한방병원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(8, '요양병원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(9, '정신병원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(10, '종합병원');
INSERT INTO Grade (GradeCode, Name)	VALUES
(11, '상급종합병원');

--Hospital Table Data
INSERT INTO Hospital (Hospitalcode, name, classcode, gradecode, countrycode, citycode, Bednum, hp) VALUES 
(1, '이진곤대학병원', 3, 11, '82', '053', 1000, '053-111-1111');
INSERT INTO Hospital VALUES 
(2, '갓준호종합병원', 2, 10, '82', '053', 800, '053-222-2222');
INSERT INTO Hospital VALUES 
(3, '병수한방병원', 1, 7, '82', '053', 100, '053-333-3333');
INSERT INTO Hospital VALUES 
(4, '대건요양병원', 1, 8, '82', '053', 150, '053-444-4444');
INSERT INTO Hospital VALUES 
(5, '정빈없의원', 1, 1, '82', '053', 30, '053-555-5555');