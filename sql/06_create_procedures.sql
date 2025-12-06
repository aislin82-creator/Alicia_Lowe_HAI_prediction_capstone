---Create a ICU patient procedure table
CREATE OR REPLACE TABLE `bigq-lab-project-al.mimic_analysis.procedures` AS
SELECT
    p.subject_id,
    p.hadm_id,
    icu.stay_id,
    p.icd_code,
    p.icd_version,
    p.chartdate,
    dp.long_title
FROM `physionet-data.mimiciv_3_1_hosp.procedures_icd` p
LEFT JOIN `physionet-data.mimiciv_3_1_hosp.d_icd_procedures` dp
    USING (icd_code, icd_version)
INNER JOIN `bigq-lab-project-al.mimic_analysis.core_patients` icu
    ON p.subject_id = icu.subject_id
   AND p.hadm_id = icu.hadm_id
   AND p.chartdate BETWEEN icu.intime AND icu.outtime;
