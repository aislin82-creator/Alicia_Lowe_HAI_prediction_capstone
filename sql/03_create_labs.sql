-- Lab results table for ICU core patients
CREATE OR REPLACE TABLE `bigq-lab-project-al.mimic_analysis.labs` AS
SELECT
    l.subject_id,
    l.hadm_id,
    icu.stay_id,
    l.itemid,
    l.charttime,
    l.value,
    l.valuenum,
    l.flag,
    l.comments,
    dl.label,
    dl.fluid
FROM `physionet-data.mimiciv_3_1_hosp.labevents` l
LEFT JOIN `physionet-data.mimiciv_3_1_hosp.d_labitems` dl
    USING(itemid)
INNER JOIN `bigq-lab-project-al.mimic_analysis.core_patients` icu
    USING(subject_id, hadm_id)
WHERE l.charttime BETWEEN icu.intime AND icu.outtime;
