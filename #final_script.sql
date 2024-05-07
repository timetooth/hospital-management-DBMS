-- DROP TABLE prescriptions;
-- DROP TABLE appointments;
-- DROP TABLE medicines;
-- DROP TABLE bills;
-- DROP TABLE patients;
-- DROP TABLE doctors;
-- DROP TABLE departments;

-- patient table
CREATE TABLE patients(
    patient_id NUMBER PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30),
    phone_number VARCHAR(12) UNIQUE,
    addr_street VARCHAR(50),
    addr_city VARCHAR(50) NOT NULL,
    addr_state VARCHAR(30) CONSTRAINT patient_state_constraint CHECK(addr_state IN ('Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka', 'Kerala', 'Maharashtra', 'Madhya Pradesh', 'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Tripura', 'Telangana', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal','Andaman and Nicobar Islands', 'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Delhi', 'Jammu and Kashmir', 'Ladakh', 'Lakshadweep', 'Puducherry'))
);

--department table
CREATE TABLE departments(
    dept_id NUMBER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    dept_head NUMBER
);

-- doctors table
CREATE TABLE doctors(
    doctor_id NUMBER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    qualification VARCHAR(50) NOT NULL,
    specialization VARCHAR(50),
    addr_street VARCHAR(50),
    addr_city VARCHAR(50) NOT NULL,
    addr_state VARCHAR(30) CONSTRAINT doctor_state_constraint CHECK(addr_state IN ('Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka', 'Kerala', 'Maharashtra', 'Madhya Pradesh', 'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Tripura', 'Telangana', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal''Andaman and Nicobar Islands', 'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Delhi', 'Jammu and Kashmir', 'Ladakh', 'Lakshadweep', 'Puducherry')),
    dept_id NUMBER REFERENCES departments(dept_id)
);

--appointments table
CREATE TABLE appointments(
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES patients(patient_id),
    doctor_id NUMBER REFERENCES doctors(doctor_id),
    appointment_datetime DATE NOT NULL,
    diagnosis VARCHAR(255) NOT NULL,
    treatment VARCHAR(255) NOT NULL,
    status VARCHAR(4) CONSTRAINT appointment_status_constraint CHECK(status in ('UPC', 'CAN', 'ATT', 'NATT'))
);

--Bills Table
CREATE TABLE bills (
    bill_id NUMBER PRIMARY KEY,
    patient_id NUMBER NOT NULL REFERENCES patients(patient_id),
    bill_date DATE NOT NULL,
    amount NUMBER NOT NULL,
    bill_type VARCHAR(3) CHECK(bill_type IN ('MED', 'APT')),
    status VARCHAR(6) CHECK(status IN ('PAID','UNPAID'))
);

-- medicines table
CREATE TABLE medicines (
    medicine_id NUMBER PRIMARY KEY,
    medicine_name VARCHAR(20),
    discount_percentage NUMBER NOT NULL CHECK (discount_percentage >= 0 AND discount_percentage <= 100),
    qty NUMBER NOT NULL,
    price NUMBER NOT NULL
);
-- prescriptions Table
CREATE TABLE prescriptions(
    medicine_id NUMBER REFERENCES medicines(medicine_id),
    appointment_id NUMBER REFERENCES appointments(appointment_id),
    qty NUMBER DEFAULT 1,
    frequency NUMBER DEFAULT 1
);

-- values for all the tables -enter in this particular order
-- 10 values for patients table
INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (1, 'Rahul', 'Gupta', '9998887777', '123 Gandhi Road', 'Mumbai', 'Maharashtra');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (2, 'Priya', 'Patel', '8887776666', '456 Nehru Street', 'Delhi', 'Delhi');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (3, 'Amit', 'Sharma', '7776665555', '789 Tagore Lane', 'Gandhinagar', 'Gujarat');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (4, 'Sneha', 'Singh', '6665554444', '321 Bose Avenue', 'Chennai', 'Tamil Nadu');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (5, 'Raj', 'Verma', '8554443333', '654 Thakur Street', 'Bangalore', 'Karnataka');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (6, 'Neha', 'Jain', '7443332222', '987 Bose Lane', 'Hyderabad', 'Telangana');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (7, 'Vivek', 'Mishra', '8332221111', '123 Nehru Road', 'Pune', 'Maharashtra');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (8, 'Anjali', 'Yadav', '9221110000', '456 Patel Street', 'Ahmedabad', 'Gujarat');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (9, 'Suresh', 'Kumar', '9110009999', '789 Gandhi Lane', 'Jaipur', 'Rajasthan');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state) 
VALUES (10, 'Meera', 'Shah', '9998888456', '321 Tagore Street', 'Lucknow', 'Uttar Pradesh');

select * from patients;
-- 10 values for departments table
INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (1, 'Cardiology', 'Block A', 101);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (2, 'Neurology', 'Block B', 102);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (3, 'Orthopedics', 'Block C', 115);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (4, 'Gynecology', 'Block D', 104);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (5, 'Pediatrics', 'Block E', 105);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (6, 'Oncology', 'Block F', 106);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (7, 'ENT', 'Block G', 107);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (8, 'Dermatology', 'Block H', 108);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (9, 'Psychiatry', 'Block I', 109);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (10, 'General MEDicine', 'Block J', 110);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (11, 'Plastic Surgery', 'Block K', 114);

SELECT * FROM departments;

-- 20 values for doctors table
INSERT INTO doctors
VALUES (101, 'Dr. Ramesh', 'MD', 'Cardiologist', '123 Gandhi Road', 'Mumbai', 'Maharashtra', 1);

INSERT INTO doctors
VALUES (102, 'Dr. Suresh', 'MBBS', 'Neurologist', '456 Nehru Street', 'Delhi', 'Delhi', 2);

INSERT INTO doctors
VALUES (103, 'Dr. Mahesh', 'MBBS', 'Orthopedist', '789 Tagore Lane', 'Gandhinagar', 'Gujarat', 3);

INSERT INTO doctors
VALUES (104, 'Dr. Rakesh', 'MD', 'Gynecologist', '321 Bose Avenue', 'Chennai', 'Tamil Nadu', 4);

INSERT INTO doctors
VALUES (105, 'Dr. Ritu', 'MBBS', 'Pediatrician', '654 Thakur Street', 'Bangalore', 'Karnataka', 5);

INSERT INTO doctors
VALUES (106, 'Dr. Rina', 'MBBS', 'Oncologist', '987 Bose Lane', 'Hyderabad', 'Telangana', 6);

INSERT INTO doctors
VALUES (107, 'Dr. Rishi', 'MD', 'ENT Specialist', '123 Nehru Road', 'Pune', 'Maharashtra', 7);

INSERT INTO doctors
VALUES (108, 'Dr. Ruchi', 'MBBS', 'Dermatologist', '456 Patel Street', 'Ahmedabad', 'Gujarat', 8);

INSERT INTO doctors
VALUES (109, 'Dr. Roshan', 'MBBS', 'Psychiatrist', '789 Gandhi Lane', 'Jaipur', 'Rajasthan', 9);

INSERT INTO doctors
VALUES (110, 'Dr. Rupali', 'MBBS', 'General Physician', '321 Tagore Street', 'Lucknow', 'Uttar Pradesh', 10);

INSERT INTO doctors
VALUES (111, 'Dr. Rakesh', 'MD', 'Cardiologist', '123 Gandhi Road', 'Mumbai', 'Maharashtra', 1);

INSERT INTO doctors
VALUES (112, 'Dr. Tina', 'MD', 'Cardiologist', '123 Nehru Road', 'Delhi', 'Delhi', 1);

INSERT INTO doctors
VALUES (113, 'Dr. Sujata', 'MD', 'Oncologist', '345 Patel Road', 'Gandhinagar', 'Gujarat', 6);

INSERT INTO doctors
VALUES (114, 'Dr. Leena', 'MD', 'Plastic Surgeon', '123 Sangat Street', 'Bathinda', 'Punjab', 11);

INSERT INTO doctors
VALUES (115, 'Dr. Rajiv', 'MD', 'Orthopedist', '234 Zira Street', 'Chandigarh', 'Chandigarh', 3);



SELECT * FROM doctors;

-- 20 values for appointments table to put date we alway12s use TO_DATE('YYYY-MM-DD hh24:mi', 'YYYY-MM-DD hh24:mi') dated must be between 2024-05-07 to 2024-05-09

-- INSERT INTO appointments
-- VALUES (1, 1, 101, TO_DATE('2024-05-07 16:00', 'YYYY-MM-DD HH24:MI'), 'The patient is found healthy', 'No treatment', 'UPC');

INSERT INTO appointments
VALUES (1, 1, 101, TO_DATE('2024-05-07 16:00', 'YYYY-MM-DD hh24:mi'), 'The patient is found healthy', 'No treatment','UPC');

INSERT INTO appointments
VALUES (2, 2,  102, TO_DATE('2024-05-07 20:00', 'YYYY-MM-DD hh24:mi'), 'The patient has Diabetes', 'Insulin injection', 'UPC');

INSERT INTO appointments
VALUES (3, 3,  103, TO_DATE('2024-05-07 10:00', 'YYYY-MM-DD hh24:mi'), 'The patient has Diabetes', 'Insulin injection','UPC');

INSERT INTO appointments
VALUES (4, 4,  104, TO_DATE('2024-05-09 15:00', 'YYYY-MM-DD hh24:mi'), 'The patient is found healthy', 'No treatment','UPC');

INSERT INTO appointments
VALUES (5, 5,  105, TO_DATE('2024-05-07 09:00', 'YYYY-MM-DD hh24:mi'),'The patient is found healthy', 'No treatment', 'UPC');

INSERT INTO appointments
VALUES (6, 6,  106, TO_DATE('2024-05-07 17:00', 'YYYY-MM-DD hh24:mi'), 'The patient has a blocked vein', 'Surgery needed','UPC');

INSERT INTO appointments
VALUES (7, 7,  107, TO_DATE('2024-05-09 11:00', 'YYYY-MM-DD hh24:mi'), 'The patient has Migraines', 'Medicine prescribed', 'UPC');

INSERT INTO appointments
VALUES (8, 8,  108, TO_DATE('2024-05-07 21:00', 'YYYY-MM-DD hh24:mi'),'The patient is found healthy', 'No treatment', 'UPC');

INSERT INTO appointments
VALUES (9, 9,  109, TO_DATE('2024-05-07 20:00', 'YYYY-MM-DD hh24:mi'), 'The patient has Diabetes', 'Insulin injection','UPC');

INSERT INTO appointments
VALUES (10, 10,  110, TO_DATE('2024-05-09 15:00', 'YYYY-MM-DD hh24:mi'), 'The patient is found healthy', 'No treatment','UPC');

INSERT INTO appointments
VALUES (11, 1,  111, TO_DATE('2024-05-08 10:00', 'YYYY-MM-DD hh24:mi'), 'The patient is found healthy', 'No treatment', 'UPC');

INSERT INTO appointments
VALUES (12, 2, 112, TO_DATE('2024-05-08 15:00', 'YYYY-MM-DD hh24:mi'), 'The patient has Diabetes', 'Insulin injection','UPC');

INSERT INTO appointments
VALUES (13, 3, 113, TO_DATE('2024-05-08 10:00', 'YYYY-MM-DD hh24:mi'), 'The patient has Migraines', 'Medicine prescribed','UPC');

INSERT INTO appointments
VALUES (14, 4, 114, TO_DATE('2024-05-08 11:00', 'YYYY-MM-DD hh24:mi'), 'The patient is found healthy', 'No treatment','UPC');

INSERT INTO appointments
VALUES (15, 5, 115, TO_DATE('2024-05-08 12:00', 'YYYY-MM-DD hh24:mi'), 'The patient is found healthy', 'No treatment','UPC');

INSERT INTO appointments
VALUES (16, 6, 110, TO_DATE('2024-05-09 16:00', 'YYYY-MM-DD hh24:mi'), 'The patient is found healthy', 'No treatment','UPC');

INSERT INTO appointments
VALUES (17, 7, 103, TO_DATE('2024-05-08 14:00', 'YYYY-MM-DD hh24:mi'), 'The patient has Migraines', 'Medicine prescribed','UPC');

INSERT INTO appointments
VALUES (18, 8, 111, TO_DATE('2024-05-08 17:00', 'YYYY-MM-DD hh24:mi'), 'The patient is found healthy', 'No treatment','UPC');

INSERT INTO appointments
VALUES (19, 9, 109, TO_DATE('2024-05-08 18:00', 'YYYY-MM-DD hh24:mi'), 'The patient has Migraines', 'Medicine prescribed','UPC');

INSERT INTO appointments
VALUES (20, 10, 101, TO_DATE('2024-05-08 19:00', 'YYYY-MM-DD hh24:mi'), 'The patient is found healthy', 'No treatment','UPC');

-- SELECT * FROM appointments ORDER BY appointment_date;

-- 20 values for bills table

INSERT INTO bills
VALUES (121, 1, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 500, 'MED','paid');

INSERT INTO bills
VALUES (122, 7, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 600, 'MED','unpaid');

INSERT INTO bills
VALUES (123, 1, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 700, 'APT','paid');

INSERT INTO bills
VALUES (124, 4, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 800, 'APT','paid');

INSERT INTO bills
VALUES (125, 5, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 900, 'MED','paid');

INSERT INTO bills
VALUES (126, 6, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 1000, 'MED','unpaid');

INSERT INTO bills
VALUES (127, 3, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 1100, 'APT','paid');

INSERT INTO bills
VALUES (128, 8, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 1200, 'APT','paid');

INSERT INTO bills
VALUES (129, 3, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 1300, 'APT','unpaid');

INSERT INTO bills
VALUES (130, 10, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 1400, 'MED','paid');

INSERT INTO bills
VALUES (131, 9, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1500, 'MED','paid');

INSERT INTO bills
VALUES (132, 2, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1600, 'MED','paid');

INSERT INTO bills
VALUES (133, 3, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1700, 'APT','unpaid');

INSERT INTO bills
VALUES (134, 4, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1800, 'APT','paid');

INSERT INTO bills
VALUES (135, 5, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1900, 'APT','paid');

INSERT INTO bills
VALUES (136, 6, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 2000, 'MED','paid');

INSERT INTO bills
VALUES (137, 7, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2100, 'MED','paid');

INSERT INTO bills
VALUES (138, 8, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2200, 'MED','unpaid');

INSERT INTO bills
VALUES (139, 5, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2300, 'APT','paid');

INSERT INTO bills
VALUES (140, 10, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2400, 'APT','unpaid');

-- SELECT * FROM bills ORDER BY date_bills;

-- 10 values for medicines table

INSERT INTO medicines 
VALUES (1, 'Crocin', 10, 100, 30);

INSERT INTO medicines 
VALUES (2, 'Paracetamol', 10, 100, 30);

INSERT INTO medicines 
VALUES (3, 'Aspirin', 15, 120, 30);

INSERT INTO medicines 
VALUES (4, 'Ibuprofen', 15, 110, 30);

INSERT INTO medicines 
VALUES (5, 'Cetrizine', 10, 100, 50);

INSERT INTO medicines 
VALUES (6, 'Azithromycin', 10, 80, 120);

INSERT INTO medicines 
VALUES (7, 'Amoxicillin', 15, 50, 250);

INSERT INTO medicines 
VALUES (8, 'Dolo', 10, 150, 30);

INSERT INTO medicines 
VALUES (9, 'Cough Syrup', 20, 20, 90);

INSERT INTO medicines 
VALUES (10, 'Vitamin C', 5, 60, 50);

SELECT * FROM medicines;

-- 20 values for prescriptions table

INSERT INTO prescriptions
VALUES (1, 2, 2, 2);

INSERT INTO prescriptions
VALUES (2, 2, 5, 1);

INSERT INTO prescriptions
VALUES (3, 14, 4, 2);

INSERT INTO prescriptions
VALUES (4, 5, 5, 3);

INSERT INTO prescriptions
VALUES (5, 5, 6, 1);

INSERT INTO prescriptions
VALUES (6, 9, 8, 1);

INSERT INTO prescriptions
VALUES (7, 6, 8, 3);

INSERT INTO prescriptions
VALUES (8, 9, 9, 2);

INSERT INTO prescriptions
VALUES (9, 9, 5, 1);

INSERT INTO prescriptions
VALUES (10, 9, 4, 1);

INSERT INTO prescriptions
VALUES (1, 14, 4, 1);

INSERT INTO prescriptions
VALUES (2, 12, 4, 2);

INSERT INTO prescriptions
VALUES (3, 14, 6, 3);

INSERT INTO prescriptions
VALUES (4, 18, 5, 3);

INSERT INTO prescriptions
VALUES (5, 2, 6, 2);

INSERT INTO prescriptions
VALUES (6, 15, 7, 1);

INSERT INTO prescriptions
VALUES (7, 18, 8, 2);

INSERT INTO prescriptions
VALUES (8, 18, 9, 2);

INSERT INTO prescriptions
VALUES (9, 19, 10, 2);

INSERT INTO prescriptions
VALUES (10, 15, 11, 2);

-- SELECT * FROM prescriptions ORDER BY appointment_id;
