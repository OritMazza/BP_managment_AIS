   
#This code extracts the final cohort of ischemic stroke patients in the first 24-hours after a stroke from MIMIC-III database.

#The first Table “dia” is used to extract the cohort according to ICD-9.
-- 43301: Occlusion and stenosis of basilar artery with cerebral infarction
-- 43311: Occlusion and stenosis of the carotid artery with cerebral infarction
-- 43321: Occlusion and stenosis of vertebral artery with cerebral infarction
-- 43381: Occlusion and stenosis of other specified precerebral artery with cerebral infarction
-- 43331: Occlusion and stenosis of multiple and bilateral precerebral arteries with cerebral infraction
-- 43391: Occlusion and stenosis of unspecified precerebral artery with cerebral infarction 
-- 43401: Cerebral thrombosis with cerebral infarction
-- 43411: Cerebral embolism with cerebral infarction
-- 43491: Cerebral artery occlusion, unspecified with cerebral infarction
-- 43490: Cerebral artery occlusion, unspecified without mention of cerebral infarction
-- 43410: Cerebral embolism without mention of cerebral infraction
-- 43400: Cerebral thrombosis without mention of cerebral infraction
-- 436:   CVA, Acute, but ill-defined, cerebrovascular disease
# Potential patients who received thrombolysis or endovascular treatment extracted according to ICD-9.
 -- 9910: Patients who received thrombolysis.
-- 3974:  Endovascular treatment (EVT).

# The cohort includes adult patients ages 18-88.

with dia as(
SELECT subject_id, hadm_id , seq_num, icd9_code FROM `physionet-data.mimiciii_clinical.diagnoses_icd` 
WHERE icd9_code in ('43301','43311','43381','43321','43331','43391','43401','43411','43491','43490','43410','43400','436')
AND seq_num in (1,2)
)

,cohort as(
SELECT distinct dia.subject_id , dia.hadm_id, i.icustay_id, intime, dia.icd9_code, seq_num, short_title, long_title, 
(case when dia.subject_id in ( (SELECT distinct subject_id FROM `physionet-data.mimiciii_clinical.procedures_icd` where icd9_code in ( '3974', '9910'))) and dia.hadm_id in (SELECT distinct hadm_id FROM `physionet-data.mimiciii_clinical.procedures_icd` where icd9_code in ( '3974', '9910')) then 1 else 0 end) as TagtPA
from dia 
inner join `physionet-data.mimiciii_clinical.d_icd_diagnoses` d
on d.icd9_code=dia.icd9_code
left join `physionet-data.mimiciii_clinical.icustays` i
on dia.subject_id=i.subject_id and dia.hadm_id=i.hadm_id 
)

, AgeCohort as(SELECT distinct p.subject_id, a.hadm_id, ic.intime, admittime , ic.icustay_id from `physionet-data.mimiciii_clinical.patients` p
LEFT JOIN `physionet-data.mimiciii_clinical.admissions` a
ON p.subject_id=a.subject_id 
LEFT JOIN `physionet-data.mimiciii_clinical.icustays`ic
ON a.subject_id=ic.subject_id AND a.hadm_id=ic.hadm_id 
WHERE ((DATETIME_DIFF (a.admittime, dob, YEAR) between 18 and 88)
))

, TimeWinCohort as (
SELECT DATETIME_DIFF(intime, admittime, DAY) as TimeToICU ,subject_id, hadm_id, icustay_id FROM AgeCohort where DATETIME_DIFF(intime, admittime, DAY) between 0 and 1
)

, FinalCohort as (
SELECT distinct c.subject_id ,c.hadm_id ,c.icustay_id , TagtPA
FROM cohort c 
inner join TimeWinCohort T
ON t.subject_id=c.subject_id AND t.hadm_id=c.hadm_id AND t.icustay_id=c.icustay_id 
)



