# Notes
# 10 Students
# 2 Departments
# 3 Professors
# 4 Courses
# 8 Sections
# 25 Enrollment Records

# TO-DO LIST (WED 05/09/2018)
# Enrollment Records
# Queries


# Professor Info --------------------------------------------------------------------------------------------------------------------#
INSERT INTO Professor (SSN, P_Title, P_Addr, P_Name, Sex, Salary, P_Tel)
VALUES ('123-45-6789', 'Associate', '123 College Lane College Town, CA 12345', 'Billy Jean', 'M', 25000, '909-999-9876');

INSERT INTO Professor (SSN, P_Title, P_Addr, P_Name, Sex, Salary, P_Tel)
VALUES ('234-56-7891', 'Professor', '800 N State College Blvd, Fullerton, CA 92831', 'Shawn Wang', 'M', 50000, '657-278-7258');

INSERT INTO Professor (SSN, P_Title, P_Addr, P_Name, Sex, Salary, P_Tel)
VALUES ('368-72-2498', 'University', '642 Mini Street, Anaheim, CA 92462', 'Larry Lost', 'F', 40000, '782-657-9825');


# Department Info -------------------------------------------------------------------------------------------------------------------#
INSERT INTO Department (DNum, D_Name, Office, D_Tel, Chair_SSN)
VALUES ('CPSC', 'Computer Science', 'CS452', '714-235-3654', '234-56-7891');

INSERT INTO Department (DNum, D_Name, Office, D_Tel, Chair_SSN)
VALUES ('MATH', 'Mathematics', 'MH487', '714-672-4823', '123-45-6789');


# Student Info -----------------------------------------------------------------------------------------------------------------------# 
INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('123456789', 'Cristopher', 'Hernandez', '925 Nutwood Ave', 'Fullerton', 'CA', '92831', '714', '123-4567', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('234567890', 'Daniel', 'Domingo', '813 Commonwealth Ave', 'Fullerton', 'CA', '92831', '714', '234-5678', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('345678901', 'Scott', 'Ng', '1024 Yorba Linda Blvd', 'Fullerton', 'CA', '92831', '714', '345-6789', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('456789012', 'Michael', 'Shafae', '522 N Placentia Ave', 'Fullerton', 'CA', '92831', '714', '456-7890', 'MATH');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('567890123', 'Rachael', 'Greene', '24 E Chapman Ave', 'Fullerton', 'CA', '92831', '714', '567-8901', 'MATH');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('678901234', 'Louis', 'Baldwin', '811 Harmony Ln', 'Fullerton', 'CA', '92831', '714', '678-9012', 'MATH');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('789012345', 'Barry', 'Hammond', '459 Skyline Dr', 'Fullerton', 'CA', '92831', '714', '789-0123', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('890123456', 'Matthew', 'Jackson', '349 Quartz Ln', 'Fullerton', 'CA', '92831', '714', '901-1234', 'MATH');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('9012345678', 'Kenneth', 'Patrick', '847 Garnet Ln', 'Fullerton', 'CA', '92831', '714', '012-3456', 'CPSC');

INSERT INTO Student (CWID, St_Fname, St_Lname, Street, City, St_State, Zip, Tel_Area, Tel_Num, Major_Dep)
VALUES ('0123456789', 'Tammy', 'Waters', '340 Topaz Ln', 'Fullerton', 'CA', '92831', '714', '098-7654', 'MATH');



# Degree Info -----------------------------------------------------------------------------------------------------------------------#
INSERT INTO P_Degrees (SSN, Degree)
VALUES ((SELECT SSN FROM Professor WHERE P_Name = 'Billy Jean'), 'Phd Computer Science');

INSERT INTO P_Degrees (SSN, Degree)
VALUES ((SELECT SSN FROM Professor WHERE P_Name = 'Shawn Wang'), 'Phd Computer Science');

INSERT INTO P_Degrees (SSN, Degree)
VALUES ((SELECT SSN FROM Professor WHERE P_Name = 'Larry Lost'), 'Associates Math');


# Course Info -----------------------------------------------------------------------------------------------------------------------#
INSERT INTO Course (CNum, C_Title, TextB, Units, Dep)
VALUES ('CPSC-332', 'Database Design', '478974982374298', 3, (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));

INSERT INTO Course (CNum, C_Title, TextB, Units, Dep)
VALUES ('CPSC-481', 'AI', '278435582474292', 3, (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));

INSERT INTO Course (CNum, C_Title, TextB, Units, Dep)
VALUES ('MATH-125', 'Pre-Calculus', '178434556474831', 3, (SELECT DNum FROM Department WHERE D_Name = 'Mathematics'));

INSERT INTO Course (CNum, C_Title, TextB, Units, Dep)
VALUES ('CPSC-301', 'Programming Lab Practicum', '932169836201674', 2, (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));


# Section Info ---------------------------------------------------------------------------------------------------------------------#
INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('01', (SELECT CNum FROM Course WHERE CNum = 'MATH-125'), 'MH126', ('Mon', 'Wed'), 10:00:00, 11:15:00, 30, (SELECT SSN FROM Professor WHERE P_Name = 'Larry Lost'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('02', (SELECT CNum FROM Course WHERE CNum = 'MATH-125'), 'MH256', ('Tue'), 10:00:00, 12:50:00, 25, (SELECT SSN FROM Professor WHERE P_Name = 'Larry Lost'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('01', (SELECT CNum FROM Course WHERE CNum = 'CPSC-481'), 'CS105', ('Mon', 'Wed'), 12:00:00, 13:15:00, 28, (SELECT SSN FROM Professor WHERE P_Name = 'Billy Jean'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('04', (SELECT CNum FROM Course WHERE CNum = 'CPSC-332'), 'CS210', ('Fri'), 09:00:00, 11:50:00, 27, (SELECT SSN FROM Professor WHERE P_Name = 'Shawn Wang'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('01', (SELECT CNum FROM Course WHERE CNum = 'CPSC-301'), 'CS105', ('Tue', 'Thu'), 14:30:00, 15:45:00, 28, (SELECT SSN FROM Professor WHERE P_Name = 'Shawn Wang'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('02', (SELECT CNum FROM Course WHERE CNum = 'CPSC-301'), 'CS201', ('Tue', 'Thu'), 19:00:00, 20:15:00, 31, (SELECT SSN FROM Professor WHERE P_Name = 'Billy Jean'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('03', (SELECT CNum FROM Course WHERE CNum = 'CPSC-481'), 'CS115', ('Tue', 'Thu'), 17:30:00, 18:45:00, 24, (SELECT SSN FROM Professor WHERE P_Name = 'Billy Jean'));

INSERT INTO Course_Section (SecNum, CNum, Room, MDays, BegTime, EndTime, cap, Teacher)
VALUES ('03', (SELECT CNum FROM Course WHERE CNum = 'MATH-125'), 'MH256', ('Tue'), 11:30:00, 12:45:00, 25, (SELECT SSN FROM Professor WHERE P_Name = 'Shawn Wang'));


# Enrollment Records --------------------------------------------------------------------------------------------------------------#
INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '123456789', 'B');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '234567890', 'A');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '345678901', 'B+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '456789012', 'B+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '567890123', 'A');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '678901234', 'C+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '789012345', 'D');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '890123456', 'D+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '9012345678', 'A-');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'MATH-125', '0123456789', 'A+');

# 332

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '123456789', 'A-');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '890123456', 'C');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '9012345678', 'B');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '123456789', 'B+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('04', 'CPSC-332', '678901234', 'B+');

# 481

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'CPSC-481', '123456789', 'C-');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('01', 'CPSC-481', '234567890', 'F');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('03', 'CPSC-481', '345678901', 'B-');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('03', 'CPSC-481', '456789012', 'C+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('03', 'CPSC-481', '567890123', 'D');

# 301

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('02', 'CPSC-301', '890123456', 'B+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('02', 'CPSC-301', '678901234', 'A+');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('02', 'CPSC-301', '789012345', 'D');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('02', 'CPSC-301', '234567890', 'B-');

INSERT INTO Student_Course_Grade (SecNum, CNum, CWID, Grade)
VALUES ('02', 'CPSC-301', '456789012', 'A');


# Minor Section --------------------------------------------------------------------------------------------------------------#
INSERT INTO Student_Minors (CWID, DNum)
VALUES ((SELECT CWID FROM Student WHERE St_Fname = 'Rachael' AND St_Lname = 'Greene'), (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));

INSERT INTO Student_Minors (CWID, DNum)
VALUES ((SELECT CWID FROM Student WHERE St_Fname = 'Louis' AND St_Lname = 'Baldwin'), (SELECT DNum FROM Department WHERE D_Name = 'Computer Science'));

