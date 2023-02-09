
SELECT * 
FROM student
WHERE address = 'delhi' 
      AND age = 18 
	  AND phone IS NULL;




SELECT * 
FROM student
WHERE address = 'delhi' 
      AND age = 18 
	  AND phone IS NOT NULL;