CREATE TABLE Professor (
    SSN varchar(11) NOT NULL,
    P_Title varchar(20),
    P_Addr varchar(255),
    P_Name varchar(70),
    Sex ENUM('M', 'F'),
    Salary int,
    P_Tel varchar(20),
    PRIMARY KEY (SSN)
);

CREATE TABLE P_Degrees (
    SSN varchar(11) NOT NULL,
    Degree varchar(25) NOT NULL,
    CONSTRAINT PRIMARY KEY (SSN, Degree),
    FOREIGN KEY (SSN) REFERENCES Professor(SSN)
);

CREATE TABLE Department (
    DNum varchar(10) NOT NULL,
    D_Name varchar(70),
    Office varchar(20),
    D_Tel varchar(20),
    Chair_SSN varchar(11),
    PRIMARY KEY (DNum),
    FOREIGN KEY (Chair_SSN) REFERENCES Professor(SSN) 
);

CREATE TABLE Course (
    CNum varchar(12) NOT NULL,
    C_Title varchar(70),
    TextB varchar(70),
    Units tinyint,
    Dep varchar(10),
    PRIMARY KEY (CNum),
    FOREIGN KEY (Dep) REFERENCES Department(DNum)
);

CREATE TABLE Course_Pre_Req (
    Pre_CNum varchar(12) NOT NULL,
    Crse varchar(12) NOT NULL,
    CONSTRAINT PRIMARY KEY (Pre_CNum, Crse),
    FOREIGN KEY (Pre_CNum) REFERENCES Course(CNum),
    FOREIGN KEY (Crse) REFERENCES Course(CNum)
);

CREATE TABLE Student (
    CWID varchar(20) NOT NULL,
    St_Fname varchar(40),
    St_Lname varchar(40),
    Street varchar(40),
    City varchar(40),
    St_State char(2),
    Zip varchar(20),
    Tel_Area varchar(6),
    Tel_Num varchar(15),
    Major_Dep varchar(10),
    PRIMARY KEY (CWID),
    FOREIGN KEY (Major_Dep) REFERENCES Department(DNum)
);

CREATE TABLE Course_Section (
    SecNum varchar(15) NOT NULL,
    CNum varchar(12) NOT NULL,
    Room varchar(10),
    MDays SET('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'),
    BegTime Time,
    EndTime Time,
    cap smallint,
    Teacher varchar(11),
    CONSTRAINT PRIMARY KEY (SecNum, CNum),
    FOREIGN KEY (CNum) REFERENCES Course(CNum),
    FOREIGN KEY (Teacher) REFERENCES Professor(SSN)
);

CREATE TABLE Student_Course_Grade (
    SecNum varchar(15) NOT NULL,
    CNum varchar(12) NOT NULL,
    CWID varchar(20) NOT NULL,
    Grade ENUM('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F'),
    CONSTRAINT PRIMARY KEY (SecNum, CNum, CWID),
    FOREIGN KEY (SecNum) REFERENCES Course_Section(SecNum),
    FOREIGN KEY (CNum) REFERENCES Course(CNum),
    FOREIGN KEY (CWID) REFERENCES Student(CWID)
);

CREATE TABLE Student_Minors (
    CWID varchar(20) NOT NULL,
    DNum varchar(10) NOT NULL,
    CONSTRAINT PRIMARY KEY (CWID, DNum),
    FOREIGN KEY (CWID) REFERENCES Student(CWID),
    FOREIGN KEY (DNum) REFERENCES Department(DNum)
);