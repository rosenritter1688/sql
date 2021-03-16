--sample 2
問題:
算出每家航空公司的飛航行員的總薪水是多比平均總薪水還多
->sample code
WITH temporaryTable(averageValue) as (SELECT avg(Salary)from Employee)
    SELECT Employee_id,Name, Salary 
    FROM Employee, temporaryTable  --! 兩個table都要打
    WHERE Employee.Salary > temporaryTable.averageValue;
/*
CREATE TABLE Pilot
(
    Employee_ID int,
    Airline VARCHAR(15),
    Name VARCHAR(10),
    Salary int
)


INSERT into pilot
VALUES 
    (70007,'Airbus 380','Kim',	60000),
    (70002,'Boeing','Laura',20000),
    (10027,'Airbus 380','Will',80050),
    (10778,'Airbus 380','Warren',80780),
    (115585,'Boeing','Smith',25000),
    (114070,'Airbus 380','Katy',78000)
*/


--? FYI   SELECT airline,sum(Salary)from Pilot group BY Airline
airline         
--------------- -----------
Airbus 380      298830
Boeing          45000
--? FYI SELECT avg(Salary)from Pilot
-----------
57305


WITH totalSalary(Airline, total) as
    (SELECT Airline, sum(Salary)
    FROM Pilot
    GROUP BY Airline),
    airlineAverage(avgSalary) as 
    (SELECT avg(Salary)
    FROM Pilot )
    SELECT Airline
    FROM totalSalary, airlineAverage
    WHERE totalSalary.total > airlineAverage.avgSalary;

    Airline
---------------
Airbus 380

(1 個資料列受到影響)