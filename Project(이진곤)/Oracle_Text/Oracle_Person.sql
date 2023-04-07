--진료과
CREATE TABLE MedicalMajor
(
Majorcode VARCHAR2(100) PRIMARY KEY,
Name VARCHAR2(100)
);

--(의산/간호사/환자)진료과
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
--ID FK 설정
Alter Table Dmajor MODIFY DoctorID VARCHAR2(100) REFERENCES Doctor(DoctorID);
Alter Table Nmajor MODIFY NurseID VARCHAR2(100) REFERENCES Nurse(NurseID);
Alter Table Pmajor MODIFY PatientID VARCHAR2(100) REFERENCES Patient(patientID);

--(의산/간호사)직급/환자상태
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


--(의사/간호사/환자)Table
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
