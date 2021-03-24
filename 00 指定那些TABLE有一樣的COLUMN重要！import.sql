--! if you wanna fetch data from different tables must use WHERE AND

-- student

	Std_id		Std_Name	Sex		Dep_Id		Religion	Club_Id
1	A00000    	林黛玉		0		ANTH      	R005      	C002      

--Record

	COURSE_ID	STD_ID		RCD
1	099A1300  	B1000008  	71

-- Course
	COURSE_ID	COURSE_NAME		     CREDIT   ACAD_YEAR SEM_ID  TEACHER_NAME
1	099A1300  	微生物的妙用			3		99		 2		王瑜琦

-- Department
	DEP_ID       DEP_NAME
1	ANTH      	人類學研究所

--Syntax

SELECT r.course_id , count(*)
FROM record r, course c
where r.COURSE_ID = c.COURSE_ID


--OUTPUTz
人類學研究所	陳承芬	微生物的妙用	71
