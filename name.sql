    
with dia as(
SELECT subject_id, hadm_id , seq_num, icd9_code FROM `physionet-data.mimiciii_clinical.diagnoses_icd` 
WHERE icd9_code in ('43301','43311','43381','43321','43331','43391','43401','43411','43491','43490','43410','43400','436')
AND seq_num in (1,2)
)

,tPAp as(
SELECT distinct subject_id, hadm_id FROM `physionet-data.mimiciii_clinical.procedures_icd` where icd9_code in ( '3974', '9910')
)

,cohort as(
SELECT distinct dia.subject_id , dia.hadm_id, i.icustay_id, intime, dia.icd9_code, seq_num, short_title, long_title, 
(case when dia.subject_id in ( (SELECT distinct subject_id FROM `physionet-data.mimiciii_clinical.procedures_icd` where icd9_code in ( '3974', '9910'))) and dia.hadm_id in (SELECT distinct hadm_id FROM `physionet-data.mimiciii_clinical.procedures_icd` where icd9_code in ( '3974', '9910')) then 1 else 0 end) as TagtPA
,(case when dia.subject_id in ((SELECT distinct subject_id FROM `physionet-data.mimiciii_clinical.diagnoses_icd` WHERE icd9_code in('411','410'))) and dia.hadm_id in (SELECT distinct hadm_id FROM `physionet-data.mimiciii_clinical.diagnoses_icd` where icd9_code in ('411','410')) then 1 else 0 end) as ACS 
from dia 
inner join `physionet-data.mimiciii_clinical.d_icd_diagnoses` d
on d.icd9_code=dia.icd9_code
left join `physionet-data.mimiciii_clinical.icustays` i
on dia.subject_id=i.subject_id and dia.hadm_id=i.hadm_id 
--inner join tPAp p
--on dia.subject_id=p.subject_id AND dia.hadm_id=p.hadm_id
)
--count of distinct subject id and hadm id accordind to icd9 code
--select count(distinct subject_id),count (hadm_id) , icd9_code from dia
--group by  icd9_code

, AgeCohort as(SELECT distinct p.subject_id, a.hadm_id, ic.intime, admittime , ic.icustay_id , DATETIME_DIFF (a.admittime, dob, YEAR) as age from `physionet-data.mimiciii_clinical.patients` p
LEFT JOIN `physionet-data.mimiciii_clinical.admissions` a
ON p.subject_id=a.subject_id 
LEFT JOIN `physionet-data.mimiciii_clinical.icustays`ic
ON a.subject_id=ic.subject_id AND a.hadm_id=ic.hadm_id 
--and  DATETIME_DIFF(ic.intime, a.admittime, DAY) between 0 and 1 
and ((DATETIME_DIFF (a.admittime, dob, YEAR) between 18 and 100)
))

, TimeWinCohort as (
SELECT DATETIME_DIFF(intime, admittime, DAY) as TimeToICU ,subject_id, hadm_id, icustay_id FROM AgeCohort where DATETIME_DIFF(intime, admittime, DAY) between 0 and 1
)

SELECT * FROM `physionet-data.mimiciii_clinical.d_icd_diagnoses`
WHERE lower(short_title) like '%myocardial%'--'%eclampsia%'--icd9_code like '%410%'--,'%410%')--short_title like '%coronary%' ---icd9_code in('%411%','%410%')
-- distinct c.subject_id ,c.hadm_id ,c.icustay_id , TagtPA

--SELECT --sum(ACS) FROM cohort  
--count (distinct c.subject_id) as subject , count(distinct c.hadm_id) as hadm , d.icd9_code, d.short_title --,, count(distinct c.icustay_id) as icu  TagtPA , icd9_code--, TagtPA--,max(TagtPA), icd9_code 
--FROM `physionet-data.mimiciii_clinical.d_icd_diagnoses` d
--LEFT JOIN `physionet-data.mimiciii_clinical.diagnoses_icd` c
--on d.icd9_code=c.icd9_code

--WHERE  lower(short_title) like '%fracture%'
--group by icd9_code, short_title


--FROM TimeWinCohort t
--FROM cohort c 
--inner join AgeCohort t--TimeWinCohort t
--ON t.subject_id=c.subject_id AND t.hadm_id=c.hadm_id AND t.icustay_id=c.icustay_id 
--FROM TimeWinCohort t
--inner join cohort c
--ON t.subject_id=c.subject_id AND t.hadm_id=c.hadm_id AND t.icustay_id=c.icustay_id 
--group by TagtPA , icd9_code--c.subject_id ,c.hadm_id ,c.icustay_id , TagtPA
--order by icd9_code
--SELECT * from cohort
--order by subject_id, hadm_id--