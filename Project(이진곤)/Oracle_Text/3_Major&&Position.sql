--조회록
select * from medicalMajor;
select * from Dmajor;
select * from Nmajor;
select * from Pmajor;
select * from DoctorPosition;
select * from nurseposition;
select * from PatientPosition;

--Dmajor Table Data
INSERT INTO Dmajor VALUES
(1, 1, 4);
INSERT INTO Dmajor VALUES
(2, 2, 1);
INSERT INTO Dmajor VALUES
(3, 2, 4);
INSERT INTO Dmajor VALUES
(4, 3, 27);
INSERT INTO Dmajor VALUES
(5, 4, 16);
INSERT INTO Dmajor VALUES
(6, 5, 23);

--Nmajor Table Data
INSERT INTO Nmajor VALUES
(1, 1, 4);
INSERT INTO Nmajor VALUES
(2, 2, 4);
INSERT INTO Nmajor VALUES
(3, 3, 4);
INSERT INTO Nmajor VALUES
(4, 4, 4);
INSERT INTO Nmajor VALUES
(5, 5, 4);

--Pmajor Table Data
INSERT INTO Pmajor VALUES
(1, 1, 4);
INSERT INTO Pmajor VALUES
(2, 2, 4);
INSERT INTO Pmajor VALUES
(3, 3, 4);
INSERT INTO Pmajor VALUES
(4, 4, 4);
INSERT INTO Pmajor VALUES
(5, 5, 4);

--DoctorP Table Data
INSERT INTO DoctorPosition(PositionCode, name) VALUES (1, '이사장');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (2, '병원장');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (3, '의무원장');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (4, '기획관리실장');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (5, '진료부장');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (6, '교육부장');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (7, '정교수');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (8, '부교수');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (9, '조교수');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (10, '펠로우(임상의)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (11, '전문의');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (12, '치프(의국장)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (13, '레지던트(전공의)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (14, '인턴(수련의)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (100, '본과생(4학년)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (101, '본과생(3학년)');

--NurseP Table Data
INSERT INTO NursePosition VALUES
(1, '간호부장');
INSERT INTO NursePosition VALUES
(2, '간호팀장');
INSERT INTO NursePosition VALUES
(3, '간호과장');
INSERT INTO NursePosition VALUES
(4, '수간호사');
INSERT INTO NursePosition VALUES
(5, '책임간호사');
INSERT INTO NursePosition VALUES
(6, '주임간호사');
INSERT INTO NursePosition VALUES
(7, '평간호사');
INSERT INTO NursePosition VALUES
(8, '학생간호사(4학년)');
INSERT INTO NursePosition VALUES
(9, '학생간호사(3학년)');
INSERT INTO NursePosition VALUES
(10, '학생간호사(2학년)');
INSERT INTO NursePosition VALUES
(11, '간호교수');






--PatientP Table Data
INSERT INTO PatientPosition (positioncode, name) values
(1, '외래환자');
INSERT INTO PatientPosition values
(2, '입원환자');
INSERT INTO PatientPosition values
(3, '응급환자');
INSERT INTO PatientPosition values
(4, '중환자');
INSERT INTO PatientPosition values
(4, '감염환자');
INSERT INTO PatientPosition values
(5, '격리환자');
INSERT INTO PatientPosition values
(6, '암환자');
INSERT INTO PatientPosition values
(7, '이동환자');
INSERT INTO PatientPosition values
(8, '어린이환자');
INSERT INTO PatientPosition values
(9, '노인환자');
INSERT INTO PatientPosition values
(10, '임산부');
INSERT INTO PatientPosition values
(11, '정신병환자');
INSERT INTO PatientPosition values
(77, '치매환자');
INSERT INTO PatientPosition values
(12, '기초수급환자');
INSERT INTO PatientPosition values
(97, '직원');
INSERT INTO PatientPosition values
(98, 'VIP');
INSERT INTO PatientPosition values
(99, 'VVIP');
INSERT INTO PatientPosition values
(44, '사망환자');

--MedicalMajor Table Data
INSERT into medicalMajor(MajorCode, name) VALUES (1, '내과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (2, '신경과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (3, '정신과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (4, '외과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (5, '정형외과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (6, '신경외과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (7, '흉부외과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (8, '성형외과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (9, '산부인과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (10, '안과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (11, '이비인후과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (12, '피부과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (13, '비뇨기과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (14, '진단검사의학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (15, '결핵과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (16, '재활의학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (17, '가정의학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (18, '핵의학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (19, '소아청소년과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (20, '마취통증의학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (21, '방사선종양학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (22, '병리과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (23, '영상의학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (24, '예방의학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (25, '응급의학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (26, '산업의학과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (27, '한방과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (28, '치과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (29, '기타진료과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (30, '한방');
INSERT INTO medicalMajor(MajorCode, name) VALUES (31, '한방 침구과');
INSERT INTO medicalMajor(MajorCode, name) VALUES (32, '사상체질과');