--��ȸ��
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
INSERT INTO DoctorPosition(PositionCode, name) VALUES (1, '�̻���');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (2, '������');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (3, '�ǹ�����');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (4, '��ȹ��������');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (5, '�������');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (6, '��������');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (7, '������');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (8, '�α���');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (9, '������');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (10, '��ο�(�ӻ���)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (11, '������');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (12, 'ġ��(�Ǳ���)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (13, '������Ʈ(������)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (14, '����(������)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (100, '������(4�г�)');
INSERT INTO DoctorPosition(PositionCode, name) VALUES (101, '������(3�г�)');

--NurseP Table Data
INSERT INTO NursePosition VALUES
(1, '��ȣ����');
INSERT INTO NursePosition VALUES
(2, '��ȣ����');
INSERT INTO NursePosition VALUES
(3, '��ȣ����');
INSERT INTO NursePosition VALUES
(4, '����ȣ��');
INSERT INTO NursePosition VALUES
(5, 'å�Ӱ�ȣ��');
INSERT INTO NursePosition VALUES
(6, '���Ӱ�ȣ��');
INSERT INTO NursePosition VALUES
(7, '��ȣ��');
INSERT INTO NursePosition VALUES
(8, '�л���ȣ��(4�г�)');
INSERT INTO NursePosition VALUES
(9, '�л���ȣ��(3�г�)');
INSERT INTO NursePosition VALUES
(10, '�л���ȣ��(2�г�)');
INSERT INTO NursePosition VALUES
(11, '��ȣ����');






--PatientP Table Data
INSERT INTO PatientPosition (positioncode, name) values
(1, '�ܷ�ȯ��');
INSERT INTO PatientPosition values
(2, '�Կ�ȯ��');
INSERT INTO PatientPosition values
(3, '����ȯ��');
INSERT INTO PatientPosition values
(4, '��ȯ��');
INSERT INTO PatientPosition values
(4, '����ȯ��');
INSERT INTO PatientPosition values
(5, '�ݸ�ȯ��');
INSERT INTO PatientPosition values
(6, '��ȯ��');
INSERT INTO PatientPosition values
(7, '�̵�ȯ��');
INSERT INTO PatientPosition values
(8, '���ȯ��');
INSERT INTO PatientPosition values
(9, '����ȯ��');
INSERT INTO PatientPosition values
(10, '�ӻ��');
INSERT INTO PatientPosition values
(11, '���ź�ȯ��');
INSERT INTO PatientPosition values
(77, 'ġ��ȯ��');
INSERT INTO PatientPosition values
(12, '���ʼ���ȯ��');
INSERT INTO PatientPosition values
(97, '����');
INSERT INTO PatientPosition values
(98, 'VIP');
INSERT INTO PatientPosition values
(99, 'VVIP');
INSERT INTO PatientPosition values
(44, '���ȯ��');

--MedicalMajor Table Data
INSERT into medicalMajor(MajorCode, name) VALUES (1, '����');
INSERT INTO medicalMajor(MajorCode, name) VALUES (2, '�Ű��');
INSERT INTO medicalMajor(MajorCode, name) VALUES (3, '���Ű�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (4, '�ܰ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (5, '�����ܰ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (6, '�Ű�ܰ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (7, '��οܰ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (8, '�����ܰ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (9, '����ΰ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (10, '�Ȱ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (11, '�̺����İ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (12, '�Ǻΰ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (13, '�񴢱��');
INSERT INTO medicalMajor(MajorCode, name) VALUES (14, '���ܰ˻����а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (15, '���ٰ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (16, '��Ȱ���а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (17, '�������а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (18, '�����а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (19, '�Ҿ�û�ҳ��');
INSERT INTO medicalMajor(MajorCode, name) VALUES (20, '�����������а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (21, '��缱�����а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (22, '������');
INSERT INTO medicalMajor(MajorCode, name) VALUES (23, '�������а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (24, '�������а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (25, '�������а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (26, '������а�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (27, '�ѹ��');
INSERT INTO medicalMajor(MajorCode, name) VALUES (28, 'ġ��');
INSERT INTO medicalMajor(MajorCode, name) VALUES (29, '��Ÿ�����');
INSERT INTO medicalMajor(MajorCode, name) VALUES (30, '�ѹ�');
INSERT INTO medicalMajor(MajorCode, name) VALUES (31, '�ѹ� ħ����');
INSERT INTO medicalMajor(MajorCode, name) VALUES (32, '���ü����');