-- 1. Count Patient & Percentage of Male vs Female having OCD --Avg Obsession score by Gender
WITH data AS (
    SELECT
        Gender,
        COUNT("Patient ID") AS patient_count,
        ROUND(AVG("Y-BOCS Score (Obsessions)"), 2) AS avg_obs_score
    FROM
        health_data.ocd_patient_dataset
    GROUP BY
        Gender
)

SELECT
    SUM(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END) AS count_female,
    SUM(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END) AS count_male,
    ROUND(SUM(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END) /
          (SUM(patient_count)) * 100, 2) AS pct_female,
    ROUND(SUM(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END) /
          (SUM(patient_count)) * 100, 2) AS pct_male
FROM
    data;

-- 2. Count of Patients by Ethnicity and their respective Average Obsession Score

SELECT
	Ethnicity,
	COUNT("Patient ID") AS patient_count,
	AVG("Y-BOCS Score (Obsessions)") AS obs_score
FROM health_data.ocd_patient_dataset
GROUP BY 1
ORDER BY 2;

-- 3. Number of people diagnosed with OCD MoM

-- alter table health_data.ocd_patient_dataset
-- modify `OCD Diagnosis Date` date;
SELECT
    TO_CHAR("OCD Diagnosis Date", 'YYYY-MM-01') AS month,
    COUNT("Patient ID") AS patient_count
FROM
    health_data.ocd_patient_dataset
GROUP BY
    1
ORDER BY
    1;


-- 4. What is the most common Obsession Type (Count) & it's respective Average Obsession Score

SELECT
    "Obsession Type",
    COUNT("Patient ID") AS patient_count,
    ROUND(AVG("Y-BOCS Score (Obsessions)"), 2) AS obs_score
FROM
    health_data.ocd_patient_dataset
GROUP BY
    "Obsession Type"
ORDER BY
    patient_count DESC;
         

-- 5. What is the most common Compulsion type (Count) & it's respective Average Obsession Score

SELECT
    "Compulsion Type",
    COUNT("Patient ID") AS patient_count,
    ROUND(AVG("Y-BOCS Score (Obsessions)"), 2) AS obs_score
FROM
    health_data.ocd_patient_dataset
GROUP BY
    "Compulsion Type"
ORDER BY
    patient_count DESC;






  
    

	
	
	

