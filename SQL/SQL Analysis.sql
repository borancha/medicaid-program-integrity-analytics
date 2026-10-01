--Drug row count

SELECT COUNT(*) AS Total_Rows
FROM dbo.drug_utilization;

--MLR row count

SELECT COUNT(*) AS Total_Rows
FROM dbo.mlr_summary;

--Drug years

SELECT
    Year,
    COUNT(*) AS Row_Count
FROM dbo.drug_utilization
GROUP BY Year
ORDER BY Year;

--Utilization types

SELECT
    Utilization_Type,
    COUNT(*) AS Row_Count
FROM dbo.drug_utilization
GROUP BY Utilization_Type
ORDER BY Row_Count DESC;

--Suppression status
SELECT
    Suppression_Used,
    COUNT(*) AS Row_Count
FROM dbo.drug_utilization
GROUP BY Suppression_Used
ORDER BY Row_Count DESC;

--Total reimbursement by state

SELECT
    State,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY State
ORDER BY Total_Reimbursement DESC;

--Total prescriptions by state

SELECT
    State,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY State
ORDER BY Total_Prescriptions DESC;

--Reimbursement by quarter

SELECT
    Year,
    Quarter,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

--Reimbursement by utilization type
SELECT
    Utilization_Type,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY Utilization_Type
ORDER BY Total_Reimbursement DESC;

--Top 10 states by reimbursement
SELECT TOP 10
    State,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY State
ORDER BY Total_Reimbursement DESC;

--Top 10 States by Medicaid Drug Reimbursement

SELECT TOP 10
    State,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY State
ORDER BY Total_Reimbursement DESC;

--Top 10 Drug Products by Reimbursement

SELECT TOP 10
    Product_Name,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY Product_Name
ORDER BY Total_Reimbursement DESC;

--Average Reimbursement per Prescription

SELECT
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions,
    SUM(Total_Amount_Reimbursed) /
        NULLIF(SUM(Number_of_Prescriptions), 0) AS Avg_Reimbursement_Per_Prescription
FROM dbo.drug_utilization
WHERE Suppression_Used = 0;

--State-Level Average Reimbursement per Prescription

SELECT TOP 20
    State,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions,
    SUM(Total_Amount_Reimbursed) /
        NULLIF(SUM(Number_of_Prescriptions), 0) AS Avg_Reimbursement_Per_Prescription
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY State
HAVING SUM(Number_of_Prescriptions) > 0
ORDER BY Avg_Reimbursement_Per_Prescription DESC;

--Medicaid MLR Summary by State and Report Year

SELECT
    State,
    Report_Year,
    COUNT(*) AS Report_Count,
    AVG(
        TRY_CAST(Adjusted_MLR AS DECIMAL(18,4))
    ) AS Average_Adjusted_MLR,
    SUM(
        TRY_CAST(
            Remittance_Dollar_Amount_for_MLR_Reporting_Period
            AS DECIMAL(18,2)
        )
    ) AS Total_Remittance
FROM dbo.mlr_summary
GROUP BY State, Report_Year
ORDER BY State, Report_Year;

--Quarterly Medicaid Drug Reimbursement Trend

SELECT
    Year,
    Quarter,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

--Reimbursement by Utilization Type

SELECT
    Utilization_Type,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY Utilization_Type
ORDER BY Total_Reimbursement DESC;

--Average Reimbursement per Prescription

SELECT
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions,
    SUM(Total_Amount_Reimbursed) /
        NULLIF(SUM(Number_of_Prescriptions), 0)
        AS Average_Reimbursement_Per_Prescription
FROM dbo.drug_utilization
WHERE Suppression_Used = 0;

--State Reimbursement and Prescription Analysis

SELECT TOP 20
    State,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions,
    SUM(Total_Amount_Reimbursed) /
        NULLIF(SUM(Number_of_Prescriptions), 0)
        AS Average_Reimbursement_Per_Prescription
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY State
HAVING SUM(Number_of_Prescriptions) > 0
ORDER BY Total_Reimbursement DESC;

--MLR Remittance by Report Year

SELECT
    Report_Year,
    COUNT(*) AS Report_Count,
    SUM(
        TRY_CAST(
            Remittance_Dollar_Amount_for_MLR_Reporting_Period
            AS DECIMAL(18,2)
        )
    ) AS Total_Remittance
FROM dbo.mlr_summary
GROUP BY Report_Year
ORDER BY Report_Year;

--Total Medicaid Drug Reimbursement

SELECT
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement
FROM dbo.drug_utilization
WHERE Suppression_Used = 0;

--Total Medicaid Prescriptions

SELECT
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0;

--Number of Geographic Areas Represented

SELECT
    COUNT(DISTINCT State) AS Geographic_Areas
FROM dbo.drug_utilization;

--Suppressed Record Percentage

SELECT
    CAST(
        100.0 * SUM(
            CASE
                WHEN Suppression_Used = 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(10,2)
    ) AS Suppressed_Record_Percentage
FROM dbo.drug_utilization;

--Total MLR Remittance

SELECT
    SUM(
        TRY_CAST(
            Remittance_Dollar_Amount_for_MLR_Reporting_Period
            AS DECIMAL(18,2)
        )
    ) AS Total_MLR_Remittance
FROM dbo.mlr_summary;

--State Reimbursement Benchmark

SELECT
    State,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    AVG(Total_Amount_Reimbursed) AS Average_Record_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY State
ORDER BY Total_Reimbursement DESC;

--Drug Product Reimbursement Analysis

SELECT TOP 100
    Product_Name,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY Product_Name
ORDER BY Total_Reimbursement DESC;

--Average Reimbursement per Prescription by Utilization Type

SELECT
    Utilization_Type,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions,
    SUM(Total_Amount_Reimbursed) /
        NULLIF(SUM(Number_of_Prescriptions), 0)
        AS Average_Reimbursement_Per_Prescription
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY Utilization_Type
ORDER BY Average_Reimbursement_Per_Prescription DESC;

--State and Quarter Reimbursement Analysis

SELECT
    State,
    Year,
    Quarter,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY State, Year, Quarter
ORDER BY State, Year, Quarter;

--High Reimbursement per Prescription Observations

SELECT TOP 100
    State,
    Product_Name,
    SUM(Total_Amount_Reimbursed) AS Total_Reimbursement,
    SUM(Number_of_Prescriptions) AS Total_Prescriptions,
    SUM(Total_Amount_Reimbursed) /
        NULLIF(SUM(Number_of_Prescriptions), 0)
        AS Average_Reimbursement_Per_Prescription
FROM dbo.drug_utilization
WHERE Suppression_Used = 0
GROUP BY State, Product_Name
HAVING SUM(Number_of_Prescriptions) > 0
ORDER BY Average_Reimbursement_Per_Prescription DESC;

