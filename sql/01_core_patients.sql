-- Core patient table with ICU stays > 48 hours (1 row per stay)
CREATE OR REPLACE TABLE `bigq-lab-project-al.mimic_analysis.core_patients` AS
SELECT
    p.subject_id,
    p.gender,
    p.anchor_age,
    a.hadm_id,
    a.admission_type,
    a.admission_location,
    a.hospital_expire_flag,
    i.stay_id,
    i.intime,
    i.outtime,
    i.los AS icu_los
FROM `physionet-data.mimiciv_3_1_hosp.admissions` a
JOIN `physionet-data.mimiciv_3_1_hosp.patients` p
    USING (subject_id)
JOIN `physionet-data.mimiciv_3_1_icu.icustays` i
    USING (subject_id, hadm_id)
WHERE i.los > 2;
