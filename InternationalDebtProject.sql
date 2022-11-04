-- TABLE

SELECT *
FROM DataCampProjects..international_debt;

--Finding the number of distinct countries
SELECT COUNT(DISTINCT country_name) AS total_distinct_countries
FROM DataCampProjects..international_debt;


--Finding out the distinct debt indicators
SELECT DISTINCT indicator_code AS distinct_debt_indicators
FROM DataCampProjects..international_debt
ORDER BY distinct_debt_indicators;


--Totaling the amount of debt owed by the countries
SELECT ROUND(SUM(debt)/1000000, 2) AS total_debt
FROM DataCampProjects..international_debt;


--Country with the highest debt
SELECT country_name, SUM(debt) AS total_debt
FROM DataCampProjects..international_debt
GROUP BY country_name
ORDER BY total_debt DESC;


--Average amount of debt across indicators
SELECT indicator_code, indicator_name, AVG(debt) AS average_debt
FROM DataCampProjects..international_debt
GROUP BY indicator_code, indicator_name
ORDER BY average_debt DESC;


--The highest amount of principal repayments
SELECT country_name, indicator_name
FROM DataCampProjects..international_debt
WHERE debt = (SELECT 
                 MAX(debt)
             FROM DataCampProjects..international_debt
             WHERE indicator_code = 'DT.AMT.DLXF.CD');


--The most common debt indicator
SELECT indicator_code, COUNT(indicator_code) AS indicator_count
FROM DataCampProjects..international_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC



--Other viable debt issues and conclusion
SELECT country_name, MAX(debt) AS maximum_debt
FROM DataCampProjects..international_debt
GROUP BY country_name
ORDER BY maximum_debt DESC