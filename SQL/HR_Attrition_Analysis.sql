CREATE DATABASE hr_analytics;
USE hr_analytics;
SELECT * FROM employee_attrition;

SELECT COUNT(*) FROM employee_attrition;

-- Total Employees
SELECT COUNT(DISTINCT(EmployeeNumber)) AS Total_Employees FROM employee_attrition;

-- Total Employees Who Left (Attrition)
SELECT COUNT(DISTINCT(EmployeeNumber)) AS Attrition_Employees FROM employee_attrition WHERE Attrition="Yes";

-- Attrition Rate (%)
SELECT ROUND(
			COUNT(DISTINCT CASE WHEN Attrition="Yes" THEN EmployeeNumber 
								END)*100.0 
                                / COUNT(DISTINCT EmployeeNumber),2)
         AS Attrition_Rate                       
FROM employee_attrition;                             

-- Department-wise Attrition Analysis
SELECT Department,
	   COUNT(DISTINCT EmployeeNumber) AS Total_Employees,
       COUNT(DISTINCT CASE
                      WHEN Attrition="Yes" THEN EmployeeNumber
                      END) AS Attrition_Employees,
        ROUND(COUNT(DISTINCT CASE 
                             WHEN Attrition="Yes" THEN EmployeeNumber
                             END)*100.0/ COUNT(DISTINCT EmployeeNumber),2)
			  AS Attrition_Rate
FROM employee_attrition
GROUP BY Department 
ORDER BY Attrition_Rate DESC;

-- Job Role-wise Attrition
SELECT JobRole,
	   COUNT(DISTINCT EmployeeNumber) AS Total_Employees,
       COUNT(DISTINCT CASE
                      WHEN Attrition="Yes" THEN EmployeeNumber
                      END) AS Attrition_Employees,
        ROUND(COUNT(DISTINCT CASE 
                             WHEN Attrition="Yes" THEN EmployeeNumber
                             END)*100.0/ COUNT(DISTINCT EmployeeNumber),2)
			  AS Attrition_Rate
FROM employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;

-- Gender-wise Attrition
SELECT Gender,
	   COUNT(DISTINCT EmployeeNumber) AS Total_Employees,
       COUNT(DISTINCT CASE
                      WHEN Attrition="Yes" THEN EmployeeNumber
                      END) AS Attrition_Employees,
        ROUND(COUNT(DISTINCT CASE 
                             WHEN Attrition="Yes" THEN EmployeeNumber
                             END)*100.0/ COUNT(DISTINCT EmployeeNumber),2)
			  AS Attrition_Rate
FROM employee_attrition
GROUP BY Gender
ORDER BY Attrition_Rate DESC;

-- Overtime-wise Attrition Analysis
SELECT OverTime,
	   COUNT(DISTINCT EmployeeNumber) AS Total_Employees,
       COUNT(DISTINCT CASE
                      WHEN Attrition="Yes" THEN EmployeeNumber
                      END) AS Attrition_Employees,
        ROUND(COUNT(DISTINCT CASE 
                             WHEN Attrition="Yes" THEN EmployeeNumber
                             END)*100.0/ COUNT(DISTINCT EmployeeNumber),2)
			  AS Attrition_Rate
FROM employee_attrition
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;

-- Age Group-wise Attrition Analysis
SELECT 
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '55+'
    END AS Age_Group,
    COUNT(DISTINCT EmployeeNumber) AS Total_Employees,
    COUNT(DISTINCT CASE 
        WHEN Attrition = 'Yes' THEN EmployeeNumber 
    END) AS Attrition_Employees,
    ROUND(
        COUNT(DISTINCT CASE 
            WHEN Attrition = 'Yes' THEN EmployeeNumber 
        END) * 100.0 / COUNT(DISTINCT EmployeeNumber),
        2
    ) AS Attrition_Rate
FROM employee_attrition
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;

-- Salary-wise Attrition Analysis
SELECT 
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3K'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN '3K-6K'
        WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN '6K-10K'
        WHEN MonthlyIncome BETWEEN 10001 AND 15000 THEN '10K-15K'
        ELSE '15K+'
    END AS Salary_Group,

    COUNT(DISTINCT EmployeeNumber) AS Total_Employees,
    COUNT(DISTINCT CASE 
        WHEN Attrition = 'Yes' THEN EmployeeNumber 
    END) AS Attrition_Employees,

    ROUND(
        COUNT(DISTINCT CASE 
            WHEN Attrition = 'Yes' THEN EmployeeNumber 
        END) * 100.0 /
        COUNT(DISTINCT EmployeeNumber),
        2
    ) AS Attrition_Rate
FROM employee_attrition
GROUP BY Salary_Group
ORDER BY Attrition_Rate DESC;

-- Years at Company-wise Attrition Analysis
SELECT CASE
			WHEN YearsAtCompany BETWEEN 0 AND 2 THEN '0-2 Years'	
            WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
            WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
            ELSE '10+ Years'
       END AS Tenure_Group,
       COUNT(DISTINCT EmployeeNumber) AS Total_Employees,
       COUNT(DISTINCT CASE	
                          WHEN Attrition='Yes' THEN EmployeeNumber
					  END ) AS Attrition_Employees,
       ROUND(COUNT(DISTINCT CASE 
                                WHEN Attrition='Yes' THEN EmployeeNumber
                            END)*100.0
                            /
             COUNT(DISTINCT EmployeeNumber),2) AS Attrition_Rate
FROM employee_attrition
GROUP BY Tenure_Group
ORDER BY Attrition_Rate DESC;        

-- Marital Status-wise Attrition Analysis
SELECT MaritalStatus, 
       COUNT(DISTINCT EmployeeNumber) AS Total_Employees,
       COUNT(DISTINCT CASE
                          WHEN Attrition='Yes' THEN EmployeeNumber
                      END) AS Attrition_Employees,
                      
       ROUND(COUNT(DISTINCT CASE
                                WHEN Attrition='Yes' THEN EmployeeNumber
                            END)*100.0 
                            /
             COUNT(DISTINCT EmployeeNumber),2) AS Attrition_Rate
FROM employee_attrition
GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC;           

-- Job Satisfaction-wise Attrition Analysis
SELECT JobSatisfaction,
		COUNT(DISTINCT EmployeeNumber) AS Total_Employees,
        COUNT(DISTINCT CASE
                           WHEN Attrition='Yes' THEN EmployeeNumber
                       END) AS Attrition_Employees,
        ROUND(COUNT(DISTINCT CASE 
                                 WHEN Attrition='Yes' THEN EmployeeNumber
                             END)*100.0  
                             /
              COUNT(DISTINCT employeeNumber),2) AS Attrition_Rate       
FROM employee_attrition
GROUP BY JobSatisfaction
ORDER BY Attrition_Rate DESC;              
				
