-- view tables
SELECT * FROM Caregivers;
SELECT * FROM AppointmentStatusCodes;
SELECT * FROM CareGiverSchedule;
SELECT * FROM Vaccines;
SELECT * FROM Patients;
SELECT * FROM VaccineAppointments;

Drop Table CareGiverSchedule;
Drop Table Caregivers;
Drop Table AppointmentStatusCodes;
Drop Table Patients;
Drop Table Vaccines;
Drop Table VaccineAppointments;

EXEC sp_fkeys 'CareGiverSchedule'

-- TEST Vaccine addition + reservation queries
INSERT INTO Vaccines (VaccineName, DosesRequired, MaxSpacing, MinSpacing, MaxStorageTemp) VALUES ('Johnson & Johnson', '1', '0', '0', '0');
INSERT INTO Vaccines (VaccineName, DosesRequired, MaxSpacing, MinSpacing, MaxStorageTemp) VALUES ('Moderna', '2', '0', '0', '0');

UPDATE Vaccines SET DosesAvailable = DosesAvailable + 100 WHERE VaccineName = 'Johnson & Johnson';

SELECT * FROM Vaccines
UPDATE Vaccines SET DosesReserved = DosesReserved + DosesRequired WHERE VaccineName = 'Johnson & Johnson';
UPDATE Vaccines SET DosesReserved = DosesReserved + DosesRequired WHERE VaccineName = 'Moderna';
SELECT * FROM Vaccines
