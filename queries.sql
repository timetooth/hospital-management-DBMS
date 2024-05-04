-- get all appointments for a doctor
CREATE OR REPLACE PROCEDURE app_by_doc_id(doc IN doctors.doctor_id%TYPE) IS
    r appointments%ROWTYPE;
	n doctors.name%TYPE;
BEGIN
    SELECT name INTO n FROM doctors WHERE doctor_id = doc;

    dbms_output.put_line('Upcoming appointments for doctor '|| n || ' are');

    FOR r IN (SELECT * FROM appointments WHERE doctor_id = doc AND status = 'UPC') LOOP
        dbms_output.put_line('Appointment for patient '|| r.patient_id || ' on '|| r.appointment_date || ' at '|| to_char(r.app_time, 'HH24:MI AM'));
    END LOOP;
END;
/

EXEC app_by_doc_id(102);

-- View meds from appointment_id
CREATE OR REPLACE PROCEDURE meds_by_appointment_id(
    app IN appointments.appointment_id%TYPE
) IS
    num NUMBER := 0;
    pn patients.first_name%TYPE;
    dn doctors.name%TYPE;
    n medicines.med_name%TYPE;
    r prescriptions%ROWTYPE;
BEGIN
    -- Get patient's name
    SELECT first_name INTO pn FROM patients WHERE patient_id = (SELECT patient_id FROM appointments WHERE appointment_id = app);
    
    -- Get doctor's name
    SELECT name INTO dn FROM doctors WHERE doctor_id = (SELECT doctor_id FROM appointments WHERE appointment_id = app);
    
    -- Output appointment details
    dbms_output.put_line('Medicines prescribed for patient '|| pn || ' by '|| dn || ' for appointment no. '|| app || ' are');
    
    -- Count prescriptions for the appointment
    SELECT COUNT(*) INTO num FROM prescriptions WHERE appointment_id = app;
    
    -- Check if no prescriptions are found
    IF num = 0 THEN 
        dbms_output.put_line('All good, no meds needed');
    END IF;
    FOR r IN (SELECT * FROM prescriptions WHERE appointment_id = app) LOOP
        SELECT med_name INTO n FROM medicines WHERE medicine_id = r.medicine_id;
        dbms_output.put_line('Take Medicine '|| n ||  ' ' || r.frequency || ' times a day for '|| CEIL(r.quantity / r.frequency) || ' days');
    END LOOP;
END;
/

EXEC meds_by_appointment_id(5);

-- cancel all appointments given a doctor_id

CREATE OR REPLACE PROCEDURE cancel_by_doc_id(
    doc IN doctors.doctor_id%TYPE
) IS
BEGIN
    UPDATE appointments SET status = 'CAN' WHERE doctor_id = doc;
    dbms_output.put_line('All appointments for doctor '|| doc || ' have been cancelled');
END;
/

EXEC cancel_by_doc_id(101);

-- cancel all appointments given a patient_id

CREATE OR REPLACE PROCEDURE cancel_by_patient_id(
    pat IN patients.patient_id%TYPE
) IS
BEGIN
    UPDATE appointments SET status = 'CAN' WHERE patient_id = pat;
    dbms_output.put_line('All appointments for patient '|| pat || ' have been cancelled');
END;
/
EXEC cancel_by_patient_id(1);