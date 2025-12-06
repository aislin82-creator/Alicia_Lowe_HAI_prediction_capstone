CREATE OR REPLACE TABLE `bigq-lab-project-al.mimic_analysis.diagnoses` AS
SELECT
    d.subject_id,
    d.hadm_id,
    c.stay_id,
    d.icd_code,
    d.icd_version,
    dx.long_title AS diagnosis_description
FROM `physionet-data.mimiciv_3_1_hosp.diagnoses_icd` d
LEFT JOIN `physionet-data.mimiciv_3_1_hosp.d_icd_diagnoses` dx
    ON d.icd_code = dx.icd_code
   AND d.icd_version = dx.icd_version
INNER JOIN `bigq-lab-project-al.mimic_analysis.core_patients` c
    USING (subject_id, hadm_id);
