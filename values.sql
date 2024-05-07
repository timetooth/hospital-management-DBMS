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

SELECT * FROM departments

-- 20 values for doctors table
INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (101, 'Dr. Ramesh', 'MD', 'Cardiologist', '123 Gandhi Road', 'Mumbai', 'Maharashtra', 1);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (102, 'Dr. Suresh', 'MBBS', 'Neurologist', '456 Nehru Street', 'Delhi', 'Delhi', 2);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (103, 'Dr. Mahesh', 'MBBS', 'Orthopedist', '789 Tagore Lane', 'Gandhinagar', 'Gujarat', 3);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (104, 'Dr. Rakesh', 'MD', 'Gynecologist', '321 Bose Avenue', 'Chennai', 'Tamil Nadu', 4);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (105, 'Dr. Ritu', 'MBBS', 'Pediatrician', '654 Thakur Street', 'Bangalore', 'Karnataka', 5);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (106, 'Dr. Rina', 'MBBS', 'Oncologist', '987 Bose Lane', 'Hyderabad', 'Telangana', 6);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (107, 'Dr. Rishi', 'MD', 'ENT Specialist', '123 Nehru Road', 'Pune', 'Maharashtra', 7);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (108, 'Dr. Ruchi', 'MBBS', 'Dermatologist', '456 Patel Street', 'Ahmedabad', 'Gujarat', 8);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (109, 'Dr. Roshan', 'MBBS', 'Psychiatrist', '789 Gandhi Lane', 'Jaipur', 'Rajasthan', 9);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (110, 'Dr. Rupali', 'MBBS', 'General Physician', '321 Tagore Street', 'Lucknow', 'Uttar Pradesh', 10);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (111, 'Dr. Rakesh', 'MD', 'Cardiologist', '123 Gandhi Road', 'Mumbai', 'Maharashtra', 1);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (112, 'Dr. Tina', 'MD', 'Cardiologist', '123 Nehru Road', 'Delhi', 'Delhi', 1);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (113, 'Dr. Sujata', 'MD', 'Oncologist', '345 Patel Road', 'Gandhinagar', 'Gujarat', 6);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (114, 'Dr. Leena', 'MD', 'Plastic Surgeon', '123 Sangat Street', 'Bathinda', 'Punjab', 11);

INSERT INTO doctors (doctor_id, name, qualification, specialization, addr_street, addr_city, addr_state, dept_id)
VALUES (115, 'Dr. Raiv', 'MD', 'Orthopedist', '234 Zira Street', 'Chandigarh', 'Chandigarh', 3);



SELECT * FROM doctors

-- 20 values for appointments table to put date we alway12s use TO_DATE('YYYY-MM-DD', 'YYYY-MM-DD') dated must be between 2024-05-07 to 2024-05-09

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (1, 1,12 101, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 08:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (2, 2,12 102, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 09:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (3, 3,12 103, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 10:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (4, 4,12 104, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TIMESTAMP '2024-05-09 08:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (5, 5,12 105, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 11:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (6, 6,12 106, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 13:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (7, 7,12 107, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TIMESTAMP '2024-05-09 10:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (8, 8,12 108, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 15:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (9, 9,12 109, TO_DATE('2024-05-07', 'YYYY-MM-DD'), TIMESTAMP '2024-05-07 16:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (10, 10,12 110, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TIMESTAMP '2024-05-09 11:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (11, 1,12 111, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 08:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (12, 2,12 112, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 09:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (13, 3,12 113, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 10:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (14, 4,12 114, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 11:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (15, 5,12 115, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 12:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (16, 6,12 110, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TIMESTAMP '2024-05-09 12:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (17, 7,12 103, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 13:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (18, 8,12 111, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 14:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (19, 9,12 109, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 15:00:00', 'UPC');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date, app_time, status)
VALUES (20, 10,12 101, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TIMESTAMP '2024-05-08 16:00:00', 'UPC');

SELECT * FROM appointments ORDER BY appointment_date;

-- 20 values for bills table

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (121, 1, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 500, 'Med','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (122, 7, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 600, 'Med','unpaid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (123, 1, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 700, 'Appointment','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (124, 4, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 800, 'Appointment','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (125, 5, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 900, 'Med','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (126, 6, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 1000, 'Med','unpaid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (127, 3, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 1100, 'Appointment','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (128, 8, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 1200, 'Appointment','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (129, 3, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 1300, 'Appointment','unpaid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1012, 10, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 1400, 'Med','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1121, 9, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1500, 'Med','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1122, 2, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1600, 'Med','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1123, 3, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1700, 'Appointment','unpaid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1124, 4, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1800, 'Appointment','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1125, 5, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 1900, 'Appointment','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1126, 6, TO_DATE('2024-05-09', 'YYYY-MM-DD'), 2000, 'Med','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1127, 7, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2100, 'Med','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1128, 8, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2200, 'Med','unpaid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (1129, 5, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2300, 'Appointment','paid');

INSERT INTO bills (bill_id, patient_id, date_bills, amount, bill_type, status)
VALUES (2012, 10, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 2400, 'Appointment','unpaid');

SELECT * FROM bills ORDER BY date_bills;

-- 10 values for medicines table

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (1, 'Crocin', 10, 100, 30);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (2, 'Paracetamol', 10, 100, 30);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (3, 'Aspirin', 15, 120, 30);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (4, 'Ibuprofen', 15, 110, 30);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (5, 'Cetrizine', 10, 100, 50);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (6, 'Azithromycin', 10, 80, 120);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (7, 'Amoxicillin', 15, 50, 250);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (8, 'Dolo', 10, 150, 30);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (9, 'Cough Syrup', 20, 20, 90);

INSERT INTO medicines (medicine_id, med_name, discount, qty, price)
VALUES (10, 'Vitamin C', 5, 60, 50);

SELECT * FROM medicines;

-- 20 values for prescriptions table

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (1, 2, 2, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (2, 2, 5, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (3, 3, 4, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (4, 5, 5, 3);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (5, 5, 6, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (6, 6, 8, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (7, 6, 8, 3);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (8, 8, 9, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (9, 9, 5, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (10, 9, 4, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (1, 11, 4, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (2, 12, 4, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (3, 14, 6, 3);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (4, 14, 5, 3);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (5, 2, 6, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (6, 15, 7, 1);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (7, 18, 8, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (8, 18, 9, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (9, 19, 10, 2);

INSERT INTO prescriptions (medicine_id, appointment_id, quantity, frequency)
VALUES (10, 15, 11, 2);


SELECT * FROM prescriptions ORDER BY appointment_id;
