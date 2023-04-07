--Á¶È¸·Ï
select * from Doctor;
select * from Nurse;
select * from patient;

--Doctor Table Data
INSERT INTO Doctor(DoctorID, UserID, HospitalCode, PositionCode) VALUES
(1, 'User1', 1, 1);
INSERT INTO Doctor(DoctorID, UserID, HospitalCode, PositionCode) VALUES
(2, 'User2', 2, 2);
INSERT INTO Doctor(DoctorID, UserID, HospitalCode, PositionCode) VALUES
(3, 'User3', 3, 2);
INSERT INTO Doctor(DoctorID, UserID, HospitalCode, PositionCode) VALUES
(4, 'User4', 4, 2);
INSERT INTO Doctor(DoctorID, UserID, HospitalCode, PositionCode) VALUES
(5, 'User5', 5, 2);


--Nurse Table Data
INSERT INTO Nurse(NurseID, UserID, HospitalCode, PositionCode) VALUES
(1, 'User11', 1,1);
INSERT INTO Nurse(NurseID, UserID, HospitalCode, PositionCode) VALUES
(2, 'User12', 1,2);
INSERT INTO Nurse(NurseID, UserID, HospitalCode, PositionCode) VALUES
(3, 'User13', 1,3);
INSERT INTO Nurse(NurseID, UserID, HospitalCode, PositionCode) VALUES
(4, 'User14', 1,4);
INSERT INTO Nurse(NurseID, UserID, HospitalCode, PositionCode) VALUES
(5, 'User15', 1,5);

--patient Table Data
INSERT INTO patient(PatientID, UserID, HospitalCode, PositionCode) VALUES
(1, 'User6', 1, 1);
INSERT INTO patient(PatientID, UserID, HospitalCode, PositionCode) VALUES
(2, 'User7', 1, 4);
INSERT INTO patient(PatientID, UserID, HospitalCode, PositionCode) VALUES
(3, 'User8', 1, 6);
INSERT INTO patient(PatientID, UserID, HospitalCode, PositionCode) VALUES
(4, 'User9', 1, 77);
INSERT INTO patient(PatientID, UserID, HospitalCode, PositionCode) VALUES
(5, 'User10', 1, 44);
