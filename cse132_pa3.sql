CREATE TABLE STUDENT(
    SSN INT NOT NULL,
    FIRSTNAME VARCHAR(20) NOT NULL,
    MIDDLENAME VARCHAR(20),
    LASTNAME VARCHAR(20) NOT NULL,
    RESIDENCY VARCHAR(20) NOT NULL,
    STU_STATUS VARCHAR(20) NOT NULL,
    ENROLL VARCHAR(5) NOT NULL,
    PRIMARY KEY(SSN)
);

CREATE TABLE UNDERGRAD(
    UNDERGRAD_SSN INT NOT NULL,
    COLLEGE_NAME VARCHAR(50),
    MAJOR VARCHAR(10),
    MINOR VARCHAR(10),
    FIVEYEAR VARCHAR(5),
    PRIMARY KEY (UNDERGRAD_SSN),
    FOREIGN KEY (UNDERGRAD_SSN) REFERENCES STUDENT(SSN)
);


CREATE TABLE GRAD(
    GRAD_SSN INT NOT NULL,
    G_STATUS VARCHAR(20) NOT NULL,
    DEPT_NAME VARCHAR(40),
    CONCENTRATION VARCHAR(25),
    PRIMARY KEY (GRAD_SSN),
    FOREIGN KEY (GRAD_SSN) REFERENCES STUDENT(SSN),
    FOREIGN KEY (DEPT_NAME) REFERENCES DEPARTMENT(DEPT_NAME)
);

-- CREATE TABLE DEGREE(
--     STUDENT_SSN INT NOT NULL,
--     NAME VARCHAR(40) NOT NULL,
--     TOTAL_UNIT INT NOT NULL,,
--     MAJ_UNIT_LOWDIV INT NOT NULL,
--     MAJ_UNIT_UPDIV INT NOT NULL,
--     ELECTIVE INT NOT NULL,
--     GRAD_UNIT INT NOT NULL,
--     FOREIGN KEY (STUDENT_SSN) REFERENCES STUDENT(SSN),
--     CONSTRAINT PAST_DEGREE_KEY PRIMARY KEY (STUDENT_SSN,DEGREE_TYPE)
-- );

CREATE TABLE PAST_DEGREE(
    STUDENT_SSN INT NOT NULL,
    YEAR INT NOT NULL,
    TITLE VARCHAR(40) INT NOT NULL,
    UNIVERSITY VARCHAR(40),
    FOREIGN KEY (STUDENT_SSN) REFERENCES STUDENT(SSN),
    CONSTRAINT PAST_DEGREE_KEY PRIMARY KEY (STUDENT_SSN,YEAR,TITLE, UNIVERSITY)
);

CREATE TABLE CATEGORIES(
    DEPT_NAME VARCHAR(40) NOT NULL,
    COURSE_NUM VARCHAR(20) NOT NULL,
    NAME VARCHAR(30) NOT NULL,
    MIN_UNITS INT,
    MIN_GPA DECIMAL(4,3),
    FOREIGN KEY (DEPT_NAME) REFERENCES DEPARTMENT(DEPT_NAME),
    FOREIGN KEY (COURSE_NUM) REFERENCES COURSE(COURSE_NUM),
    CONSTRAINT CAT_KEY PRIMARY KEY(DEPT_NAME, COURSE_NUM, NAME)
);

CREATE TABLE CONCENTRATION(
    NAME VARCHAR(30) NOT NULL,
    DEPT_NAME VARCHAR(40) NOT NULL,
    COURSE_NUM VARCHAR(20) NOT NULL,
    MIN_GPA DECIMAL(4,3),
    MIN_UNITS INT,
    FOREIGN KEY (DEPT_NAME) REFERENCES DEPARTMENT(DEPT_NAME),
    FOREIGN KEY (COURSE_NUM) REFERENCES COURSE(COURSE_NUM),
    CONSTRAINT CONC_KEY PRIMARY KEY(DEPT_NAME, COURSE_NUM, NAME)
);


CREATE TABLE DEPARTMENT(
    DEPT_NAME VARCHAR(40) NOT NULL,
    MIN_GPA DECIMAL(4,3),
    MAJ_UNIT_UPDIV INT NOT NULL,
    MAJ_UNIT_LOWDIV INT NOT NULL,
    ELECTIVE INT NOT NULL,
    GRAD_UNIT INT NOT NULL,
    PRIMARY KEY(DEPT_NAME)
);

CREATE TABLE COURSE(
    COURSE_NUM VARCHAR(20) NOT NULL,
    DEPT_NAME VARCHAR(40) NOT NULL,
    GRADE_OPT VARCHAR(20) NOT NULL,
    LEVEL VARCHAR(10) NOT NULL,
    LAB_REQ VARCHAR(5) NOT NULL,
    UNITS_MIN VARCHAR(15) NOT NULL,
    UNITS_MAX VARCHAR(15) NOT NULL,
    FOREIGN KEY (DEPT_NAME) REFERENCES DEPARTMENT(DEPT_NAME),
    PRIMARY KEY (COURSE_NUM)
);

CREATE TABLE CLASS(
	TITLE VARCHAR(50) NOT NULL,
    COURSE_NUM VARCHAR(20) NOT NULL,
    QUARTER VARCHAR(20),
    CURRENT VARCHAR(5) NOT NULL,
    NEXT_QUARTER VARCHAR(20) NOT NULL, 
    YEAR INT NOT NULL,
    FOREIGN KEY (COURSE_NUM) REFERENCES COURSE (COURSE_NUM),
    PRIMARY KEY (TITLE)
    -- CONSTRAINT CLASS_KEY PRIMARY KEY(COURSE_NUM, QUARTER,YEAR)
);

CREATE TABLE SECTION(
    SECTION_ID INT NOT NULL,
    CLASS_SIZE INT NOT NULL,
    COURSE_NUM VARCHAR(20) NOT NULL,
    QUARTER VARCHAR(20),
    YEAR INT NOT NULL,
    FACULTY_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY (SECTION_ID),
    FOREIGN KEY (COURSE_NUM, QUARTER,YEAR) REFERENCES CLASS(COURSE_NUM, QUARTER,YEAR),
    FOREIGN KEY (FACULTY_NAME) REFERENCES FACULTY(F_NAME)
);

CREATE TABLE ELECTIVE(
	COURSE_NUM VARCHAR(20) NOT NULL,
	FOREIGN KEY (COURSE_NUM) REFERENCES COURSE(COURSE_NUM),
	CONSTRAINT ELECTIVE_KEY PRIMARY KEY (COURSE_NUM)
);

CREATE TABLE MEETING(
    SECTION_ID INT NOT NULL,
    CLASS_TYPE VARCHAR(10) NOT NULL,
    MONDAY VARCHAR(5), 
    TUESDAY VARCHAR(5), 
    WEDNESDAY VARCHAR(5), 
    THURSDAY VARCHAR(5), 
    FRIDAY VARCHAR(5),
    START_H INT NOT NULL,
    END_H INT NOT NULL, 
    START_M INT NOT NULL,
    END_M INT NOT NULL,
    START_AMPM VARCHAR(5) NOT NULL, 
    END_AMPM VARCHAR(5) NOT NULL,
    -- TIME VARCHAR(40) NOT NULL,
    -- DAY VARCHAR(15) NOT NULL,
    -- START_MONTH INT NOT NULL,
    -- START_DAY INT NOT NULL,
    -- END_MONTH INT NOT NULL,
    -- END_DAY INT NOT NULL,
    -- BUILDING VARCHAR(15) NOT NULL,
    -- ROOM VARCHAR(10) NOT NULL,
    -- MANDATORY VARCHAR(6),
    -- TYPE VARCHAR(8),
    FOREIGN KEY (SECTION_ID) REFERENCES SECTION(SECTION_ID),
    -- CONSTRAINT MEETING_KEY PRIMARY KEY (SECTION_ID,BUILDING,ROOM,TIME,DAY)
    CONSTRAINT MEETING_KEY PRIMARY KEY (SECTION_ID,TIME,DAY)
);

CREATE TABLE CALENDAR(
    DATE VARCHAR(20) NOT NULL,
    MONTH VARCHAR(15) NOT NULL,
    DAY INT NOT NULL,
);

CREATE TABLE REVIEWTIME(
    DATE VARCHAR(20) NOT NULL,
    RESERVE_TIME INT NOT NULL,
);

CREATE TABLE NOTPOSSIBLE_TEMP(
    DATE VARCHAR(20) NOT NULL,
    TIME INT NOT NULL,
);

CREATE TABLE S_TEMP(
    SECTION_ID INT NOT NULL,
    CONFLICT_ID INT,
    FOREIGN KEY (SECTION_ID) REFERENCES SECTION(SECTION_ID),
    FOREIGN KEY (CONFLICT_ID) REFERENCES SECTION(SECTION_ID)
);



CREATE TABLE TAKES(
    SSN VARCHAR(20) NOT NULL,
    SECTION_ID INT NOT NULL,
    GRADE_OPT VARCHAR(5),
    UNITS INT NOT NULL,
    CLASS_TYPE VARCHAR(10) NOT NULL,
    FOREIGN KEY (SSN) REFERENCES STUDENT(SSN),
    FOREIGN KEY (SECTION_ID) REFERENCES SECTION(SECTION_ID),
    FOREIGN KEY (CLASS_TYPE) REFERENCES MEETING(CLASS_TYPE),
    CONSTRAINT TAKES_KEY PRIMARY KEY (SSN, SECTION_ID)
);

CREATE TABLE TAKEN(
    SSN VARCHAR(20) NOT NULL,
    COURSE_NUM VARCHAR(20) NOT NULL,
    QUARTER VARCHAR(20) NOT NULL,
    GRADE_OPT VARCHAR(5),
    UNITS INT NOT NULL,
    GRADE VARCHAR(5),
    FOREIGN KEY (SSN) REFERENCES STUDENT(SSN),
    FOREIGN KEY (COURSE_NUM) REFERENCES COURSE(COURSE_NUM),
    CONSTRAINT TAKEN_KEY PRIMARY KEY (SSN, COURSE_NUM)
);

CREATE TABLE FACULTY(
    F_NAME VARCHAR(20) NOT NULL,
    TITLE VARCHAR(50),
    PRIMARY KEY(F_NAME)
);

CREATE TABLE FACULTY_TEACH(
	F_NAME VARCHAR(20) NOT NULL,
	COURSE_NUM VARCHAR(20) NOT NULL,
	SECTION_ID INT NOT NULL,
	QUARTER VARCHAR(20) NOT NULL,
	YEAR INT NOT NULL,
	FOREIGN KEY (F_NAME) REFERENCES FACULTY_TEACH(F_NAME),
	FOREIGN KEY (COURSE_NUM) REFERENCES COURSE(COURSE_NUM),
	FOREIGN KEY (SECTION_ID) REFERENCES SECTION(SECTION_ID),
	CONSTRAINT TEACH_KEY PRIMARY KEY (F_NAME, COURSE_NUM)	
);

CREATE TABLE GRADE_CONVERSION(
	LETTER_GRADE CHAR(2) NOT NULL,
	NUMBER_GRADE DECIMAL(2,1)
);
insert into grade_conversion values('A+', 4.0);
insert into grade_conversion values('A', 4.0);
insert into grade_conversion values('A-', 3.7);
insert into grade_conversion values('B+', 3.3);
insert into grade_conversion values('B', 3.0);
insert into grade_conversion values('B-', 2.7);
insert into grade_conversion values('C+', 2.3);
insert into grade_conversion values('C', 2.0);
insert into grade_conversion values('C-', 1.7);
insert into grade_conversion values('D', 1.0);
insert into grade_conversion values('F', 0.0);