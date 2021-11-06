#The next table was created to identify antihypertensive drugs that were used organized according to classes.
, Medications AS
(
SELECT 
f.subject_id ,f.hadm_id ,f.icustay_id, DRUG, startdate, admittime,
(case when lower(DRUG) LIKE 
--Calcium Channels Blockers 
'amlodipine%' OR lower(DRUG) LIKE '%clevidipine%' OR lower(DRUG) LIKE '%diltiazem%' OR lower(DRUG) LIKE '%felodipine%' OR lower(DRUG) LIKE '%isradipine%' OR lower(DRUG) LIKE '%lacidipine%' OR lower(DRUG) LIKE '%lercanidipine%' OR lower(DRUG) LIKE '%manidipine%' OR lower(DRUG) LIKE  '%mepirodipine%' OR lower(DRUG) LIKE '%nicardipine%' OR lower(DRUG) LIKE '%nifedipine%' OR lower(DRUG) LIKE '%nilvadipine%' OR lower(DRUG) LIKE '%nimodipine%' OR lower(DRUG) LIKE '%nisoldipine%' OR lower(DRUG) LIKE '%nitrendipine%' OR lower(DRUG) LIKE '%verapamil%'
 then 1 else 0 end) as CaChannelsB ,
 
 (case when lower(DRUG) LIKE  
'%amlodipine%' then 1 else 0 end) as CaAmlodipine,
(case when lower(DRUG) LIKE
'%diltiazem%' then 1 else 0 end) as CaDiltiazem,
(case when lower(DRUG) LIKE
'%nicardipine%' then 1 else 0 end) as CaNicardipine,
(case when lower(DRUG) LIKE
'%nifedipine%' then 1 else 0 end) as CaNifedipine,
(case when lower(DRUG) LIKE
'%nimodipine%'  then 1 else 0 end) as CaNimodipine,
(case when lower(DRUG) LIKE
'%verapamil%' then 1 else 0 end) as CaVerapamil,

--Beta blocking agents
(case when lower(DRUG) like '%acebutolol%' OR lower(DRUG) like '%alprenolol%' OR lower(DRUG) like '%atenolol%' OR lower(DRUG) like '%atenolol%nifedipine%' OR lower(DRUG) like '%betaxolol%' OR lower(DRUG) like '%bisoprolol%' OR lower(DRUG) like '%bopindolol%' OR lower(DRUG) like '%bupranolol%' OR lower(DRUG) like '%carvedilol%' OR lower(DRUG) like '%celiprolol%' OR lower(DRUG) like '%esmolol%' OR lower(DRUG) like '%felodipine%metoprolol%' OR lower(DRUG) like '%labetalol%' OR lower(DRUG) like '%metoprolol%' OR lower(DRUG) like '%nadolol%' OR lower(DRUG) like '%nebivolol%' OR lower(DRUG) like '%oxprenolol%' OR lower(DRUG) like '%penbutolol%' OR lower(DRUG) like '%pindolol%' OR lower(DRUG) like '%propranolol%' OR lower(DRUG) like '%tertatolol%' then 1 else 0 end) as BetaB ,

(case when lower(DRUG) LIKE
'%atenolol%' then 1 else 0 end) as BetaAtenolol,
 (case when lower(DRUG) LIKE
'%carvedilol%' then 1 else 0 end) as BetaCarvedilol,
 (case when lower(DRUG) LIKE
'%esmolol%' then 1 else 0 end) as BetaEsmolol,
 (case when lower(DRUG) LIKE
'%labetalol%'  then 1 else 0 end) as BetaLabetalol,
 (case when lower(DRUG) LIKE
'%metoprolol%' then 1 else 0 end) as BetaMetoprolol,
 (case when lower(DRUG) LIKE
'%nadolol%' then 1 else 0 end) as BetaNadolol,

--Alpha-adrenoreceptor antagonists
  (case when lower(DRUG) like 
 '%doxazosin%' OR lower(DRUG) like '%indoramin%' OR lower(DRUG) like '%prazosin%' OR lower(DRUG) like '%urapidil%' OR lower(DRUG) like '%terazosin%' OR lower(DRUG) like '%doxazosin%' OR lower(DRUG) like '%phenoxybenzamine%' then 1 else 0 end) as AlfaAntagonist,


--ACE inhibitors
(case when lower(DRUG) LIKE '%captopril%' OR lower(DRUG) LIKE '%enalapril%' OR lower(DRUG) LIKE '%benazepril%' OR lower(DRUG) LIKE '%cilazapril%' OR lower(DRUG) LIKE '%fosinopril%' OR lower(DRUG) LIKE '%imidapril%' OR lower(DRUG) LIKE '%lisinopril%' OR lower(DRUG) LIKE '%moexipril%' OR lower(DRUG) LIKE '%perindopril%' OR lower(DRUG) LIKE '%quinapril%' OR lower(DRUG) LIKE '%ramipril%' OR lower(DRUG) LIKE '%spirapril%' OR lower(DRUG) LIKE '%trandolapril%' OR lower(DRUG) LIKE '%zofenopril%'
  then 1 else 0 end) as ACEInhibitors,

(case when lower(DRUG) LIKE
'%captopril%'  then 1 else 0 end) as ACEICaptopril,
(case when lower(DRUG) LIKE
'%enalapril%' then 1 else 0 end) as ACEIEnalapril,
(case when lower(DRUG) LIKE
'%lisinopril%' then 1 else 0 end) as ACEIILisinopril,
(case when lower(DRUG) LIKE
'%quinapril%' then 1 else 0 end) as ACEIIQuinapril,

--Angiotensin II Rreceptor blockers
(case when lower(DRUG) like '%azilsartan%medoxomil%' OR lower(DRUG) like '%candesartan%' OR lower(DRUG) like '%eprosartan%' OR lower(DRUG) like '%irbesartan%' OR lower(DRUG) like '%losartan%' OR lower(DRUG) like '%olmesartan%' OR lower(DRUG) like '%medoxomil%' OR lower(DRUG) like '%telmisartan%' OR lower(DRUG) like '%valsartan%'
 then 1 else 0 end) as AngiotensinIIBlockers,

(case when lower(DRUG) LIKE
'%losartan%' then 1 else 0 end) as AngILosartan,
(case when lower(DRUG) LIKE
'%valsartan%' then 1 else 0 end) as AngIValsartan,

--Diuretics
(case when lower(DRUG) like '%amiloride%' OR lower(DRUG) like '%bendroflumethiazide%' OR lower(DRUG) like '%bendroflumethiazide%Potassium%' OR lower(DRUG) like '%bumetanide%' OR lower(DRUG) like '%bumetanide%Potassium%' OR lower(DRUG) like '%canrenoate%' OR lower(DRUG) like '%chlorothiazide%' OR lower(DRUG) like '%chlorthalidone%' OR lower(DRUG) like '%cicletanine%' OR lower(DRUG) like '%clopamide%' OR lower(DRUG) like '%cyclopenthiazide%' OR lower(DRUG) like '%cyclothiazide%' OR lower(DRUG) like '%eplerenone%' OR lower(DRUG) like '%ethacrynic%Acid%' OR lower(DRUG) like '%furosemide%' OR lower(DRUG) like '%furosemide%potassium%' OR lower(DRUG) like '%hydrochlorothiazide%' OR lower(DRUG) like '%hydroflumethiazide%' OR lower(DRUG) like '%indapamide%' OR lower(DRUG) like  '%mefruside%' OR lower(DRUG) like '%methyclothiazide%' OR lower(DRUG) like '%metolazone%' OR lower(DRUG) like '%piretanide%' OR lower(DRUG) like '%polythiazide%' OR lower(DRUG) like '%quinethazone%' OR lower(DRUG) like '%spironolactone%' OR lower(DRUG) like '%torsemide%' OR lower(DRUG) like '%triamterene%' OR lower(DRUG) like '%trichlormethiazide%' OR lower(DRUG) like '%xipamide%'
  then 1 else 0 end) as Diuretics,

(case when lower(DRUG) LIKE
'%bumetanide%' then 1 else 0 end) as DiuBumetanide,
(case when lower(DRUG) LIKE
'%furosemide%' then 1 else 0 end) as DiuFurosemide,
(case when lower(DRUG) LIKE
'%hydrochlorothiazide%' then 1 else 0 end) as DiuHydrochlorothiazide,
(case when lower(DRUG) LIKE
'%spironolactone%' then 1 else 0 end) as DiuSpironolactone,

--Renin-inhibitors
 (case when lower(DRUG) like '%aliskiren%'
 then 1 else 0 end) as ReninInhibitors,

--Direct vasodilators
(case when lower(DRUG) like '%hydralazine%' OR lower(DRUG) like '%dihydralazine%' OR lower(DRUG) like '%minoxidill%'
then 1 else 0 end) as DirectVasodilators,

(case when lower(DRUG) LIKE
'%hydralazine%' then 1 else 0 end) as VasoHydralazine,

--Sympatholtics agent
(case when lower(DRUG) like 
 '%clonidine%' OR lower(DRUG) like '%methyldopa%' OR lower(DRUG) like '%reserpine%' OR lower(DRUG) like '%guanfacine%'
  then 1 else 0 end) as SympatholticsAgent,

(case when lower(DRUG) LIKE  
'%clonidine%' then 1 else 0 end) as DirectClonidine,

--Others
(case when lower(DRUG) like '%nitroprusside%'
  then 1 else 0 end) as NitroPrusside,

FROM FinalCohort f
LEFT JOIN `physionet-data.mimiciii_clinical.prescriptions` p
ON f.icustay_id=p.icustay_id
left join `physionet-data.mimiciii_clinical.icustays` i
on f.icustay_id=i.icustay_id--f.subject_id=i.subject_id and f.hadm_id=i.hadm_id 
LEFT JOIN `physionet-data.mimiciii_clinical.admissions` a
ON f.subject_id=a.subject_id and f.hadm_id=a.hadm_id  
where DATETIME_DIFF(startdate, admittime, DAY) between 0 and 1--startdate >= intime and enddate<= outtime and  
ORDER BY subject_id,DRUG
) 
#Pivot table for medications

, MedicationMax as (
SELECT 
subject_id ,hadm_id ,icustay_id,
Max(CaChannelsB) as CaChannelsB,
Max(CaAmlodipine) as CaAmlodipine,
Max(CaDiltiazem) as CaDiltiazem,
Max(CaNicardipine) as CaNicardipine,
Max(CaNifedipine) as CaNifedipine,
Max(CaNimodipine) as CaNimodipine,
Max(CaVerapamil) as CaVerapamil,

--Beta Blockers
Max(BetaB) as BetaB,
Max(BetaAtenolol) as BetaAtenolol,
Max(BetaCarvedilol) as BetaCarvedilol,
Max(BetaEsmolol) as BetaEsmolol,
Max(BetaLabetalol) as BetaLabetalol,
Max(BetaMetoprolol) as BetaMetoprolol,
Max(BetaNadolol) as BetaNadolol,

--ACE inhibitors
Max(ACEInhibitors) as ACEInhibitors,
Max(ACEICaptopril) as ACEICaptopril,
Max(ACEIEnalapril) as ACEIEnalapril,
Max(ACEIILisinopril) as ACEIILisinopril,
Max(ACEIIQuinapril) as ACEIIQuinapril,

--AngiotensinII Blocker
Max(AngiotensinIIBlockers) as AngiotensinIIBlockers,
Max(AngILosartan) as AngILosartan,
Max(AngIValsartan) as AngIValsartan,

--Diuretics
Max(Diuretics) as Diuretics,

Max(DiuBumetanide) as DiuBumetanide,
Max(DiuFurosemide) as DiuFurosemide,
Max(DiuHydrochlorothiazide) as DiuHydrochlorothiazide,
Max(DiuSpironolactone) as  DiuSpironolactone,

--Direct Vasodilators
Max(DirectVasodilators) as DirectVasodilators,
Max(VasoHydralazine) as VasoHydralazine,

--Sympatholtics agent
Max(SympatholticsAgent) as SympatholticsAgent,
Max(DirectClonidine) as DirectClonidine,

Max(NitroPrusside) as NitroPrusside

FROM Medications
group by subject_id ,hadm_id ,icustay_id
)

# This code extracts the final cohort of ischemic stroke patients in the first 24-hours #after a stroke from eICU database.

With Cohort as (
SELECT distinct patientunitstayid , ICD9Code FROM `physionet-data.eicu_crd.diagnosis`
WHERE ICD9Code like '%434%' or ICD9Code like '%436%' or ICD9Code like '%433.01%' or ICD9Code like '%433.11%' or ICD9Code like '%433.81%' or ICD9Code like '%433.21%' or ICD9Code like '%433.31%' or ICD9Code like '%433.91%'
)

,tPAp as(
SELECT distinct patientunitstayid , treatmentOffset FROM `physionet-data.eicu_crd.treatment` where lower(treatmentString) like '%thrombolytics%'
)

, CohortWithTagtPA as(
SELECT uniquepid , c.patientunitstayid, (case when c.patientunitstayid in (SELECT distinct patientunitstayid FROM `physionet-data.eicu_crd.treatment` where lower(treatmentString) like '%thrombolytics%') then 1 else 0 end) as TagtPA, ICD9Code from Cohort c
Left join tPAp m
on m.patientUnitStayID= c.patientunitstayid
Left join `physionet-data.eicu_crd.patient` p
on p.patientUnitStayID= c.patientunitstayid
WHERE age > '18' and age < '88'
 )

, CohortAnalysis as(
 SELECT count( distinct patientunitstayid) as numIcuStay, count(distinct uniquepid) as numPid, TagtPA, ICD9Code from CohortWithTagtPA
 group by TagtPA , ICD9Code
 )

##

, Meds as (
SELECT c.patientunitstayid
, (CASE WHEN TagtPA =1 and drugStartOffset > treatmentOffset and drugStartOffset < treatmentOffset + 1440 THEN 1
          WHEN TagtPA =0 and drugStartOffset <= 1440 THEN 1 ELSE 0 end) AS TimeWin ,
(case when lower(drugName) LIKE 
--Calcium Channels Blockers 
'aAmlodipine%' OR lower(drugName) LIKE '%clevidipine%' OR lower(drugName) LIKE '%diltiazem%' OR lower(drugName) LIKE '%felodipine%' OR lower(drugName) LIKE '%isradipine%' OR lower(drugName) LIKE '%lacidipine%' OR lower(drugName) LIKE '%lercanidipine%' OR lower(drugName) LIKE '%manidipine%' OR lower(drugName) LIKE  '%mepirodipine%' OR lower(drugName) LIKE '%nicardipine%' OR lower(drugName) LIKE '%nifedipine%' OR lower(drugName) LIKE '%nilvadipine%' OR lower(drugName) LIKE '%nimodipine%' OR lower(drugName) LIKE '%nisoldipine%' OR lower(drugName) LIKE '%nitrendipine%' OR lower(drugName) LIKE '%verapamil%'
 then 1 else 0 end) as CaChannelsB
 
 --Beta blocking agents
,(case when lower(drugName) like '%acebutolol%' OR lower(drugName) like '%alprenolol%' OR lower(drugName) like '%atenolol%' OR lower(drugName) like '%atenolol%nifedipine%' OR lower(drugName) like '%betaxolol%' OR lower(drugName) like '%bisoprolol%' OR lower(drugName) like '%bopindolol%' OR lower(drugName) like '%bupranolol%' OR lower(drugName) like '%carvedilol%' OR lower(drugName) like '%celiprolol%' OR lower(drugName) like '%esmolol%' OR lower(drugName) like '%felodipine%metoprolol%' OR lower(drugName) like '%labetalol%' OR lower(drugName) like '%metoprolol%' OR lower(drugName) like '%nadolol%' OR lower(drugName) like '%nebivolol%' OR lower(drugName) like '%oxprenolol%' OR lower(drugName) like '%penbutolol%' OR lower(drugName) like '%pindolol%' OR lower(drugName) like '%propranolol%' OR lower(drugName) like '%tertatolol%' then 1 else 0 end) as BetaB ,

----Alpha-adrenoreceptor antagonists
(case when lower(drugName) like 
 '%doxazosin%' OR lower(drugName) like '%indoramin%' OR lower(drugName) like '%prazosin%' OR lower(drugName) like '%urapidil%' OR lower(drugName) like '%terazosin%' OR lower(drugName) like '%doxazosin%' OR lower(drugName) like '%phenoxybenzamine%' then 1 else 0 end) as AlfaAntagonist,

--ACE inhibitors
(case when lower(drugName) LIKE '%captopril%' OR lower(drugName) LIKE '%enalapril%' OR lower(drugName) LIKE '%benazepril%' OR lower(drugName) LIKE '%cilazapril%' OR lower(drugName) LIKE '%fosinopril%' OR lower(drugName) LIKE '%imidapril%' OR lower(drugName) LIKE '%lisinopril%' OR lower(drugName) LIKE '%moexipril%' OR lower(drugName) LIKE '%perindopril%' OR lower(drugName) LIKE '%quinapril%' OR lower(drugName) LIKE '%ramipril%' OR lower(drugName) LIKE '%spirapril%' OR lower(drugName) LIKE '%trandolapril%' OR lower(drugName) LIKE '%zofenopril%'
  then 1 else 0 end) as ACEInhibitors,

--Angiotensin II Rreceptor blockers
(case when lower(drugName) like '%azilsartan%medoxomil%' OR lower(drugName) like '%candesartan%' OR lower(drugName) like '%eprosartan%' OR lower(drugName) like '%irbesartan%' OR lower(drugName) like '%losartan%' OR lower(drugName) like '%olmesartan%' OR lower(drugName) like '%medoxomil%' OR lower(drugName) like '%telmisartan%' OR lower(drugName) like '%valsartan%'
 then 1 else 0 end) as AngiotensinIIBlockers,

--Diuretics
(case when lower(drugName) like '%amiloride%' OR lower(drugName) like '%bendroflumethiazide%' OR lower(drugName) like '%bendroflumethiazide%Potassium%' OR lower(drugName) like '%bumetanide%' OR lower(drugName) like '%bumetanide%Potassium%' OR lower(drugName) like '%canrenoate%' OR lower(drugName) like '%chlorothiazide%' OR lower(drugName) like '%chlorthalidone%' OR lower(drugName) like '%cicletanine%' OR lower(drugName) like '%clopamide%' OR lower(drugName) like '%cyclopenthiazide%' OR lower(drugName) like '%cyclothiazide%' OR lower(drugName) like '%eplerenone%' OR lower(drugName) like '%ethacrynic%Acid%' OR lower(drugName) like '%furosemide%' OR lower(drugName) like '%furosemide%potassium%' OR lower(drugName) like '%hydrochlorothiazide%' OR lower(drugName) like '%hydroflumethiazide%' OR lower(drugName) like '%indapamide%' OR lower(drugName) like  '%mefruside%' OR lower(drugName) like '%methyclothiazide%' OR lower(drugName) like '%metolazone%' OR lower(drugName) like '%piretanide%' OR lower(drugName) like '%polythiazide%' OR lower(drugName) like '%quinethazone%' OR lower(drugName) like '%spironolactone%' OR lower(drugName) like '%torsemide%' OR lower(drugName) like '%triamterene%' OR lower(drugName) like '%trichlormethiazide%' OR lower(drugName) like '%xipamide%'
  then 1 else 0 end) as Diuretics,

--Renin-inhibitors
(case when lower(drugName) like '%aliskiren%'
  then 1 else 0 end) as ReninInhibitors,

--Direct vasodilators
(case when lower(drugName) like '%hydralazine%' OR lower(drugName) like '%dihydralazine%' OR lower(drugName) like '%minoxidill%'
  then 1 else 0 end) as DirectVasodilators,

--Sympatholtics agent
(case when lower(drugName) like 
 '%clonidine%' OR lower(drugName) like '%methyldopa%' OR lower(drugName) like '%reserpine%' OR lower(drugName) like '%guanfacine%'
  then 1 else 0 end) as SympatholticsAgent,

--Others
(case when lower(drugName) like '%nitroprusside%'
  then 1 else 0 end) as Nitro
 
FROM CohortWithTagtPA c
LEFT JOIN `physionet-data.eicu_crd.medication` m
on c.patientunitstayid=m.patientunitstayid
LEFT JOIN `physionet-data.eicu_crd.treatment` t 
on c.patientunitstayid=t.patientunitstayid 
) 

, MedsPivot as (
SELECT 
patientunitstayid,
Max(CaChannelsB) as CaChannelsB,
Max(BetaB) as BetaB,
Max(AlfaAntagonist) as AlfaAntagonist,
Max(ACEInhibitors) as ACEInhibitors,
Max(AngiotensinIIBlockers) as AngiotensinIIBlockers,
Max(Diuretics) as Diuretics,
Max(ReninInhibitors) as ReninInhibitors,
Max(DirectVasodilators) as DirectVasodilators,
Max(SympatholticsAgent) as SympatholticsAgent,
Max(Nitro) as Nitro
FROM Meds
where TimeWin=1
group by patientunitstayid
)


