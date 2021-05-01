def clear_tables(client):
    sqlQuery = '''
               Truncate Table VaccineAppointments
               DBCC CHECKIDENT ('VaccineAppointments', RESEED, 0)
               Truncate Table Vaccines
               Truncate Table CareGiverSchedule
               DBCC CHECKIDENT ('CareGiverSchedule', RESEED, 0)
               Delete From Patients
               DBCC CHECKIDENT ('Patients', RESEED, 0)
               Delete From Caregivers
               DBCC CHECKIDENT ('Caregivers', RESEED, 0)
               '''
    client.cursor().execute(sqlQuery)
    client.commit()