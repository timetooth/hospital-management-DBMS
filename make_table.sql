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
