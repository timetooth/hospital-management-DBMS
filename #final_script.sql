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
    bill_type VARCHAR(3) CHECK(bill_type IN ('MED', 'OPD')),
    amount NUMBER NOT NULL,
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
    frequency NUMBER DEFAULT 1,
    other_instructions VARCHAR(255)
);
