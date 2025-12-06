-- Microbiology results table for ICU core patients
CREATE OR REPLACE TABLE `bigq-lab-project-al.mimic_analysis.microbiology` AS
SELECT
    m.subject_id,
    m.hadm_id,
    icu.stay_id,
    m.chartdate,
    m.charttime,
    m.spec_itemid,
    m.spec_type_desc,
    m.test_itemid,
    m.test_name,
    m.org_itemid,
    m.org_name,
    m.ab_itemid,
    m.ab_name,
    m.interpretation,
    m.comments
FROM `physionet-data.mimiciv_3_1_hosp.microbiologyevents` m
INNER JOIN `bigq-lab-project-al.mimic_analysis.core_patients` icu
    USING(subject_id, hadm_id)
WHERE m.charttime BETWEEN icu.intime AND icu.outtime;
