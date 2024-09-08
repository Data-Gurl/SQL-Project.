
--Select EmployeeID, FirstName, Age
--from EmployeeDemogragaphics
--UNION
--Select EmployeeID, Jobtitle, Salary
--from EmployeeSalary
--order by employeeID

--select*
--from EmployeeDemogragaphics
--full outer join EmployeeSalary
--ON EmployeeDemogragaphics.EmployeeID = EmployeeSalary.EmployeeID

--select Jobtitle, Avg(Salary)
--from EmployeeDemogragaphics
--full outer join EmployeeSalary
--ON EmployeeDemogragaphics.EmployeeID = EmployeeSalary.EmployeeID
--Where Jobtitle = 'Salesman'
--Group by Jobtitle

--SELECT FirstName,LastName,Jobtitle, Salary
--CASE
--  WHEN Age >30 THEN 'old'
-- ELSE 'young'
-- END
--  from EmployeeDemogragaphics
--where Age is NOT NULL
--Order by Age

--SELECT FirstName,LastName,Jobtitle, Salary,
--CASE
--  When Jobtitle = 'Salesman' Then Salary +(Salary*.10)
--  When Jobtitle = 'Accountant' Then Salary +(Salary*.05)
--  When Jobtitle = 'HR' Then Salary +(Salary*.0001)
--  ELSE Salary + (Salary *.03)
-- END AS SalaryAfterRaise
--  from EmployeeDemogragaphics
--  join EmployeeSalary
--  ON EmployeeDemogragaphics.EmployeeID = EmployeeSalary.EmployeeID


--  SELECT FirstName,LastName,Jobtitle, Salary,
--CASE
--  When Jobtitle = 'Salesman' Then Salary +(Salary*.10)
--  When Jobtitle = 'Accountant' Then Salary +(Salary*.05)
--  When Jobtitle = 'HR' Then Salary +(Salary*.0001)
--  ELSE Salary + (Salary *.03)
-- END AS SalaryAfterRaise
--  from EmployeeDemogragaphics
--  join EmployeeSalary
--  ON EmployeeDemogragaphics.EmployeeID = EmployeeSalary.EmployeeID

--select *
--from EmployeeDemogragaphics

--UPDATE EmployeeDemogragaphics
--SET Age = 31,Gender = 'female'
--Where FirstName = 'kolie' and LastName = 'house'

--Delete from EmployeeDemogragaphics
--where EmployeeID = 1005

--SELECT FirstName + ' ' + LastName AS fullname
--from EmployeeDemogragaphics

e;--with CTE_Employee as
--(select Firstname,LastName,Gender,Salary,
--COUNT(Gender) OVER (PARTITION by Gender) as TotalGender,
--AVG(Salary) OVER (PARTITION BY Gender) as AVGSalary
--from EmployeeDemogragaphics emp,
--JOIN EmployeeSalary sal
--ON EmployeeID = sal.EmployeeID
--WHERE Salary> '45000'
--)
--SELECT * 
--FROM CTE_Employe

--CREATE TABLE #TEMP_Employee
--( EmployeeID int,
--Jobtitle varchar(100),
--Salary int
--)
--select * from #TEMP_Employee
--insert into #TEMP_Employee Values('1001', 'HR','45000'
--)
--INSERT INTO #TEMP_Employee
--SELECT * FROM EmployeeSalary

--create procedure TEST
-- AS
--select * from EmployeeDemogragaphics


--EXEC TEST
-----SUBQUERIES----
Select * from employeeSalary
select EmployeeID, salary, (select AVG(Salary) from EmployeeSalary) AS AllAvgSalary from EmployeeSalary

