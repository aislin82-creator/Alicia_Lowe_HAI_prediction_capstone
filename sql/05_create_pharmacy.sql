CREATE OR REPLACE TABLE `bigq-lab-project-al.mimic_analysis.pharmacy` AS
SELECT
    dx.subject_id,
    dx.hadm_id,
    dx.medication,
    dx.route,
    dx.frequency
FROM `physionet-data.mimiciv_3_1_hosp.pharmacy` dx
INNER JOIN `bigq-lab-project-al.mimic_analysis.core_patients` icu
     ON dx.subject_id = icu.subject_id
    AND dx.hadm_id = icu.hadm_id
    AND dx.starttime <= icu.outtime
    AND dx.stoptime >= icu.admittime;
