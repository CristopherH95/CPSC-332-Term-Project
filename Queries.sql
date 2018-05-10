#Professor queries

SELECT c.C_Title, CS.CNum, CS.MDays, CS.BegTime, CS.EndTime
FROM Professor
INNER JOIN Course_Section CS ON Professor.SSN = CS.Teacher
INNER JOIN Course c ON c.CNum = Course_Section.CNum
WHERE Professor.SSN = '123-45-6789'

	
SELECT Grade, COUNT(*) 
FROM Course c, Course_Section CS, Student_Course_Grade CSG 
WHERE c.CNum = 'MATH-125' 
	AND CS.CNum = c.CNum 
  AND CS.SecNum = '01' 
  AND CSG.CNum = 'MATH-125' 
  AND CSG.SecNum = '01' 
GROUP BY Grade;

#Student Queries

SELECT CS.SecNum, CS.Room, CS.MDays, CS.BegTime, CS.EndTime, COUNT(CSG.CWID)
FROM Course C, Course_Section CS
LEFT JOIN Student_Course_Grade CSG ON CSG.SecNum = CS.SecNum AND CSG.CNum = CS.CNum
WHERE C.CNum = 'MATH-125' AND C.CNum = CS.CNum
  GROUP BY CS.SecNum;

SELECT       
	c.C_Title,
	g.Grade
FROM         
	Student s
	INNER JOIN   Student_Course_Grade g ON g.CWID = s.CWID
	INNER JOIN   Course c ON c.CNUM = g.CNum
WHERE        
	s.CWID = 'cwid'  