SELECT first_name, dpartment_id, salary,
       CASE dpartment_id WHEN 50 THEN 1.5*salary
                         WHEN 12 THEN 2.0*salary
       ELSE salary
       END "REVISED SALARY"
FROM Employee;