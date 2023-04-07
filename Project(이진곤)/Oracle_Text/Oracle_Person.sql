--�����
CREATE TABLE MedicalMajor
(
Majorcode VARCHAR2(100) PRIMARY KEY,
Name VARCHAR2(100)
);

--(�ǻ�/��ȣ��/ȯ��)�����
CREATE TABLE DMajor
(
MajorCodeD VARCHAR2(100) PRIMARY KEY,
DoctorID VARCHAR2(100),
MajorCode VARCHAR2(100) REFERENCES MedicalMajor(MajorCode)
);

CREATE TABLE NMajor
(
MajorCodeN VARCHAR2(100) PRIMARY KEY,
NurseID VARCHAR2(100) ,
MajorCode VARCHAR2(100) REFERENCES MedicalMajor(MajorCode)
);

CREATE TABLE PMajor
(
MajorCodeP VARCHAR2(100) PRIMARY KEY,
PatientID VARCHAR2(100),
MajorCode VARCHAR2(100) REFERENCES MedicalMajor(MajorCode)
);
--ID FK ����
Alter Table Dmajor MODIFY DoctorID VARCHAR2(100) REFERENCES Doctor(DoctorID);
Alter Table Nmajor MODIFY NurseID VARCHAR2(100) REFERENCES Nurse(NurseID);
Alter Table Pmajor MODIFY PatientID VARCHAR2(100) REFERENCES Patient(patientID);

--(�ǻ�/��ȣ��)����/ȯ�ڻ���
CREATE TABLE DoctorPosition
(
PositionCode VARCHAR2(100) PRIMARY KEY,
Name VARCHAR2(100)
);

CREATE TABLE NursePosition
(
PositionCode VARCHAR2(100) PRIMARY KEY,
Name VARCHAR2(100)
);

CREATE TABLE PatientPosition
(
PositionCode VARCHAR2(100) PRIMARY KEY,
Name VARCHAR2(100)
);


--(�ǻ�/��ȣ��/ȯ��)Table
CREATE Table Doctor
(
DoctorID VARCHAR2(100) PRIMARY KEY,
UserID VARCHAR2(100) REFERENCES users(User_ID),
HospitalCode VARCHAR2(100) REFERENCES Hospital(HospitalCode),
MajorCode VARCHAR2(100) REFERENCES DMajor(MajorCodeD),
PositionCode VARCHAR2(100) REFERENCES DoctorPosition(PositionCode)
);

CREATE Table Nurse
(
NurseID VARCHAR2(100) PRIMARY KEY,
UserID VARCHAR2(100) REFERENCES users(User_ID),
HospitalCode VARCHAR2(100) REFERENCES Hospital(HospitalCode),
MajorCode VARCHAR2(100) REFERENCES NMajor(MajorCodeN),
PositionCode VARCHAR2(100) REFERENCES NursePosition(PositionCode)
);

CREATE Table Patient
(
PatientID VARCHAR2(100) PRIMARY KEY,
UserID VARCHAR2(100) REFERENCES users(User_ID),
HospitalCode VARCHAR2(100) REFERENCES Hospital(HospitalCode),
MajorCode VARCHAR2(100) REFERENCES PMajor(MajorCodeP),
PositionCode VARCHAR2(100) REFERENCES PatientPosition(PositionCode)
);
