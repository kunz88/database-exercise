CREATE TABLE course(
    id SMALLINT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    duration SMALLINT UNSIGNED,
    activation_date DATE,
    end_date DATE,
    active TINYINT(1),
    cfu TINYINT UNSIGNED,
    CONSTRAINT pk_course PRIMARY KEY (id)
)
CREATE TABLE student(
    serial_number CHAR(8),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    date_of_birth DATE,
    email VARCHAR(20),
    address_id SMALLINT UNSIGNED,
    CONSTRAINT pk_student PRIMARY KEY(serial_number),
    CONSTRAINT student_address_id FOREIGN KEY(address_id)
    REFERENCES address(id)
)
CREATE TABLE professor(
    serial_number CHAR(6),
    last_name VARCHAR(30),
    date_of_birth DATE,
    salary INT UNSIGNED,
    email VARCHAR(20),
    address_id SMALLINT UNSIGNED,
    CONSTRAINT pk_professor PRIMARY KEY(serial_number),
    CONSTRAINT professor_address_id FOREIGN KEY(address_id)
    REFERENCES address(id)
)
CREATE TABLE course_student(
    student_id CHAR(8),
    course_id SMALLINT UNSIGNED,
    registration_date DATETIME DEFAULT NOW(),
    CONSTRAINT pk_course_student PRIMARY KEY(student_id,cOurse_id),
    CONSTRAINT fk_student_course FOREIGN KEY(student_id)
    REFERENCES student(serial_number),
    CONSTRAINT fk_course_student FOREIGN KEY(course_id)
    REFERENCES course(id)
)
CREATE TABLE course_professor(
    professor_id CHAR(8),
    course_id SMALLINT UNSIGNED,
    CONSTRAINT pk_course_professor PRIMARY KEY(professor_id,cOurse_id),
    CONSTRAINT fk_professor_cpurse FOREIGN KEY(professor_id)
    REFERENCES professor(serial_number),
    CONSTRAINT fk_course_professor FOREIGN KEY(course_id)
    REFERENCES course(id)
)
CREATE TABLE address(
    id SMALLINT UNSIGNED AUTO_INCREMENT,
    city VARCHAR(60) NOT NULL,
    street VARCHAR(100),
    street_number VARCHAR(10),
    postal_code VARCHAR(20),
    CONSTRAINT pk_address PRIMARY KEY(id)
)

/*inizio gli insert*/

INSERT INTO address (city, street, street_number, postal_code) VALUES
('Roma', 'Via Roma', '123', '00100'),
('Milano', 'Via Milano', '456', '20100'),
('Napoli', 'Via Napoli', '789', '80100'),
('Firenze', 'Via Firenze', '101', '50100'),
('Torino', 'Via Torino', '222', '10100'),
('Bologna', 'Via Bologna', '333', '40100'),
('Palermo', 'Via Palermo', '444', '90100'),
('Genova', 'Via Genova', '555', '16100'),
('Bari', 'Via Bari', '666', '70100'),
('Verona', 'Via Verona', '777', '37100');

INSERT INTO student (serial_number, first_name, last_name, date_of_birth, email, address_id) VALUES
('S100001', 'Mario', 'Rossi', '1995-03-15', 'mario@email.com', 1),
('S100002', 'Laura', 'Bianchi', '1996-07-20', 'laura@email.com', 2),
('S100003', 'Giovanni', 'Verdi', '1994-11-10', 'giovanni@email.com', 3),
('S100004', 'Anna', 'Esposito', '1997-05-05', 'anna@email.com', 4),
('S100005', 'Luigi', 'Ricci', '1993-09-30', 'luigi@email.com', 5);

INSERT INTO professor (serial_number, last_name, date_of_birth, salary, email, address_id) VALUES
('P10001', 'Ferrari', '1978-04-25', 60000, 'ferrari@email.com', 6),
('P10002', 'Russo', '1980-10-15', 55000, 'russo@email.com', 7),
('P10003', 'Conti', '1975-07-12', 62000, 'conti@email.com', 8),
('P10004', 'Moretti', '1982-02-08', 58000, 'moretti@email.com', 9),
('P10005', 'Villa', '1973-11-30', 65000, 'villa@email.com', 10);

INSERT INTO course (name, duration, activation_date, end_date, active, cfu) VALUES
('Corso di Matematica', 60, '2023-01-15', '2024-05-15', 1, 12),
('Corso di Informatica', 48, '2023-02-10', '2024-06-10', 1, 9),
('Corso di Storia', 45, '2023-03-05', '2024-07-05', 1, 6),
('Corso di Lingue Straniere', 36, '2023-04-20', '2023-08-20', 0, 6),
('Corso di Economia', 50, '2023-05-12', '2024-09-12', 1, 12);

-- Studente Mario Rossi iscritto ai Corsi 1, 2 e 3
INSERT INTO course_student (student_id, course_id, registration_date)
VALUES
('S100001', 1, '2023-01-16'),
('S100001', 2, '2023-02-11'),
('S100001', 3, '2023-03-06');

-- Studente Laura Bianchi iscritto ai Corsi 2 e 4
INSERT INTO course_student (student_id, course_id, registration_date)
VALUES
('S100002', 2, '2023-02-11'),
('S100002', 4, '2023-07-06');

-- Studente Giovanni Verdi iscritto al Corso 1
INSERT INTO course_student (student_id, course_id, registration_date)
VALUES
('S100003', 1, '2023-01-16');

-- Studente Anna Esposito iscritto ai Corsi 4 e 5
INSERT INTO course_student (student_id, course_id, registration_date)
VALUES
('S100004', 4, '2023-07-06'),
('S100004', 5, '2023-08-21');

-- Studente Luigi Ricci iscritto al Corso 3
INSERT INTO course_student (student_id, course_id, registration_date)
VALUES
('S100005', 3, '2023-03-06');

-- Professore Ferrari insegna Corsi 1, 2 e 3
INSERT INTO course_professor (professor_id, course_id)
VALUES
('P10001', 1),
('P10001', 2),
('P10001', 3);

-- Professore Russo insegna ai Corsi 2 e 4
INSERT INTO course_professor (professor_id, course_id)
VALUES
('P10002', 2),
('P10002', 4);

-- Professore Conti insegna al Corso 1
INSERT INTO course_professor (professor_id, course_id)
VALUES
('P10003', 1);

-- Professore Moretti insegna ai Corsi 4 e 5
INSERT INTO course_professor (professor_id, course_id)
VALUES
('P10004', 4),
('P10004', 5);

-- Professore Villa insegna al Corso 3
INSERT INTO course_professor (professor_id, course_id)
VALUES
('P10005', 3);

