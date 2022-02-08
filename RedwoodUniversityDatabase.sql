REM   Script: Session 02
REM   Database for Redwood University 

CREATE TABLE Departments( 
department_no int PRIMARY KEY,     
department_name varchar(255), 
department_chair varchar(255), 
department_employees int, 
CONSTRAINT CK_deptname CHECK (department_name LIKE 'Department%') 
);

CREATE TABLE Majors( 
    major_code varchar(3) PRIMARY KEY, 
    major_name varchar(255), 
    department_no int, 
    CONSTRAINT FK_deptno FOREIGN KEY (department_no) REFERENCES Departments(department_no), 
    CONSTRAINT CK_majorcode CHECK (LENGTH(major_code)=3) 
);

CREATE TABLE Events( 
    event_name varchar(255) PRIMARY KEY, 
    event_start_date date, 
    event_end_date date, 
    department_no int NOT NULL, 
    CONSTRAINT FK_departmentno FOREIGN KEY (department_no) REFERENCES Departments(department_no), 
    CONSTRAINT CK_startdate CHECK (event_end_date>event_start_date), 
    CONSTRAINT CK_enddate CHECK (event_start_date>TO_DATE('2022/02/07','YYYY/MM/DD')) 
);

CREATE TABLE Students( 
    student_id int PRIMARY KEY, 
    student_name varchar(255), 
    student_initial varchar(5), 
    event_name varchar(255) NOT NULL, 
    major_code varchar(3) NOT NULL, 
CONSTRAINT FK_eventname FOREIGN KEY (event_name) REFERENCES Events(event_name),     
CONSTRAINT FK_majorcode FOREIGN KEY (major_code) REFERENCES Majors(major_code), 
CONSTRAINT CK_studentinitial CHECK (LENGTH(student_initial)>=2) 
);

INSERT INTO Departments 
VALUES (3, 'Department of Biology', 'Cameron VanDyke', 30);

INSERT INTO Departments 
VALUES (1, 'Department of Chemistry', 'Ashley Howell', 25);

INSERT INTO Departments 
VALUES (2, 'Department of Mathematics', 'Sam Jones', 17);

INSERT INTO Departments 
VALUES (4, 'Department of Computer Science', 'James Brown', 20);

INSERT INTO Departments 
VALUES (5, 'Department of Physics', 'Julia Smith', 27);

INSERT INTO Majors 
VALUES ('BIO', 'Biology', 3);

INSERT INTO Majors 
VALUES ('CSC', 'Computer Science', 4);

INSERT INTO Majors 
VALUES ('MTH', 'Mathematics', 2);

INSERT INTO Majors 
VALUES ('CHM', 'Chemistry', 1);

INSERT INTO Majors 
VALUES ('PHY', 'Physics', 5);

INSERT INTO Events 
VALUES ('Biology Job Fair', DATE '2022-02-18', DATE '2022-02-20', 3);

INSERT INTO Events 
VALUES ('Engineering Seminar', DATE '2022-03-24', DATE '2022-03-25', 5);

INSERT INTO Events 
VALUES ('STEM Expo', DATE '2022-03-15', DATE '2022-03-21', 1);

INSERT INTO Events 
VALUES ('Programming Workshop', DATE '2022-02-26', DATE '2022-02-28', 4);

INSERT INTO Events 
VALUES ('Free MTH Tutoring', DATE '2022-04-15', DATE '2022-04-30', 2);

INSERT INTO Students 
VALUES (12345,'Lindsay Cruz','LC', 'Biology Job Fair','BIO');

INSERT INTO Students 
VALUES (12346,'Corinne Badeer','CB', 'Biology Job Fair','BIO');

INSERT INTO Students 
VALUES (12349,'Jess Tatz','JT', 'STEM Expo','MTH');

INSERT INTO Students 
VALUES (12348,'Benjamin Essenfeld','BE', 'STEM Expo','CHM');

INSERT INTO Students  
VALUES (123457,'Oliveah Hope','OH','Engineering Seminar','PHY');

