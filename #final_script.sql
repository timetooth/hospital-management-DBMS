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
    addr_city VARCHAR(50),
    addr_state VARCHAR(30) CONSTRAINT patient_state_constraint CHECK(addr_state IN ('Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka', 'Kerala', 'Maharashtra', 'Madhya Pradesh', 'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Tripura', 'Telangana', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal','Andaman and Nicobar Islands', 'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Delhi', 'Jammu and Kashmir', 'Ladakh', 'Lakshadweep', 'Puducherry')),
	patient_type VARCHAR(3) CONSTRAINT patient_type_constraint CHECK(patient_type IN ('IN', 'OUT'))
);

--department table
CREATE TABLE departments(
    dept_id NUMBER PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    dept_head NUMBER
);

-- doctors table
CREATE TABLE doctors(
    doctor_id NUMBER PRIMARY KEY,
    name VARCHAR(50),
    qualification VARCHAR(50),
    specialization VARCHAR(50),
    addr_street VARCHAR(50),
    addr_city VARCHAR(50),
    addr_state VARCHAR(30) CONSTRAINT doctor_state_constraint CHECK(addr_state IN ('Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka', 'Kerala', 'Maharashtra', 'Madhya Pradesh', 'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Tripura', 'Telangana', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal''Andaman and Nicobar Islands', 'Chandigarh', 'Dadra and Nagar Haveli and Daman and Diu', 'Delhi', 'Jammu and Kashmir', 'Ladakh', 'Lakshadweep', 'Puducherry')),
    dept_id NUMBER,
    CONSTRAINT FK_doctors FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

--appointments table
CREATE TABLE appointments(
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES patients(patient_id),
    doctor_id NUMBER REFERENCES doctors(doctor_id),
    app_time TIMESTAMP,
    appointment_date DATE,
    status VARCHAR(4) CONSTRAINT appointment_status_constraint CHECK(status in ('UPC', 'CAN', 'ATT', 'NATT'))
);

--Bills Table
CREATE TABLE bills (
    bill_id NUMBER PRIMARY KEY,
    patient_id NUMBER NOT NULL,
    date_bills DATE,
    amount NUMBER NOT NULL,
    status VARCHAR(20) CHECK(status IN ('payed','unpaid')),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE
);

-- medicines table
CREATE TABLE Medicines (
    medicine_id NUMBER PRIMARY KEY,
    med_name VARCHAR(20),
    discount NUMBER NOT NULL CHECK (discount >= 0 AND discount <= 100),
    qty NUMBER NOT NULL,
    price NUMBER NOT NULL
);
-- prescriptions Table
CREATE TABLE prescriptions(
    medicine_id NUMBER,
    appointment_id NUMBER,
    quantity NUMBER DEFAULT 1,
    frequency NUMBER DEFAULT 1,
    CONSTRAINT PK_prscriptions PRIMARY KEY(medicine_id, appointment_id),
    CONSTRAINT FK_MED FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id),
    CONSTRAINT FK_APPOINTMENT FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);

-- values for all the tables -enter in this particular order
-- 10 values for patients table
INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (1, 'Rahul', 'Gupta', '9998887777', '123 Gandhi Road', 'Mumbai', 'Maharashtra', 'IN');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (2, 'Priya', 'Patel', '8887776666', '456 Nehru Street', 'Delhi', 'Delhi', 'OUT');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (3, 'Amit', 'Sharma', '7776665555', '789 Tagore Lane', 'Gandhinagar', 'Gujarat', 'IN');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (4, 'Sneha', 'Singh', '6665554444', '321 Bose Avenue', 'Chennai', 'Tamil Nadu', 'IN');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (5, 'Raj', 'Verma', '8554443333', '654 Thakur Street', 'Bangalore', 'Karnataka', 'OUT');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (6, 'Neha', 'Jain', '7443332222', '987 Bose Lane', 'Hyderabad', 'Telangana', 'OUT');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (7, 'Vivek', 'Mishra', '8332221111', '123 Nehru Road', 'Pune', 'Maharashtra', 'IN');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (8, 'Anjali', 'Yadav', '9221110000', '456 Patel Street', 'Ahmedabad', 'Gujarat', 'OUT');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (9, 'Suresh', 'Kumar', '9110009999', '789 Gandhi Lane', 'Jaipur', 'Rajasthan', 'IN');

INSERT INTO patients (patient_id, first_name, last_name, phone_number, addr_street, addr_city, addr_state, patient_type) 
VALUES (10, 'Meera', 'Shah', '9998888456', '321 Tagore Street', 'Lucknow', 'Uttar Pradesh', 'OUT');

select * from patients;
-- 10 values for departments table
INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (1, 'Cardiology', 'Block A', 101);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (2, 'Neurology', 'Block B', 102);

INSERT INTO departments (dept_id, name, location, dept_head)
VALUES (3, 'Orthopedics', 'Block C', 103);

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
VALUES (10, 'General Medicine', 'Block J', 110);

SELECT * FROM departments;

-- 20 values for doctors table
INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (101, 'Dr. Ramesh', 'MBBS', 'Cardiologist', '123 Gandhi Road', 'Mumbai', 'Maharashtra', 1);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (102, 'Dr. Suresh', 'MBBS', 'Neurologist', '456 Nehru Street', 'Delhi', 'Delhi', 2);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (103, 'Dr. Mahesh', 'MBBS', 'Orthopedist', '789 Tagore Lane', 'Gandhinagar', 'Gujarat', 3);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (104, 'Dr. Rakesh', 'MBBS', 'Gynecologist', '321 Bose Avenue', 'Chennai', 'Tamil Nadu', 4);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (105, 'Dr. Ritu', 'MBBS', 'Pediatrician', '654 Thakur Street', 'Bangalore', 'Karnataka', 5);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (106, 'Dr. Rina', 'MBBS', 'Oncologist', '987 Bose Lane', 'Hyderabad', 'Telangana', 6);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (107, 'Dr. Rishi', 'MBBS', 'ENT Specialist', '123 Nehru Road', 'Pune', 'Maharashtra', 7);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (108, 'Dr. Ruchi', 'MBBS', 'Dermatologist', '456 Patel Street', 'Ahmedabad', 'Gujarat', 8);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (109, 'Dr. Roshan', 'MBBS', 'Psychiatrist', '789 Gandhi Lane', 'Jaipur', 'Rajasthan', 9);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (110, 'Dr. Rupali', 'MBBS', 'General Physician', '321 Tagore Street', 'Lucknow', 'Uttar Pradesh', 10);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (111, 'Dr. Rakesh', 'MBBS', 'Cardiologist', '123 Gandhi Road', 'Mumbai', 'Maharashtra', 1);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (112, 'Dr. Suresh', 'MBBS', 'Neurologist', '456 Nehru Street', 'Delhi', 'Delhi', 2);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (113, 'Dr. Mahesh', 'MBBS', 'Orthopedist', '789 Tagore Lane', 'Gandhinagar', 'Gujarat', 3);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (114, 'Dr. Rakesh', 'MBBS', 'Gynecologist', '321 Bose Avenue', 'Chennai', 'Tamil Nadu', 4);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (115, 'Dr. Ritu', 'MBBS', 'Pediatrician', '654 Thakur Street', 'Bangalore', 'Karnataka', 5);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (116, 'Dr. Rina', 'MBBS', 'Oncologist', '987 Bose Lane', 'Hyderabad', 'Telangana', 6);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (117, 'Dr. Rishi', 'MBBS', 'ENT Specialist', '123 Nehru Road', 'Pune', 'Maharashtra', 7);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (118, 'Dr. Ruchi', 'MBBS', 'Dermatologist', '456 Patel Street', 'Ahmedabad', 'Gujarat', 8);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (119, 'Dr. Roshan', 'MBBS', 'Psychiatrist', '789 Gandhi Lane', 'Jaipur', 'Rajasthan', 9);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (120, 'Dr. Rupali', 'MBBS', 'General Physician', '321 Tagore Street', 'Lucknow', 'Uttar Pradesh', 10);

SELECT * FROM doctors;

-- 20 values for appointments table to put date we always use TO_DATE('YYYY-MM-DD', 'YYYY-MM-DD') dated must be between 2024-05-07 to 2024-05-09
INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (1, 1, 101, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 08:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (2, 2, 102, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 09:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (3, 3, 103, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 10:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (4, 4, 104, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TIMESTAMP '2024-05-09 08:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (5, 5, 105, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 11:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (6, 6, 106, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 13:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (7, 7, 107, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TIMESTAMP '2024-05-09 10:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (8, 8, 108, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 15:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (9, 9, 109, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 16:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (10, 10, 110, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TIMESTAMP '2024-05-09 11:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (11, 1, 111, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 08:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (12, 2, 112, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 09:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (13, 3, 113, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 10:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (14, 4, 114, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 11:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (15, 5, 115, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 12:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (16, 6, 116, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TIMESTAMP '2024-05-09 12:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (17, 7, 117, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 13:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (18, 8, 118, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 14:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (19, 9, 119, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 15:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (20, 10, 120, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 16:00:00', 'UPC');

SELECT * FROM appointments ORDER BY appointment_date;

-- 20 values for bills table

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (1, 1, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 500, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (2, 2, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 600, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (3, 3, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 700, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (4, 4, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 800, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (5, 5, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 900, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (6, 6, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 1000, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (7, 7, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 1100, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (8, 8, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 1200, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (9, 9, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 1300, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (10, 10, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 1400, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (11, 1, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1500, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (12, 2, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1600, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (13, 3, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1700, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (14, 4, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1800, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (15, 5, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1900, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (16, 6, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 2000, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (17, 7, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2100, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (18, 8, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2200, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (19, 9, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2300, 'payed');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, status)
VALUES (20, 10, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2400, 'payed');

SELECT * FROM bills ORDER BY date_bills;

-- 10 values for medicines table

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (1, 'Crocin', 5, 100, 10);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (2, 'Paracetamol', 10, 200, 20);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (3, 'Aspirin', 15, 300, 30);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (4, 'Brufen', 20, 400, 40);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (5, 'Cetrizine', 25, 500, 50);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (6, 'Azithromycin', 30, 600, 60);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (7, 'Amoxicillin', 35, 700, 70);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (8, 'Dolo', 40, 800, 80);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (9, 'Cough Syrup', 45, 900, 90);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (10, 'Vitamin C', 50, 1000, 100);

SELECT * FROM medicines;

-- 20 values for prescriptions table

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (1, 1, 2, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (2, 2, 5, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (3, 3, 4, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (4, 4, 5, 3);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (5, 5, 6, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (6, 6, 8, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (7, 7, 8, 3);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (8, 8, 9, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (9, 9, 5, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (10, 10, 4, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (1, 11, 4, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (2, 12, 4, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (3, 13, 6, 3);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (4, 14, 5, 3);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (5, 15, 6, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (6, 16, 7, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (7, 17, 8, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (8, 18, 9, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (9, 19, 10, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (10, 20, 11, 2);

SELECT * FROM prescriptions ORDER BY appointment_id;