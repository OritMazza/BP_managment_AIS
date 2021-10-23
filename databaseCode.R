setwd("C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\Prescriptions analysis")

#For balamced cohort
setwd("C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\MIMIC DATA\\BigQuery")

#For balanced cohort
cohort.df<-read.csv("Oct21_No_outliers_Just_for_balanced.csv")

##fter_balanced
cohort.df<-read.csv("Balanced_All.csv")
summary(cohort.df)

##
 cohort.df<-read.csv("eICUMIMICAllVarWithSpecificDrugs.csv")
summary(cohort.df)

#For BPWA
cohort.df<-read.csv("eICUMIMICAllVarWithSpecificDrugsBPWA.csv")
class(cohort.df$BetaLabetalol)
cohort.df<-read.csv("eICUMIMICBPWAWithSpecificDrugs.csv")


#Treating variables
###Just for regression task
cohort.df$SysBPWA<-as.numeric(as.character(cohort.df$SysBPWA))
cohort.df$DiasBPWA<-as.numeric(as.character(cohort.df$DiasBPWA))
cohort.df$MeanBPWA<-as.numeric(as.character(cohort.df$MeanBPWA))
class(cohort.df$SysBPWA)




###Numeric
cohort.df$MaxPH<-as.numeric(cohort.df$MaxPH)
cohort.df$AvgPH<-as.numeric((cohort.df$AvgPH))
cohort.df$MinPH<-as.numeric(cohort.df$MinPH)
cohort.df$AvgCalciumTotal<-as.numeric(cohort.df$AvgCalciumTotal)
cohort.df$MaxCalciumTotal<-as.numeric(cohort.df$MaxCalciumTotal)
cohort.df$MinCalciumTotal<-as.numeric(cohort.df$MinCalciumTotal)
cohort.df$MaxHEMATOCRIT<-as.numeric(cohort.df$MaxHEMATOCRIT)
cohort.df$MinHEMATOCRIT<-as.numeric(cohort.df$MinHEMATOCRIT)
cohort.df$AvgHEMATOCRIT<-as.numeric(cohort.df$AvgHEMATOCRIT)
cohort.df$MaxHEMOGLOBIN<-as.numeric(cohort.df$MaxHEMOGLOBIN)
cohort.df$MinHEMOGLOBIN<-as.numeric(cohort.df$MinHEMOGLOBIN)
cohort.df$AvgHEMOGLOBIN<-as.numeric(cohort.df$AvgHEMOGLOBIN)

cohort.df$AvgMCH<-as.numeric(cohort.df$AvgMCH)
cohort.df$AvgMCHC<-as.numeric(cohort.df$AvgMCHC)
cohort.df$AvgMCV<-as.numeric(cohort.df$AvgMCV)

cohort.df$AvgRDW<-as.numeric(cohort.df$AvgRDW)
cohort.df$MinPLATELET<-as.numeric(cohort.df$MinPLATELET)
cohort.df$MaxPLATELET<-as.numeric(cohort.df$MaxPLATELET)
cohort.df$AvgPLATELET<-as.numeric(cohort.df$AvgPLATELET)
cohort.df$MinWBC<-as.numeric(cohort.df$MinWBC)
cohort.df$MaxWBC<-as.numeric(cohort.df$MaxWBC)
cohort.df$AvgWBC<-as.numeric(cohort.df$AvgWBC)

cohort.df$MinCREATININE<-as.numeric(cohort.df$MinCREATININE)
cohort.df$MaxCREATININE<-as.numeric(cohort.df$MaxCREATININE)
cohort.df$AvgCREATININE<-as.numeric(cohort.df$AvgCREATININE)

cohort.df$MaxBUN<-as.numeric(cohort.df$MaxBUN)
cohort.df$AvgBUN<-as.numeric(cohort.df$AvgBUN)

cohort.df$AvgPOTASSIUM<-as.numeric(cohort.df$AvgPOTASSIUM)
cohort.df$MaxPOTASSIUM<-as.numeric(cohort.df$MaxPOTASSIUM)

cohort.df$MaxBICARBONATE<-as.numeric(cohort.df$MaxBICARBONATE)
cohort.df$AvgBICARBONATE<-as.numeric(cohort.df$AvgBICARBONATE)
cohort.df$MinBICARBONATE<-as.numeric(cohort.df$MinBICARBONATE)

cohort.df$MinCHLORIDE<-as.numeric(cohort.df$MinCHLORIDE)
cohort.df$AvgCHLORIDE<-as.numeric(cohort.df$AvgCHLORIDE)
cohort.df$MaxCHLORIDE<-as.numeric(cohort.df$MaxCHLORIDE)

cohort.df$MinGLUCOSELlabs<-as.numeric(cohort.df$MinGLUCOSELlabs)
cohort.df$AvgGLUCOSElabs<-as.numeric(cohort.df$AvgGLUCOSElabs)
cohort.df$MaxGLUCOSElabs<-as.numeric(cohort.df$MaxGLUCOSElabs)


##Factors
cohort.df$TagtPA<-as.factor(cohort.df$TagtPA)
cohort.df$TagCVP<-as.factor(cohort.df$TagCVP)
cohort.df$TagIntubation<-as.factor(cohort.df$TagIntubation)
cohort.df$TagCI<-as.factor(cohort.df$TagCI)
cohort.df$CONGESTIVE_HEART_FAILURE<-as.factor(cohort.df$CONGESTIVE_HEART_FAILURE)
cohort.df$CARDIAC_ARRHYTHMIAS<-as.factor(cohort.df$CARDIAC_ARRHYTHMIAS)
cohort.df$VALVULAR_DISEASE<-as.factor(cohort.df$VALVULAR_DISEASE)
cohort.df$PULMONARY_CIRCULATION<-as.factor(cohort.df$PULMONARY_CIRCULATION)
cohort.df$PERIPHERAL_VASCULAR<-as.factor(cohort.df$PERIPHERAL_VASCULAR)
cohort.df$HYPERTENSION<-as.factor(cohort.df$HYPERTENSION)
cohort.df$PARALYSIS<-as.factor(cohort.df$PARALYSIS)
cohort.df$CHRONIC_PULMONARY<-as.factor(cohort.df$CHRONIC_PULMONARY)
cohort.df$DIABETES_UNCOMPLICATED<-as.factor(cohort.df$DIABETES_UNCOMPLICATED)
cohort.df$DIABETES_COMPLICATED<-as.factor(cohort.df$DIABETES_COMPLICATED)
cohort.df$HYPOTHYROIDISM<-as.factor(cohort.df$HYPOTHYROIDISM)
cohort.df$RENAL_FAILURE<-as.factor(cohort.df$RENAL_FAILURE)
cohort.df$LIVER_DISEASE<-as.factor(cohort.df$LIVER_DISEASE)
cohort.df$LYMPHOMA<-as.factor(cohort.df$LYMPHOMA)
cohort.df$METASTATIC_CANCER<-as.factor(cohort.df$METASTATIC_CANCER)
cohort.df$SOLID_TUMOR<-as.factor(cohort.df$SOLID_TUMOR)
cohort.df$RHEUMATOID_ARTHRITIS<-as.factor(cohort.df$RHEUMATOID_ARTHRITIS)
cohort.df$COAGULOPATHY<-as.factor(cohort.df$COAGULOPATHY)
cohort.df$OBESITY<-as.factor(cohort.df$OBESITY)
cohort.df$WEIGHT_LOSS<-as.factor(cohort.df$WEIGHT_LOSS)
cohort.df$FLUID_ELECTROLYTE<-as.factor(cohort.df$FLUID_ELECTROLYTE)
cohort.df$DEFICIENCY_ANEMIAS<-as.factor(cohort.df$DEFICIENCY_ANEMIAS)
cohort.df$ALCOHOL_ABUSE<-as.factor(cohort.df$ALCOHOL_ABUSE)
cohort.df$DRUG_ABUSE<-as.factor(cohort.df$DRUG_ABUSE)
cohort.df$PSYCHOSES<-as.factor(cohort.df$PSYCHOSES)
cohort.df$DEPRESSION<-as.factor(cohort.df$DEPRESSION)

cohort.df$CaChannelsB<-as.factor(cohort.df$CaChannelsB)
cohort.df$CaAmlodipine<-as.factor(cohort.df$CaAmlodipine)
cohort.df$CaDiltiazem<-as.factor(cohort.df$CaDiltiazem)
cohort.df$CaNicardipine<-as.factor(cohort.df$CaNicardipine)
cohort.df$CaNifedipine<-as.factor(cohort.df$CaNifedipine)
cohort.df$CaNimodipine<-as.factor(cohort.df$CaNimodipine)
cohort.df$CaVerapamil<-as.factor(cohort.df$CaVerapamil)
cohort.df$BetaB<-as.factor(cohort.df$BetaB)

cohort.df$BetaAtenolol<-as.factor(cohort.df$BetaAtenolol)
cohort.df$BetaCarvedilol<-as.factor(cohort.df$BetaCarvedilol)
cohort.df$BetaEsmolol<-as.factor(cohort.df$BetaEsmolol)
cohort.df$BetaLabetalol<-as.factor(cohort.df$BetaLabetalol)
cohort.df$BetaMetoprolol<-as.factor(cohort.df$BetaMetoprolol)
cohort.df$BetaNadolol<-as.factor(cohort.df$BetaNadolol)

cohort.df$ACEInhibitors<-as.factor(cohort.df$ACEInhibitors)
cohort.df$ACEICaptopril<-as.factor(cohort.df$ACEICaptopril)
cohort.df$ACEIEnalapril<-as.factor(cohort.df$ACEIEnalapril)
cohort.df$ACEIILisinopril<-as.factor(cohort.df$ACEIILisinopril)
cohort.df$ACEIIQuinapril<-as.factor(cohort.df$ACEIIQuinapril)

cohort.df$AngiotensinIIBlockers<-as.factor(cohort.df$AngiotensinIIBlockers)
cohort.df$AngILosartan<-as.factor(cohort.df$AngILosartan)
cohort.df$AngIValsartan<-as.factor(cohort.df$AngIValsartan)

cohort.df$Diuretics<-as.factor(cohort.df$Diuretics)
cohort.df$DiuBumetanide<-as.factor(cohort.df$DiuBumetanide)
cohort.df$DiuFurosemide<-as.factor(cohort.df$DiuFurosemide)
cohort.df$DiuHydrochlorothiazide<-as.factor(cohort.df$DiuHydrochlorothiazide)
cohort.df$DiuSpironolactone<-as.factor(cohort.df$DiuSpironolactone)

cohort.df$DirectVasodilators<-as.factor(cohort.df$DirectVasodilators)
cohort.df$VasoHydralazine<-as.factor(cohort.df$VasoHydralazine)

cohort.df$SympatholticsAgent<-as.factor(cohort.df$SympatholticsAgent)
cohort.df$DirectClonidine<-as.factor(cohort.df$DirectClonidine)

cohort.df$NitroPrusside<-as.factor(cohort.df$NitroPrusside)
cohort.df$numOfClasses<-as.factor(cohort.df$numOfClasses)

cohort.df$PredictFinal<-as.factor(cohort.df$PredictFinal)

str(cohort.df)
summary(cohort.df)
cohort.df<-cohort.df[,-92]

#traeting NULL values
new.cohort.df<-cohort.df
#The drugs NULL values are 0
new.cohort.df$CaChannelsB[is.na(new.cohort.df$CaChannelsB)==TRUE]<-0 
new.cohort.df$CaAmlodipine[is.na(new.cohort.df$CaAmlodipine)==TRUE]<-0 
new.cohort.df$CaDiltiazem[is.na(new.cohort.df$CaDiltiazem)==TRUE]<-0 
new.cohort.df$CaNicardipine[is.na(new.cohort.df$CaNicardipine)==TRUE]<-0 
new.cohort.df$CaNifedipine[is.na(new.cohort.df$CaNifedipine)==TRUE]<-0 
new.cohort.df$CaNimodipine[is.na(new.cohort.df$CaNimodipine)==TRUE]<-0
new.cohort.df$CaVerapamil[is.na(new.cohort.df$CaVerapamil)==TRUE]<-0

new.cohort.df$BetaB[is.na(new.cohort.df$BetaB)==TRUE]<-0 
new.cohort.df$BetaAtenolol[is.na(new.cohort.df$BetaAtenolol)==TRUE]<-0
new.cohort.df$BetaCarvedilol[is.na(new.cohort.df$BetaCarvedilol)==TRUE]<-0
new.cohort.df$BetaEsmolol[is.na(new.cohort.df$BetaEsmolol)==TRUE]<-0
new.cohort.df$BetaLabetalol[is.na(new.cohort.df$BetaLabetalol)==TRUE]<-0
new.cohort.df$BetaMetoprolol[is.na(new.cohort.df$BetaMetoprolol)==TRUE]<-0
new.cohort.df$BetaNadolol[is.na(new.cohort.df$BetaNadolol)==TRUE]<-0

new.cohort.df$ACEInhibitors[is.na(new.cohort.df$ACEInhibitors)==TRUE]<-0
new.cohort.df$ACEICaptopril[is.na(new.cohort.df$ACEICaptopril)==TRUE]<-0
new.cohort.df$ACEIEnalapril[is.na(new.cohort.df$ACEIEnalapril)==TRUE]<-0
new.cohort.df$ACEIILisinopril[is.na(new.cohort.df$ACEIILisinopril)==TRUE]<-0
new.cohort.df$ACEIIQuinapril[is.na(new.cohort.df$ACEIIQuinapril)==TRUE]<-0

new.cohort.df$AngiotensinIIBlockers[is.na(new.cohort.df$AngiotensinIIBlockers)==TRUE]<-0
new.cohort.df$AngILosartan[is.na(new.cohort.df$AngILosartan)==TRUE]<-0
new.cohort.df$AngIValsartan[is.na(new.cohort.df$AngIValsartan)==TRUE]<-0

new.cohort.df$Diuretics[is.na(new.cohort.df$Diuretics)==TRUE]<-0
new.cohort.df$DiuBumetanide[is.na(new.cohort.df$DiuBumetanide)==TRUE]<-0
new.cohort.df$DiuFurosemide[is.na(new.cohort.df$DiuFurosemide)==TRUE]<-0
new.cohort.df$DiuHydrochlorothiazide[is.na(new.cohort.df$DiuHydrochlorothiazide)==TRUE]<-0
new.cohort.df$DiuSpironolactone[is.na(new.cohort.df$DiuSpironolactone)==TRUE]<-0

new.cohort.df$DirectVasodilators[is.na(new.cohort.df$DirectVasodilators)==TRUE]<-0
new.cohort.df$VasoHydralazine[is.na(new.cohort.df$VasoHydralazine)==TRUE]<-0

new.cohort.df$SympatholticsAgent[is.na(new.cohort.df$SympatholticsAgent)==TRUE]<-0
new.cohort.df$DirectClonidine[is.na(new.cohort.df$DirectClonidine)==TRUE]<-0

new.cohort.df$NitroPrusside[is.na(new.cohort.df$NitroPrusside)==TRUE]<-0

new.cohort.df$numOfClasses[is.na(new.cohort.df$numOfClasses)==TRUE]<-0
new.cohort.df$TagCVP[is.na(new.cohort.df$TagCVP)==TRUE]<-0
new.cohort.df$TagIntubation[is.na(new.cohort.df$TagIntubation)==TRUE]<-0
new.cohort.df$TagCI[is.na(new.cohort.df$TagCI)==TRUE]<-0
sum(is.na(new.cohort.df$TagCI))
class(new.cohort.df$MaxSysBP)
#new.cohort.df<-new.cohort.df[,-c(268,263,154,275)]
i<-1
while (i <= ncol(new.cohort.df)){
if((sum(is.na(new.cohort.df[,i]))>0)==TRUE) 
{
  new.cohort.df[,i][is.na(new.cohort.df[,i])==TRUE]<-mean(new.cohort.df[,i],na.rm=TRUE)  
print(i)
  i<-i+1
  }
else
{
  print(i)
  i<-i+1
}
  
  }

#After treating NULLS , there is still NULLS?
i<-1
while (i <= ncol(new.cohort.df)){
  if((sum(is.na(new.cohort.df[,i]))>0)==TRUE) 
  {
      print(i)
    i<-i+1
   }
  else
  {
    i<-i+1
  }
  
}
#Check
sum(is.na(new.cohort.df))#0  
summary(new.cohort.df)

sd(new.cohort.df$SysBPWA)
sd(new.cohort.df$DiasBPWA)

?sd
class(new.cohort.df$MaxSysBP)
write.csv(new.cohort.df, file = "C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\Prescriptions analysis\\AllNoNulls.csv", row.names = FALSE)

#########################################3
#Contineus to categorical var: Age, AvgSys , AvgDias:
new.cohort.df$age <- cut(
  new.cohort.df$age,
  breaks = c(18, 29, 49, 69, 90),
  labels = c("18-29", "30-49", "50-69", "70-89"),
  right  = TRUE
)
?cut

new.cohort.df$AvgSysBP <- cut(
  new.cohort.df$AvgSysBP,
  breaks = c(-Inf, 140, 159, 179, Inf),
  labels = c("<140", "141-159", "160-179", ">180"),
  right  = TRUE
)

new.cohort.df$AvgSysBP <- cut(
  new.cohort.df$AvgSysBP,
  breaks = c(-Inf, 140, 159, 179, Inf),
  labels = c("<140", "141-159", "160-179", ">180"),
  right  = TRUE
)

 new.cohort.df$AvgDiasBP <- cut(
  new.cohort.df$AvgDiasBP,
  breaks = c(-Inf, 90, 99, 109, Inf),
  labels = c("<90", "90-99", "100-109", ">110"),
  right  = TRUE
)

#Plot all variabels
library(purrr)
library(tidyr)
library(ggplot2)
new.cohort.df %>%
  keep(is.numeric) %>% 
  gather() %>%
  
ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_histogram()

#Creating cohort with only "numeric" class varaiables
new.cohort.df2<-as.data.frame(new.cohort.df)
class(new.cohort.df2)
i<-1
while (i <= ncol(new.cohort.df2)){
  if((class(new.cohort.df2[,i])!="numeric") == TRUE) 
  {
    new.cohort.df2<- new.cohort.df2[,-(i)]#[is.na(new.cohort.df[,i])==TRUE]<-mean(new.cohort.df[,i],na.rm=TRUE)  
    print(i)
    i<-i
  }
  else
  {
    i<-i+1
  }
  
}

new.cohort.df<- new.cohort.df[,-(149)]
str(new.cohort.df2)
new.cohort.df2<-as.matrix(new.cohort.df2)
class(new.cohort.df2)
new.cohort.df2 <- cbind(new.cohort.df2, as.numeric(new.cohort.df$PredictFinal)-1)
colnames(new.cohort.df2)[106] <- "PredictFinals"

#define a train- / test-split
smp_size_raw <- floor(0.75 * nrow(new.cohort.df2))
train_ind_raw <- sample(nrow(new.cohort.df2), size = smp_size_raw)
train_raw.df <- as.data.frame(new.cohort.df2[train_ind_raw, ])
test_raw.df <- as.data.frame(new.cohort.df2[-train_ind_raw, ])


train.index2 <- sample(1:dim(new.cohort.df2)[1], dim(new.cohort.df2)[1]*0.6)  
train.df2 <- new.cohort.df2[train.index2, ]
valid.df2 <- new.cohort.df2[-train.index2, ]

library(MASS)
f <- paste(names(train_raw.df)[106], "~", paste(names(train_raw.df)[-106], collapse=" + "))
wdbc_raw.lda <- lda(as.formula(paste(f)), data = train_raw.df)
#predictions on our testing-data
wdbc_raw.lda.predict <- predict(wdbc_raw.lda, newdata = test_raw.df)

#Evaluation
### CONSTRUCTING ROC AUC PLOT:
# Get the posteriors as a dataframe.
wdbc_raw.lda.predict.posteriors <- as.data.frame(wdbc_raw.lda.predict$posterior)
# Evaluate the model
library(ROCR)
pred <- prediction(wdbc_raw.lda.predict.posteriors[,2], test_raw.df$PredictFinals)
roc.perf = performance(pred, measure = "tpr", x.measure = "fpr")
auc.train <- performance(pred, measure = "auc")
auc.train <- auc.train@y.values
##############################################For imbalanced###########################################
#Without patientunitstayid and numOfClasses 
new.cohort.df<- new.cohort.df[,-c(1,103)]
### split the data
set.seed(111)
train.index <- sample(1:dim(new.cohort.df)[1], dim(new.cohort.df)[1]*0.6)  
train.df <- new.cohort.df[train.index, ]
valid.df <- new.cohort.df[-train.index, ]


library(ROSE)
summary(new.cohort.df)
summary(train.df)

#over sampling
#check table
table(train.df$PredictFinal)


data_balanced_over <- ovun.sample(VasoHydralazine ~ ., data = train.df, method = "over",N = 1086)$data#new.cohort.df
table(data_balanced_both$VasoHydralazine)

?ovun.sample

#Under sample
#BetaLabetalol: positive 322 from 958
#Only Labetalol as monotheraphy
i<-1
#Atenolol-Its working
while (i <= nrow(new.cohort.df)){
  if(new.cohort.df[i,89]==1) 
  {
    new.cohort.df<-new.cohort.df[-i,]  
    print(i)
    i<-i+1
  }
  else
  {

    i<-i+1
  }
  
}
summary(new.cohort.df)
#Without Metoporolol
i<-1
#Metoprolol-Its working
while (i <= nrow(new.cohort.df)){
  if(new.cohort.df[i,92]==1) 
  {
    new.cohort.df<-new.cohort.df[-i,]  
    print(i)
    i<-i
  }
  else
  {
    
    i<-i+1
  }
  
}
summary(new.cohort.df)
#Without Carvedilol
i<-1
#Metoprolol-Its working
while (i <= nrow(new.cohort.df)){
  if(new.cohort.df[i,90]==1) 
  {
    new.cohort.df<-new.cohort.df[-i,]  
    print(i)
    i<-i
  }
  else
  {
    
    i<-i+1
  }
  
}
summary(new.cohort.df)
summary(train.df)
#Labetalol

#data_balanced_both
data_balanced_both <- ovun.sample( BetaLabetalol ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$BetaLabetalol)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\MIMIC DATA\\BigQuery\\Balanced_Labetalol.csv", row.names = FALSE)


#VasoHydralazin
#data_balanced_both
data_balanced_both <- ovun.sample( VasoHydralazine ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$VasoHydralazine)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\MIMIC DATA\\BigQuery\\Balanced_Hydralazine.csv", row.names = FALSE)

#BetaMetoprolol as monotherapy
#Without Carvedilol(90), Atenolol(89) , Labetalol(91)
i<-1
#Metoprolol-
while (i <= nrow(new.cohort.df)){
  if(new.cohort.df[i,91]==1) 
  {
    new.cohort.df<-new.cohort.df[-i,]  
    print(i)
    i<-i
  }
  else
  {
    
    i<-i+1
  }
}

summary(new.cohort.df)
data_balanced_both <- ovun.sample( BetaMetoprolol ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$BetaMetoprolol)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\MIMIC DATA\\BigQuery\\Balanced_Metoprolol.csv", row.names = FALSE)

#Lisinopril
data_balanced_both <- ovun.sample( ACEIILisinopril ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$ACEIILisinopril)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\MIMIC DATA\\BigQuery\\ACEIILisinopril.csv", row.names = FALSE)

#DiuFurosemide
data_balanced_both <- ovun.sample( DiuFurosemide ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$DiuFurosemide)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\MIMIC DATA\\BigQuery\\Balanced_Furosemide.csv", row.names = FALSE)

#CaAmlodipine as monotherapy
#Without Nicardipine(87), Diltiazem(86)
i<-1
while (i <= nrow(new.cohort.df)){
  if(new.cohort.df[i,86]==1) 
  {
    new.cohort.df<-new.cohort.df[-i,]  
    print(i)
    i<-i
  }
  else
  {
    
    i<-i+1
  }
}
summary(new.cohort.df)

data_balanced_both <- ovun.sample( CaAmlodipine ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$CaAmlodipine)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\MIMIC DATA\\BigQuery\\Balanced_Amlodipine.csv", row.names = FALSE)

#Nicardipine
#Without Nicardipine(87), Diltiazem(86) , Amlodipine(85)
i<-1
while (i <= nrow(new.cohort.df)){
  if(new.cohort.df[i,85]==1) 
  {
    new.cohort.df<-new.cohort.df[-i,]  
    print(i)
    i<-i
  }
  else
  {
    
    i<-i+1
  }
}
summary(new.cohort.df)
data_balanced_both <- ovun.sample( CaNicardipine ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$CaNicardipine)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\MIMIC DATA\\BigQuery\\Balanced_Nicardipine.csv", row.names = FALSE)

#BetaCarvedilol
#Without Metoprolol(92), Atenolol(89) , Labetalol(91)
i<-1
while (i <= nrow(new.cohort.df)){
  if(new.cohort.df[i,89]==1) 
  {
    new.cohort.df<-new.cohort.df[-i,]  
    print(i)
    i<-i
  }
  else
  {
    
    i<-i+1
  }
}
summary(new.cohort.df)

data_balanced_both <- ovun.sample( BetaCarvedilol ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$BetaCarvedilol)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\MBA\\Summer semester\\Seminar\\MIMIC DATA\\BigQuery\\Balanced_Carvedilol.csv", row.names = FALSE)


# Plot
plot(roc.perf)
abline(a=0, b= 1)
text(x = .25, y = .65 ,paste("AUC = ", round(auc.train[[1]],3), sep = ""))

#Normalize
#Without numOfClasses
new.cohort.df<-new.cohort.df[,-(98)]
new.cohort.df<-new.cohort.df[,-(2)]#'Without ethnicity
?lapply
#For imbalanced-Without patientunitstay 
new.cohort.df<-new.cohort.df[,-(1)]
new.cohort.df<-new.cohort.df[,-(102)]
summary(new.cohort.df)

d <- new.cohort.df#data.frame(x=runif(10), f=as.factor(rep("X", 10)), y=runif(10),
                #i=as.integer(c(rep(1,5), rep(2,5))))
( nidx <- grep(paste(c("numeric","integer"), collapse="|"), lapply(d, class)) )
norm <- function(x) { (x - min(x)) / (max(x) - min(x)) } 
d[,nidx] <- apply(d[,nidx], MARGIN=2, FUN=norm )
str(d)

new.cohort.df<-d

### split the data
set.seed(111)
train.index <- sample(1:dim(new.cohort.df)[1], dim(new.cohort.df)[1]*0.6)  
train.df <- new.cohort.df[train.index, ]
valid.df <- new.cohort.df[-train.index, ]

 
#classification tree
  # Plotting Classification Trees with the plot.rpart and rattle pckages
  
  library(rpart)				        # Popular decision tree algorithm
  library(rattle)					# Fancy tree plot
  library(rpart.plot)				# Enhanced tree plots
  library(RColorBrewer)				# Color selection for fancy tree plot
  library(party)					# Alternative decision tree algorithm
  library(partykit)				# Convert rpart object to BinaryTree
  library(caret)
 
library(party)
tr<-ctree(PredictFinal~., data=train.df)
?ctree 
tr<-ctree(PredictFinal ~ TagtPA + admissionWeight + MaxSysBP + 
            MaxDiasBP + MaxPOTASSIUM + MinSODIUM + 
            AvgSODIUM + MinPLATELET + MaxPLATELET + AvgGLUCOSElabs + 
            VALVULAR_DISEASE + DIABETES_UNCOMPLICATED + RENAL_FAILURE + 
            COAGULOPATHY  + DRUG_ABUSE + CaChannelsB + 
            BetaB + ACEInhibitors + AngiotensinIIBlockers + Diuretics + 
            DirectVasodilators + SympatholticsAgent , data=train.df)#,  controls=ctree_control(testtype="Teststatistic"))
summary(new.cohort.df)
##CCs
tr<-ctree(PredictFinal ~ TagtPA  + MaxSysBP + 
            MaxDiasBP + CaAmlodipine + CaDiltiazem + CaNicardipine + CaNimodipine + CaVerapamil
            , data=train.df)
##BBs
tr<-ctree(PredictFinal ~ TagtPA  + MaxSysBP + BetaCarvedilol + BetaEsmolol + BetaLabetalol +BetaMetoprolol +
            MaxDiasBP + BetaAtenolol + BetaNadolol
          , data=train.df)

##CCBs and BBs

tr<-ctree(PredictFinal ~ TagtPA  + MaxSysBP + CaChannelsB+ CaAmlodipine + CaDiltiazem + CaNicardipine + CaNimodipine + CaVerapamil+
            BetaB+ BetaCarvedilol + BetaEsmolol + BetaLabetalol +BetaMetoprolol +
            MaxDiasBP + BetaAtenolol + BetaNadolol
          , data=train.df)
##ACE-I
tr<-ctree(PredictFinal ~ TagtPA  + MaxSysBP + MaxDiasBP + ACEICaptopril + ACEIEnalapril +
          ACEIILisinopril + ACEIIQuinapril
          , data=train.df)

##CCBs and BBs and ACE-I
tr<-ctree(PredictFinal ~ TagtPA  + MaxSysBP + CaAmlodipine + CaDiltiazem + CaNicardipine + CaNimodipine + CaVerapamil+
            BetaCarvedilol + BetaEsmolol + BetaLabetalol +BetaMetoprolol +
            MaxDiasBP + BetaAtenolol + BetaNadolol + ACEICaptopril + ACEIEnalapril +
            ACEIILisinopril + ACEIIQuinapril
          , data=train.df)

##All: CCBs and BBs and ACE-I and ARBS + Diuretics + DirectVasodilators + SympatholticsAgent + NitroPrusside

tr<-ctree(PredictFinal ~ TagtPA  + MaxSysBP + CaAmlodipine + CaDiltiazem + CaNicardipine + CaNimodipine + CaVerapamil+
            BetaCarvedilol + BetaEsmolol + BetaLabetalol +BetaMetoprolol +
            MaxDiasBP + BetaAtenolol + BetaNadolol + ACEICaptopril + ACEIEnalapril + 
            ACEIILisinopril + ACEIIQuinapril + AngILosartan + AngIValsartan + DiuBumetanide +
            + DiuFurosemide + DiuHydrochlorothiazide + DiuSpironolactone + VasoHydralazine
            + DirectClonidine + NitroPrusside
          , data=train.df)

plot(tr)
tr
?ctree
plot(tr, type="simple")
plot(tr, type="extended")

?plot
plot (tr,inner_panel=innerWeights,
      terminal_panel=node_barplot2,
      tp_args = list(ylines = c(2, 4))) # this arg. modifies the spacing between barplots

tr
summary(tr)
pred<-predict(tr,newdata=valid.df)
class(pred)#factor

library(caret)
valid.df$PredictFinal<-as.factor(valid.df$PredictFinal)
pred<-ifelse(pred>=1, 1, 0)
pred<-as.factor(pred)
confusionMatrix((pred),valid.df$PredictFinal,positive='1', mode = "prec_recall")
?confusionMatrix
class(pred)

summary(valid.df$PredictFinal)
library(forecast)
#the parameters need to be from numeric class
pred<-as.numeric(as.character(pred))
valid.df$PredictFinal<- as.numeric(as.character(valid.df$PredictFinal))
accuracy(pred, valid.df$PredictFinal)
?accuracy
library(AUC)
r <- roc(pred, as.factor(valid.df$PredictFinal))
auc(r)
plot(r)

library(strucchange)
library((parallel))
library(partykit)
?ctree

#Write to a file tr
png("tr1.png", res=100, height=2000, width=4000) 
plot(tr) 
plot(tr, type="simple")
dev.off()

#Plot with partykit package instead
library(partykit) 
tr<-ctree(
          PredictFinal ~ TagtPA  + MaxSysBP + 
            MaxDiasBP + CaAmlodipine + CaDiltiazem + CaNicardipine + CaNimodipine + CaVerapamil
          , data=train.df)

##All: CCBs and BBs and ACE-I and ARBS + Diuretics + DirectVasodilators + SympatholticsAgent + NitroPrusside

tr<-ctree(PredictFinal ~ TagtPA  + MaxSysBP + CaAmlodipine + CaDiltiazem + CaNicardipine + CaNimodipine + CaVerapamil+
            BetaCarvedilol + BetaEsmolol + BetaLabetalol +BetaMetoprolol +
            MaxDiasBP + BetaAtenolol + BetaNadolol + ACEICaptopril + ACEIEnalapril + 
            ACEIILisinopril + ACEIIQuinapril + AngILosartan + AngIValsartan + DiuBumetanide +
            + DiuFurosemide + DiuHydrochlorothiazide + DiuSpironolactone + VasoHydralazine
          + DirectClonidine + NitroPrusside
          , data=train.df)

tr
plot(tr)
plot(tr, type= "simple")

tr2 <- ctree(PredictFinal ~ ., data = train.df)
class(tr2)  # different class from before

#SBP time-wigthed avarage

tr<-ctree(SysBPWA ~ TagtPA + CaAmlodipine + CaDiltiazem + CaNicardipine + 
CaNimodipine + CaVerapamil + BetaCarvedilol + BetaEsmolol + 
  BetaLabetalol + BetaMetoprolol + BetaAtenolol + BetaNadolol + 
  ACEICaptopril + ACEIEnalapril + ACEIILisinopril + ACEIIQuinapril + 
  AngILosartan + AngIValsartan + DiuBumetanide + +DiuFurosemide + 
  DiuHydrochlorothiazide + DiuSpironolactone + VasoHydralazine + 
  DirectClonidine + NitroPrusside + MinSODIUM , data=train.df)
plot(tr, type= "simple")

tr<-ctree(DiasBPWA ~ TagtPA + CaAmlodipine + CaDiltiazem + CaNicardipine + 
            CaNimodipine + CaVerapamil + BetaCarvedilol + BetaEsmolol + 
            BetaLabetalol + BetaMetoprolol + BetaAtenolol + BetaNadolol + 
            ACEICaptopril + ACEIEnalapril + ACEIILisinopril + ACEIIQuinapril + 
            AngILosartan + AngIValsartan + DiuBumetanide + +DiuFurosemide + 
            DiuHydrochlorothiazide + DiuSpironolactone + VasoHydralazine + 
            DirectClonidine + NitroPrusside + MinSODIUM , data=train.df)

#############################For balanced medications######################################################

tr<-ctree(PredictFinal ~  age + TagtPA + MaxSysBP + AvgSysBP + 
  MaxDiasBP + MaxHeartRate + AvgRespRate +
  AvgBICARBONATE + AvgPH + AvgCREATININE + AvgBUN + MinSODIUM + 
  AvgCalciumTotal + AvgCHLORIDE +  AvgHEMATOCRIT + AvgHEMOGLOBIN + 
  AvgMCH + AvgMCHC + AvgMCV + AvgRDW + AvgPLATELET + 
  MinGLUCOSELlabs + CONGESTIVE_HEART_FAILURE + PULMONARY_CIRCULATION + 
  CHRONIC_PULMONARY + DIABETES_COMPLICATED + HYPOTHYROIDISM + 
  METASTATIC_CANCER + OBESITY + FLUID_ELECTROLYTE + 
  PSYCHOSES + CaAmlodipine + CaNicardipine + BetaCarvedilol + 
  BetaLabetalol + BetaMetoprolol + ACEIILisinopril + DiuFurosemide + 
  NitroPrusside, data=train.df)

plot(tr, type= "simple")

#After setpwise regression and interactions

#
library(party)
tr<-ctree(PredictFinal ~ age + TagtPA + MaxSysBP + MaxDiasBP + AvgBICARBONATE + AvgPH + AvgCREATININE + AvgBUN + MinSODIUM 
 + MinGLUCOSELlabs + CONGESTIVE_HEART_FAILURE + PULMONARY_CIRCULATION + 
  CHRONIC_PULMONARY + DIABETES_COMPLICATED + HYPOTHYROIDISM + 
  METASTATIC_CANCER + OBESITY + FLUID_ELECTROLYTE +  PSYCHOSES + CaAmlodipine + CaNicardipine + BetaCarvedilol + 
  BetaLabetalol + BetaMetoprolol + ACEIILisinopril + DiuFurosemide + 
  NitroPrusside, data=train.df)

plot(tr, type= "simple")

#
rf<-cforest(PredictFinal ~ age + TagtPA + MaxSysBP + MaxDiasBP + AvgBICARBONATE + AvgPH + AvgCREATININE + AvgBUN + MinSODIUM 
            + MinGLUCOSELlabs + CONGESTIVE_HEART_FAILURE + PULMONARY_CIRCULATION + 
              CHRONIC_PULMONARY + DIABETES_COMPLICATED + HYPOTHYROIDISM + 
              METASTATIC_CANCER + OBESITY + FLUID_ELECTROLYTE +  PSYCHOSES + CaAmlodipine + CaNicardipine + BetaCarvedilol + 
              BetaLabetalol + BetaMetoprolol + ACEIILisinopril + DiuFurosemide + 
              NitroPrusside, data=train.df)
  
plot(rf, type= "simple")

###########################################################################################################


class(train.df$BetaLabetalol)
summary(new.cohort.df)
treeP = predict(tr, newdata = valid.df)
accuracy(treeP,valid.df$DiasBPWA)
str(new.cohort.df)

# "constparty" "party"  
plot(airct, gp = gpar(fontsize = 6),     # font size changed to 6
     inner_panel=node_inner,
     ip_args=list(
       abbreviate = TRUE, 
       id = FALSE)
)

sctest(tr, node = 1)
tab <- tapply(valid.df$PredictFinal, predict(tr, type = "node"),
              function(y) c("n" = length(y), 100 * prop.table(table(y))))
do.call("rbind", tab)
#############
# Make big tree
form <- as.formula(PredictFinal ~ TagtPA + admissionWeight + MaxSysBP + 
                     MaxDiasBP + MaxPOTASSIUM + MinSODIUM + 
                     AvgSODIUM + MinPLATELET + MaxPLATELET + AvgGLUCOSElabs + 
                     VALVULAR_DISEASE + DIABETES_UNCOMPLICATED + RENAL_FAILURE + 
                     COAGULOPATHY + DEFICIENCY_ANEMIAS + DRUG_ABUSE + CaChannelsB + 
                     BetaB + ACEInhibitors + AngiotensinIIBlockers + Diuretics + 
                     DirectVasodilators + SympatholticsAgent + Nitro)
tree.1 <- rpart(form,data=new.cohort.df,control=rpart.control(minsplit=20,cp=0))
# 
plot(tree.1)					# Will make a mess of the plot
text(tree.1)
# 
prp(tree.1)					# Will plot the tree
prp(tree.1,varlen=3)				# Shorten variable names

# Interatively prune the tree
new.tree.1 <- prp(tree.1,snip=TRUE)$obj # interactively trim the tree
prp(new.tree.1) # display the new tree

tree.2 <- rpart(form,data)			# A more reasonable tree
prp(tree.2)                                     # A fast plot													
fancyRpartPlot(tree.2)				# A fancy plot from rattle

#-------------------------------------------------------------------
# Plot a tree built with RevoScaleR
   # Construct a model formula
sdNames <- names(segmentationData)
X <- as.vector(sdNames[-c(1,2,3)])
form <- as.formula(paste("Class","~", paste(X,collapse="+")))
# Run the model
rx.tree <- rxDTree(form, data = segmentationData,maxNumBins = 100,
                   minBucket = 10,maxDepth = 5,cp = 0.01, xVal = 0)
# Plot the tree						
prp(rxAddInheritance(rx.tree))
fancyRpartPlot(rxAddInheritance(rx.tree))

library (rpart)
data (new.cohort.df)

draw.tree (clip.rpart (rpart (new.cohort.df), best=7), 
           nodeinfo=TRUE, units="species", cases="cells", digits=0)

###########
#Random Forst
summary(new.cohort.df)
str(new.cohort.df)

PredictFinal ~ gender + TagtPA + admissionWeight + MaxSysBP + 
  AvgSysBP + MaxDiasBP + AvgPOTASSIUM + MaxPOTASSIUM + MinSODIUM + 
  AvgSODIUM + MaxSODIUM + MinPLATELET + MaxPLATELET + AvgGLUCOSElabs + 
  VALVULAR_DISEASE + DIABETES_UNCOMPLICATED + RENAL_FAILURE + 
  COAGULOPATHY + DEFICIENCY_ANEMIAS + DRUG_ABUSE + CaChannelsB + 
  BetaB + ACEInhibitors + AngiotensinIIBlockers + Diuretics + 
  DirectVasodilators + SympatholticsAgent + Nitro
?cforest

rf<-cforest(PredictFinal~., data=train.df)
#After stepwise regression

rf<-cforest(PredictFinal ~ gender + TagtPA + admissionWeight + MaxSysBP + 
              AvgSysBP + MaxDiasBP + AvgPOTASSIUM + MaxPOTASSIUM + MinSODIUM + 
              AvgSODIUM + MaxSODIUM + MinPLATELET + MaxPLATELET + AvgGLUCOSElabs + 
              VALVULAR_DISEASE + DIABETES_UNCOMPLICATED + RENAL_FAILURE + 
              COAGULOPATHY + DEFICIENCY_ANEMIAS + DRUG_ABUSE + CaChannelsB + 
              BetaB + ACEInhibitors + AngiotensinIIBlockers + Diuretics + 
              DirectVasodilators + SympatholticsAgent + Nitro, data=train.df)


pred<-predict(rf,newdata=valid.df)
library(caret)
class(pred)#factor
pred<-as.numeric(as.character(pred))
valid.df$PredictFinal<-as.numeric(as.character(valid.df$PredictFinal))
class(pred)
confusionMatrix(as.factor(ifelse(pred>0.1,1,0)),as.factor(valid.df$PredictFinal),positive='1')
accuracy(pred,valid.df$PredictFinal)

r <- roc(pred, as.factor(valid.df$PredictFinal))
auc(r)
plot(r)

valid.df$Predict2<-as.factor(valid.df$Predict2)
pred<-as.factor(ifelse(pred>=0.5, 1, 0))
confusionMatrix(pred,valid.df$Predict2,positive='1')

# Algorithm Tune (tuneRF)
# Create model with default paramters

library(randomForest)
x<-new.cohort.df[,1:97]
y<-new.cohort.df[,98]
control <- trainControl(method="repeatedcv", number=10, repeats=3)
seed <- 7
metric <- "Accuracy"
set.seed(seed)
mtry <- sqrt(ncol(x))
tunegrid <- expand.grid(.mtry=mtry)
rf_default <- train(PredictFinal~., data=new.cohort.df, method="rf", metric=metric, tuneGrid=tunegrid, trControl=control)
print(rf_default)
set.seed(seed)
bestmtry <- tuneRF(x, y, stepFactor=1.5, improve=1e-5, ntree=500)
print(bestmtry)


# Random Search
control <- trainControl(method="repeatedcv", number=10, repeats=3, search="random")
set.seed(seed)
mtry <- sqrt(ncol(x))
rf_random <- train(PredictFinal~., data=new.cohort.df, method="rf", metric=metric, tuneLength=15, trControl=control)
print(rf_random)
plot(rf_random)

# randomForest(formula = medv ~ ., data = Boston, subset = train) 
##                Type of random forest: regression
##                      Number of trees: 500
## No. of variables tried at each split: 4
library(randomForest)
?randomForest
rfRec=randomForest(PredictFinal ~ . , data = new.cohort.df , subset = train.index)
rfRec
class(rfRec)
plot(rfRec)
pred<-predict(rfRec,new.cohort.df[-train.index,])
class(pred)#In Ops.factor(pred, 1) : ‘>=’ not meaningful for factors
pred<-as.numeric(as.character(pred))
pred<-as.factor(ifelse(pred>=1, 1, 0))
library(caret)
valid.df$PredictFinal<-as.factor(valid.df$PredictFinal)

confusionMatrix(pred,valid.df$PredictFinal,positive='1', mode = "prec_recall")
?confusionMatrix
#####RF importance
varImp(rfRec)
#Mean decrease Gini
varImpPlot(rfRec,type=2)

library(randomForest)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
set.seed(42)

?importance
# Extracts variable importance (Mean Decrease in Gini Index)
# Sorts by variable importance and relevels factors to match ordering
var_importance <- data_frame(variable=setdiff(colnames(train2), "PredictFinal"),
                             importance=as.vector(importance(rfRec)))
var_importance <- arrange(var_importance, desc(importance))
var_importance$variable <- factor(var_importance$variable, levels=var_importance$variable)

dev.off()
p <- ggplot(var_importance, aes(x=variable, weight=importance, fill=variable))
p <- p + geom_bar() + ggtitle("Variable Importance from Random Forest")

p <- p + xlab("Attributes") + ylab("Variable Importance (Mean Decrease in Gini Index)")
p <- p + scale_fill_discrete(name="Variable Name")+scale_fill_grey(start = 0.2,end = 0.8)
p + theme(axis.text.x=element_blank(),
          axis.text.y=element_text(size=12),
          axis.title=element_text(size=16),
          plot.title=element_text(size=18),
          legend.title=element_text(size=16),
          legend.text=element_text(size=12))
?colnames
#Choose the relevant var
train2<- train.df[, c("PredictFinal", "MaxSysBP" , "MaxDiasBP" , "TagtPA" , "CaAmlodipine" , "CaDiltiazem", "CaNicardipine" ,"CaNimodipine" , "CaVerapamil" , "BetaCarvedilol" , "BetaEsmolol","BetaLabetalol" , "BetaMetoprolol" , "BetaAtenolol" , "BetaNadolol"  ,"ACEICaptopril", "ACEIEnalapril" , "ACEIILisinopril" , "ACEIIQuinapril"  ,"AngILosartan" , "AngIValsartan" , "DiuBumetanide" , "DiuFurosemide" ,"DiuHydrochlorothiazide" , "DiuSpironolactone" , "VasoHydralazine" ,"DirectClonidine", "NitroPrusside" , "MinSODIUM")]


###Plot subset after fiture selection
rfRec=randomForest(PredictFinal ~ MaxSysBP + MaxDiasBP + TagtPA + CaAmlodipine + CaDiltiazem + CaNicardipine + 
                     CaNimodipine + CaVerapamil + BetaCarvedilol + BetaEsmolol + 
                     BetaLabetalol + BetaMetoprolol + BetaAtenolol + BetaNadolol + 
                     ACEICaptopril + ACEIEnalapril + ACEIILisinopril + ACEIIQuinapril + 
                     AngILosartan + AngIValsartan + DiuBumetanide + +DiuFurosemide + 
                     DiuHydrochlorothiazide + DiuSpironolactone + VasoHydralazine + 
                     DirectClonidine + NitroPrusside + MinSODIUM , data = new.cohort.df , subset = train.index )
rfRec

rf<-cforest(PredictFinal ~ MaxSysBP + MaxDiasBP + TagtPA + CaAmlodipine + CaDiltiazem + CaNicardipine + 
              CaNimodipine + CaVerapamil + BetaCarvedilol + BetaEsmolol + 
              BetaLabetalol + BetaMetoprolol + BetaAtenolol + BetaNadolol + 
              ACEICaptopril + ACEIEnalapril + ACEIILisinopril + ACEIIQuinapril + 
              AngILosartan + AngIValsartan + DiuBumetanide + +DiuFurosemide + 
              DiuHydrochlorothiazide + DiuSpironolactone + VasoHydralazine + 
              DirectClonidine + NitroPrusside + MinSODIUM, data=train.df)

varimp(rf)
class(rf)

?varimp
cforestImpPlot <- function(x) {
  cforest_importance <<- v <- varimp(x, conditional = TRUE)
  dotchart(v[order(v)])
}

cforestImpPlot(rf)

library(vip)

?vip
vip(rf)
p2 <- vip(rf, width = 0.5, aesthetics = list(fill = "gray")) + ggtitle("Variable Importance from Random Forest", "") 
p2

varimp(rf,conditional = TRUE)
cforestImpPlot(rf)

vi_model(rf)

#Without numOfClasses
new.cohort.df<-new.cohort.df[,-(122)]


library(forecast)
#the parameters need to be from numeric class
pred<-as.numeric(as.character(pred))
valid.df$PredictFinal<- as.numeric(as.character(valid.df$PredictFinal))
accuracy(pred, valid.df$PredictFinal)


r <- roc(pred, as.factor(valid.df$PredictFinal))
library(AUC)
auc(r)
?auc
oob.err=double(98)
test.err=double(98)

#mtry is no of Variables randomly chosen at each split
for(mtry in 1:98) 
{
  rf=randomForest(PredictFinal~ ., data = new.cohort.df , subset = train.index , mtry=mtry,ntree=400) 
  oob.err[mtry] = rf$mse[400] #Error of all Trees fitted
  
  pred<-predict(rf,Boston[-train,]) #Predictions on Test Set for each Tree
  test.err[mtry]= with(new.cohort.df2[-train.index, ], mean( (Predict2 - pred)^2)) #Mean Squared Test Error
  
  cat(mtry," ") #printing the output to the console
  
}

# logistic regression
rename <- function(dat, oldnames, newnames) {
  datnames <- colnames(dat)
  datnames[which(datnames %in% oldnames)] <- newnames
  colnames(dat) <- datnames
  dat
}

dat <- rename(valid.df2,c("Predict21","TagtPA1"), c("Predict2","TagtPA"))
head(dat)
valid.df2<-dat
reg <- glm(PredictFinal ~ ., 
           data = train.df, 
           family = "binomial")
summary(reg)
str(reg)
pred <- predict(reg, valid.df, type = "response")

library(caret)
valid.df$PredictFinal<-as.factor(valid.df$PredictFinal)
pred<-as.factor(ifelse(pred>=0.5, 1, 0))

confusionMatrix(pred,valid.df$PredictFinal,positive='1', mode = "prec_recall")
?confusionMatrix
class(pred)

library(forecast)
#the parameters need to be from numeric class
pred<-as.numeric(as.character(pred))
valid.df$PredictFinal<- as.numeric(as.character(valid.df$PredictFinal))
accuracy(pred, valid.df$PredictFinal)



r <- roc(pred, as.factor(valid.df$PredictFinal))
auc(r)
###########################################Preprocess####################################################
options(max.print = 10000)        # Change global options to print all interactions
#Interactions between var
regInt <- glm(PredictFinal ~ .^2, 
           data = train.df, 
           family = "binomial")
summary(regInt)


#STEPWISE REGRESSION
reg.step<-step(reg)
#RESULT PredictFinal ~ gender + TagtPA + admissionWeight + MaxSysBP + 
#AvgSysBP + MaxDiasBP + AvgPOTASSIUM + MaxPOTASSIUM + MinSODIUM + 
#  AvgSODIUM + MaxSODIUM + MinPLATELET + MaxPLATELET + AvgGLUCOSElabs + 
#  VALVULAR_DISEASE + DIABETES_UNCOMPLICATED + RENAL_FAILURE + 
#  COAGULOPATHY + DEFICIENCY_ANEMIAS + DRUG_ABUSE + CaChannelsB + 
#  BetaB + ACEInhibitors + AngiotensinIIBlockers + Diuretics + 
#  DirectVasodilators + SympatholticsAgent + Nitro

#Interactions between the stepwise Variable
regInt <- glm(PredictFinal ~ ( TagtPA + admissionWeight + MaxSysBP + 
                AvgSysBP + MaxDiasBP + MaxPOTASSIUM + MinSODIUM + 
                  AvgSODIUM + MinPLATELET + MaxPLATELET + AvgGLUCOSElabs + 
                  VALVULAR_DISEASE + DIABETES_UNCOMPLICATED + RENAL_FAILURE + 
                  COAGULOPATHY + DEFICIENCY_ANEMIAS + DRUG_ABUSE + CaChannelsB + 
                  BetaB + ACEInhibitors + AngiotensinIIBlockers + Diuretics + 
                  DirectVasodilators + SympatholticsAgent + Nitro)^2, 
              data = train.df, 
              family = "binomial")
summary(regInt)
# neural network

#Interactions between variabels Balanced dattaset
regInt <- glm(PredictFinal ~  (age + TagtPA + MaxSysBP + AvgSysBP + 
            MaxDiasBP + MaxHeartRate + AvgRespRate +
            AvgBICARBONATE + AvgPH + AvgCREATININE + AvgBUN + MinSODIUM + 
            AvgCalciumTotal + AvgCHLORIDE +  AvgHEMATOCRIT + AvgHEMOGLOBIN + 
            AvgMCH + AvgMCHC + AvgMCV + AvgRDW + AvgPLATELET + 
            MinGLUCOSELlabs + CONGESTIVE_HEART_FAILURE + PULMONARY_CIRCULATION + 
            CHRONIC_PULMONARY + DIABETES_COMPLICATED + HYPOTHYROIDISM + 
            METASTATIC_CANCER + OBESITY + FLUID_ELECTROLYTE + 
            PSYCHOSES + CaAmlodipine + CaNicardipine + BetaCarvedilol + 
            BetaLabetalol + BetaMetoprolol + ACEIILisinopril + DiuFurosemide + 
            NitroPrusside)^2, data=train.df, family = "binomial")

summary(regInt)




set.seed(1)
library(nnet)
nn<- nnet(PredictFinal ~ ., 
           data = train.df, size = 5, 
           decay = 0.01, maxit = 1000)
pred <- predict(nn, valid.df)
valid.df$PredictFinal<-as.factor(valid.df$PredictFinal)
pred<-as.factor(ifelse(pred>=0.5, 1, 0))
confusionMatrix(pred,valid.df$PredictFinal,positive='1', mode = "prec_recall")

r <- roc(pred, as.factor(valid.df$PredictFinal))
auc(r)
#plot 
plot.nnet(nn)

library(neuralnet)

#Neural Network
m <- model.matrix( 
  ~ PredictFinal +. , 
  data = train.df 
)
class(m$TimetoICU)
class(valid.df$Predict2)
m<-m[,-1]
nn <- neuralnet(PredictFinal~.,data = m, hidden=c(2,1), linear.output=FALSE, threshold=0.01)
nn$result.matrix
plot(nn)

plot(nn, rep="best")
m <- model.matrix( 
  ~ Predict2 +. , 
  data = valid.df2 
)
class(m$TimetoICU)
class(valid.df$Predict2)
m<-m[,-1]
valid.df2<-m
pred <- predict(nn, valid.df2)
valid.df2<-as.data.frame(valid.df2)
r <- roc(pred, as.factor(valid.df2$Predict21))
auc(r)
#Model validation secound approch
class(pred)
xy.df<-valid.df[,-1]
xy.list <- setNames(split(xy.df, seq(nrow(xy.df))), rownames(xy.df))
temp_test <- subset(valid.df, select =Age:Nitro1 )
head(temp_test)
nn.results <- compute(nn, temp_test)
results <- data.frame(actual = valid.df$Predict21, prediction = nn.results$net.result)
#results <- data.frame(actual = train.df$Predict2, prediction = pred)
results
predicted=results$prediction * abs(diff(range(Predict21))) + min(Predict21)
actual=results$actual * abs(diff(range(Predict21))) + min(Predict21)
comparison=data.frame(predicted,actual)
deviation=((actual-predicted)/actual)
comparison=data.frame(predicted,actual,deviation)
accuracy=1-abs(mean(deviation))
accuracy

#########################################33
#import the function from Github
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

plot.nnet <- function(mod.in,nid=T,all.out=T,all.in=T,bias=T,wts.only=F,rel.rsc=5,circle.cex=5,
                      node.labs=T,var.labs=T,x.lab=NULL,y.lab=NULL,line.stag=NULL,struct=NULL,cex.val=1,
                      alpha.val=1,circle.col='lightblue',pos.col='black',neg.col='grey', max.sp = F, ...){
  
  require(scales)
  
  #sanity checks
  if('mlp' %in% class(mod.in)) warning('Bias layer not applicable for rsnns object')
  if('numeric' %in% class(mod.in)){
    if(is.null(struct)) stop('Three-element vector required for struct')
    if(length(mod.in) != ((struct[1]*struct[2]+struct[2]*struct[3])+(struct[3]+struct[2])))
      stop('Incorrect length of weight matrix for given network structure')
  }
  if('train' %in% class(mod.in)){
    if('nnet' %in% class(mod.in$finalModel)){
      mod.in<-mod.in$finalModel
      warning('Using best nnet model from train output')
    }
    else stop('Only nnet method can be used with train object')
  }
  
  #gets weights for neural network, output is list
  #if rescaled argument is true, weights are returned but rescaled based on abs value
  nnet.vals<-function(mod.in,nid,rel.rsc,struct.out=struct){
    
    require(scales)
    require(reshape)
    
    if('numeric' %in% class(mod.in)){
      struct.out<-struct
      wts<-mod.in
    }
    
    #neuralnet package
    if('nn' %in% class(mod.in)){
      struct.out<-unlist(lapply(mod.in$weights[[1]],ncol))
      struct.out<-struct.out[-length(struct.out)]
      struct.out<-c(
        length(mod.in$model.list$variables),
        struct.out,
        length(mod.in$model.list$response)
      )    		
      wts<-unlist(mod.in$weights[[1]])   
    }
    
    #nnet package
    if('nnet' %in% class(mod.in)){
      struct.out<-mod.in$n
      wts<-mod.in$wts
    }
    
    #RSNNS package
    if('mlp' %in% class(mod.in)){
      struct.out<-c(mod.in$nInputs,mod.in$archParams$size,mod.in$nOutputs)
      hid.num<-length(struct.out)-2
      wts<-mod.in$snnsObject$getCompleteWeightMatrix()
      
      #get all input-hidden and hidden-hidden wts
      inps<-wts[grep('Input',row.names(wts)),grep('Hidden_2',colnames(wts)),drop=F]
      inps<-melt(rbind(rep(NA,ncol(inps)),inps))$value
      uni.hids<-paste0('Hidden_',1+seq(1,hid.num))
      for(i in 1:length(uni.hids)){
        if(is.na(uni.hids[i+1])) break
        tmp<-wts[grep(uni.hids[i],rownames(wts)),grep(uni.hids[i+1],colnames(wts)),drop=F]
        inps<-c(inps,melt(rbind(rep(NA,ncol(tmp)),tmp))$value)
      }
      
      #get connections from last hidden to output layers
      outs<-wts[grep(paste0('Hidden_',hid.num+1),row.names(wts)),grep('Output',colnames(wts)),drop=F]
      outs<-rbind(rep(NA,ncol(outs)),outs)
      
      #weight vector for all
      wts<-c(inps,melt(outs)$value)
      assign('bias',F,envir=environment(nnet.vals))
    }
    
    if(nid) wts<-rescale(abs(wts),c(1,rel.rsc))
    
    #convert wts to list with appropriate names 
    hid.struct<-struct.out[-c(length(struct.out))]
    row.nms<-NULL
    for(i in 1:length(hid.struct)){
      if(is.na(hid.struct[i+1])) break
      row.nms<-c(row.nms,rep(paste('hidden',i,seq(1:hid.struct[i+1])),each=1+hid.struct[i]))
    }
    row.nms<-c(
      row.nms,
      rep(paste('out',seq(1:struct.out[length(struct.out)])),each=1+struct.out[length(struct.out)-1])
    )
    out.ls<-data.frame(wts,row.nms)
    out.ls$row.nms<-factor(row.nms,levels=unique(row.nms),labels=unique(row.nms))
    out.ls<-split(out.ls$wts,f=out.ls$row.nms)
    
    assign('struct',struct.out,envir=environment(nnet.vals))
    
    out.ls
    
  }
  
  wts<-nnet.vals(mod.in,nid=F)
  
  if(wts.only) return(wts)
  
  #circle colors for input, if desired, must be two-vector list, first vector is for input layer
  if(is.list(circle.col)){
    circle.col.inp<-circle.col[[1]]
    circle.col<-circle.col[[2]]
  }
  else circle.col.inp<-circle.col
  
  #initiate plotting
  x.range<-c(0,100)
  y.range<-c(0,100)
  #these are all proportions from 0-1
  if(is.null(line.stag)) line.stag<-0.011*circle.cex/2
  layer.x<-seq(0.17,0.9,length=length(struct))
  bias.x<-layer.x[-length(layer.x)]+diff(layer.x)/2
  bias.y<-0.95
  circle.cex<-circle.cex
  
  #get variable names from mod.in object
  #change to user input if supplied
  if('numeric' %in% class(mod.in)){
    x.names<-paste0(rep('X',struct[1]),seq(1:struct[1]))
    y.names<-paste0(rep('Y',struct[3]),seq(1:struct[3]))
  }
  if('mlp' %in% class(mod.in)){
    all.names<-mod.in$snnsObject$getUnitDefinitions()
    x.names<-all.names[grep('Input',all.names$unitName),'unitName']
    y.names<-all.names[grep('Output',all.names$unitName),'unitName']
  }
  if('nn' %in% class(mod.in)){
    x.names<-mod.in$model.list$variables
    y.names<-mod.in$model.list$respons
  }
  if('xNames' %in% names(mod.in)){
    x.names<-mod.in$xNames
    y.names<-attr(terms(mod.in),'factor')
    y.names<-row.names(y.names)[!row.names(y.names) %in% x.names]
  }
  if(!'xNames' %in% names(mod.in) & 'nnet' %in% class(mod.in)){
    if(is.null(mod.in$call$formula)){
      x.names<-colnames(eval(mod.in$call$x))
      y.names<-colnames(eval(mod.in$call$y))
    }
    else{
      forms<-eval(mod.in$call$formula)
      x.names<-mod.in$coefnames
      facts<-attr(terms(mod.in),'factors')
      y.check<-mod.in$fitted
      if(ncol(y.check)>1) y.names<-colnames(y.check)
      else y.names<-as.character(forms)[2]
    } 
  }
  #change variables names to user sub 
  if(!is.null(x.lab)){
    if(length(x.names) != length(x.lab)) stop('x.lab length not equal to number of input variables')
    else x.names<-x.lab
  }
  if(!is.null(y.lab)){
    if(length(y.names) != length(y.lab)) stop('y.lab length not equal to number of output variables')
    else y.names<-y.lab
  }
  
  #initiate plot
  plot(x.range,y.range,type='n',axes=F,ylab='',xlab='',...)
  
  #function for getting y locations for input, hidden, output layers
  #input is integer value from 'struct'
  get.ys<-function(lyr, max_space = max.sp){
    if(max_space){ 
      spacing <- diff(c(0*diff(y.range),0.9*diff(y.range)))/lyr
    } else {
      spacing<-diff(c(0*diff(y.range),0.9*diff(y.range)))/max(struct)
    }
    
    seq(0.5*(diff(y.range)+spacing*(lyr-1)),0.5*(diff(y.range)-spacing*(lyr-1)),
        length=lyr)
  }
  
  #function for plotting nodes
  #'layer' specifies which layer, integer from 'struct'
  #'x.loc' indicates x location for layer, integer from 'layer.x'
  #'layer.name' is string indicating text to put in node
  layer.points<-function(layer,x.loc,layer.name,cex=cex.val){
    x<-rep(x.loc*diff(x.range),layer)
    y<-get.ys(layer)
    points(x,y,pch=21,cex=circle.cex,col=in.col,bg=bord.col)
    if(node.labs) text(x,y,paste(layer.name,1:layer,sep=''),cex=cex.val)
    if(layer.name=='I' & var.labs) text(x-line.stag*diff(x.range),y,x.names,pos=2,cex=cex.val)      
    if(layer.name=='O' & var.labs) text(x+line.stag*diff(x.range),y,y.names,pos=4,cex=cex.val)
  }
  
  #function for plotting bias points
  #'bias.x' is vector of values for x locations
  #'bias.y' is vector for y location
  #'layer.name' is  string indicating text to put in node
  bias.points<-function(bias.x,bias.y,layer.name,cex,...){
    for(val in 1:length(bias.x)){
      points(
        diff(x.range)*bias.x[val],
        bias.y*diff(y.range),
        pch=21,col=in.col,bg=bord.col,cex=circle.cex
      )
      if(node.labs)
        text(
          diff(x.range)*bias.x[val],
          bias.y*diff(y.range),
          paste(layer.name,val,sep=''),
          cex=cex.val
        )
    }
  }
  
  #function creates lines colored by direction and width as proportion of magnitude
  #use 'all.in' argument if you want to plot connection lines for only a single input node
  layer.lines<-function(mod.in,h.layer,layer1=1,layer2=2,out.layer=F,nid,rel.rsc,all.in,pos.col,
                        neg.col,...){
    
    x0<-rep(layer.x[layer1]*diff(x.range)+line.stag*diff(x.range),struct[layer1])
    x1<-rep(layer.x[layer2]*diff(x.range)-line.stag*diff(x.range),struct[layer1])
    
    if(out.layer==T){
      
      y0<-get.ys(struct[layer1])
      y1<-rep(get.ys(struct[layer2])[h.layer],struct[layer1])
      src.str<-paste('out',h.layer)
      
      wts<-nnet.vals(mod.in,nid=F,rel.rsc)
      wts<-wts[grep(src.str,names(wts))][[1]][-1]
      wts.rs<-nnet.vals(mod.in,nid=T,rel.rsc)
      wts.rs<-wts.rs[grep(src.str,names(wts.rs))][[1]][-1]
      
      cols<-rep(pos.col,struct[layer1])
      cols[wts<0]<-neg.col
      
      if(nid) segments(x0,y0,x1,y1,col=cols,lwd=wts.rs)
      else segments(x0,y0,x1,y1)
      
    }
    
    else{
      
      if(is.logical(all.in)) all.in<-h.layer
      else all.in<-which(x.names==all.in)
      
      y0<-rep(get.ys(struct[layer1])[all.in],struct[2])
      y1<-get.ys(struct[layer2])
      src.str<-paste('hidden',layer1)
      wts<-nnet.vals(mod.in,nid=F,rel.rsc)
      wts<-unlist(lapply(wts[grep(src.str,names(wts))],function(x) x[all.in+1]))
      wts.rs<-nnet.vals(mod.in,nid=T,rel.rsc)
      wts.rs<-unlist(lapply(wts.rs[grep(src.str,names(wts.rs))],function(x) x[all.in+1]))
      
      cols<-rep(pos.col,struct[layer2])
      cols[wts<0]<-neg.col
      
      if(nid) segments(x0,y0,x1,y1,col=cols,lwd=wts.rs)
      else segments(x0,y0,x1,y1)
      
    }
    
  }
  
  bias.lines<-function(bias.x,mod.in,nid,rel.rsc,all.out,pos.col,neg.col,...){
    
    if(is.logical(all.out)) all.out<-1:struct[length(struct)]
    else all.out<-which(y.names==all.out)
    
    for(val in 1:length(bias.x)){
      
      wts<-nnet.vals(mod.in,nid=F,rel.rsc)
      wts.rs<-nnet.vals(mod.in,nid=T,rel.rsc)
      
      if(val != length(bias.x)){
        wts<-wts[grep('out',names(wts),invert=T)]
        wts.rs<-wts.rs[grep('out',names(wts.rs),invert=T)]
        sel.val<-grep(val,substr(names(wts.rs),8,8))
        wts<-wts[sel.val]
        wts.rs<-wts.rs[sel.val]
      }
      
      else{
        wts<-wts[grep('out',names(wts))]
        wts.rs<-wts.rs[grep('out',names(wts.rs))]
      }
      
      cols<-rep(pos.col,length(wts))
      cols[unlist(lapply(wts,function(x) x[1]))<0]<-neg.col
      wts.rs<-unlist(lapply(wts.rs,function(x) x[1]))
      
      if(nid==F){
        wts.rs<-rep(1,struct[val+1])
        cols<-rep('black',struct[val+1])
      }
      
      if(val != length(bias.x)){
        segments(
          rep(diff(x.range)*bias.x[val]+diff(x.range)*line.stag,struct[val+1]),
          rep(bias.y*diff(y.range),struct[val+1]),
          rep(diff(x.range)*layer.x[val+1]-diff(x.range)*line.stag,struct[val+1]),
          get.ys(struct[val+1]),
          lwd=wts.rs,
          col=cols
        )
      }
      
      else{
        segments(
          rep(diff(x.range)*bias.x[val]+diff(x.range)*line.stag,struct[val+1]),
          rep(bias.y*diff(y.range),struct[val+1]),
          rep(diff(x.range)*layer.x[val+1]-diff(x.range)*line.stag,struct[val+1]),
          get.ys(struct[val+1])[all.out],
          lwd=wts.rs[all.out],
          col=cols[all.out]
        )
      }
      
    }
  }
  
  #use functions to plot connections between layers
  #bias lines
  if(bias) bias.lines(bias.x,mod.in,nid=nid,rel.rsc=rel.rsc,all.out=all.out,pos.col=alpha(pos.col,alpha.val),
                      neg.col=alpha(neg.col,alpha.val))
  
  #layer lines, makes use of arguments to plot all or for individual layers
  #starts with input-hidden
  #uses 'all.in' argument to plot connection lines for all input nodes or a single node
  if(is.logical(all.in)){  
    mapply(
      function(x) layer.lines(mod.in,x,layer1=1,layer2=2,nid=nid,rel.rsc=rel.rsc,
                              all.in=all.in,pos.col=alpha(pos.col,alpha.val),neg.col=alpha(neg.col,alpha.val)),
      1:struct[1]
    )
  }
  else{
    node.in<-which(x.names==all.in)
    layer.lines(mod.in,node.in,layer1=1,layer2=2,nid=nid,rel.rsc=rel.rsc,all.in=all.in,
                pos.col=alpha(pos.col,alpha.val),neg.col=alpha(neg.col,alpha.val))
  }
  #connections between hidden layers
  lays<-split(c(1,rep(2:(length(struct)-1),each=2),length(struct)),
              f=rep(1:(length(struct)-1),each=2))
  lays<-lays[-c(1,(length(struct)-1))]
  for(lay in lays){
    for(node in 1:struct[lay[1]]){
      layer.lines(mod.in,node,layer1=lay[1],layer2=lay[2],nid=nid,rel.rsc=rel.rsc,all.in=T,
                  pos.col=alpha(pos.col,alpha.val),neg.col=alpha(neg.col,alpha.val))
    }
  }
  #lines for hidden-output
  #uses 'all.out' argument to plot connection lines for all output nodes or a single node
  if(is.logical(all.out))
    mapply(
      function(x) layer.lines(mod.in,x,layer1=length(struct)-1,layer2=length(struct),out.layer=T,nid=nid,rel.rsc=rel.rsc,
                              all.in=all.in,pos.col=alpha(pos.col,alpha.val),neg.col=alpha(neg.col,alpha.val)),
      1:struct[length(struct)]
    )
  else{
    node.in<-which(y.names==all.out)
    layer.lines(mod.in,node.in,layer1=length(struct)-1,layer2=length(struct),out.layer=T,nid=nid,rel.rsc=rel.rsc,
                pos.col=pos.col,neg.col=neg.col,all.out=all.out)
  }
  
  #use functions to plot nodes
  for(i in 1:length(struct)){
    in.col<-bord.col<-circle.col
    layer.name<-'H'
    if(i==1) { layer.name<-'I'; in.col<-bord.col<-circle.col.inp}
    if(i==length(struct)) layer.name<-'O'
    layer.points(struct[i],layer.x[i],layer.name)
  }
  if(bias) bias.points(bias.x,bias.y,'B')
  
}   

#####################

# custom barplot function to alter the appearance of terminal nodes
# modified from code provided by Achim Zeileis to the R-help mailing list 
# source the function and assign it as a grapcon_generator object
node_barplot2 <- function(ctreeobj,
                          col = "black",
                          fill = c("red", "white"),
                          beside = NULL,
                          ymax = NULL,
                          ylines = NULL,
                          widths = 1,
                          gap = NULL,
                          reverse = NULL,
                          id = TRUE)
{
  getMaxPred <- function(x) {
    mp <- max(x$prediction)
    mpl <- ifelse(x$terminal, 0, getMaxPred(x$left))
    mpr <- ifelse(x$terminal, 0, getMaxPred(x$right))
    return(max(c(mp, mpl, mpr)))
  }
  
  y <- response(ctreeobj)[[1]]
  
  if(is.factor(y) || class(y) == "was_ordered") {
    ylevels <- levels(y)
    if(is.null(beside)) beside <- if(length(ylevels) < 3) FALSE else TRUE
    if(is.null(ymax)) ymax <- if(beside) 1.1 else 1
    if(is.null(gap)) gap <- if(beside) 0.1 else 0
  } else {
    if(is.null(beside)) beside <- FALSE
    if(is.null(ymax)) ymax <- getMaxPred(ctreeobj @ tree) * 1.1
    ylevels <- seq(along = ctreeobj @ tree$prediction)
    if(length(ylevels) < 2) ylevels <- ""
    if(is.null(gap)) gap <- 1
  }
  if(is.null(reverse)) reverse <- !beside
  if(is.null(fill)) fill <- gray.colors(length(ylevels))
  if(is.null(ylines)) ylines <- if(beside) c(3, 4) else c(1.5, 2.5)
  
  ### panel function for barplots in nodes
  rval <- function(node) {
    
    ## parameter setup
    pred <- node$prediction
    if(reverse) {
      pred <- rev(pred)
      ylevels <- rev(ylevels)
    }
    np <- length(pred)
    nc <- if(beside) np else 1
    
    fill <- rep(fill, length.out = np)
    widths <- rep(widths, length.out = nc)
    col <- rep(col, length.out = nc)
    ylines <- rep(ylines, length.out = 2)
    
    gap <- gap * sum(widths)
    yscale <- c(0, ymax)
    xscale <- c(0, sum(widths) + (nc+1)*gap)
    
    top_vp <- viewport(layout = grid.layout(nrow = 2, ncol = 3,
                                            widths = unit(c(ylines[1], 1, ylines[2]), c("lines", "null", "lines")),
                                            heights = unit(c(3.5,3.5), c("lines", "null"))),
                       width = unit(1, "npc"),
                       height = unit(1, "npc") - unit(2, "lines"),
                       name = paste("node_barplot", node$nodeID, sep = ""))
    
    pushViewport(top_vp)
    grid.rect(gp = gpar(fill = "white", col = 0))
    
    ## main title
    top <- viewport(layout.pos.col=2, layout.pos.row=1)
    pushViewport(top)
    mainlab <- paste(ifelse(id, paste("Node", node$nodeID,"\n", "(n = "), "n = "),
                     sum(node$weights), ifelse(id, ")", ""), sep = "")
    grid.text(mainlab)
    popViewport()
    
    plot <- viewport(layout.pos.col=2, layout.pos.row=2,
                     xscale=xscale, yscale=yscale,
                     name = paste("node_barplot", node$nodeID, "plot",
                                  sep = ""))
    
    pushViewport(plot)
    
    if(beside) {
      xcenter <- cumsum(widths+gap) - widths/2
      for (i in 1:np) {
        grid.rect(x = xcenter[i], y = 0, height = pred[i],
                  width = widths[i],
                  just = c("center", "bottom"), default.units = "native",
                  gp = gpar(col = col[i], fill = fill[i]))
      }
      if(length(xcenter) > 1) grid.xaxis(at = xcenter, label = FALSE)
      grid.text(ylevels, x = xcenter, y = unit(-1, "lines"),
                default.units = "native",
                just= c("center","bottom"),
                check.overlap = TRUE)
      grid.yaxis()
    } else {
      ycenter <- cumsum(pred) - pred
      
      for (i in 1:np) {
        grid.rect(x = xscale[2]/2, y = ycenter[i], height = min(pred[i], ymax - ycenter[i]),
                  width = widths[1],
                  just = c("center", "bottom"), default.units = "native",
                  gp = gpar(col = col[i], fill = fill[i]))
      }
      
      grid.yaxis(at = round(1 - pred[i], digits = 2), main = FALSE)
    }
    
    grid.rect(gp = gpar(fill = "transparent"))
    upViewport(2)
  }
  
  return(rval)
}
class(node_barplot2) <- "grapcon_generator"

# custom function by user "agstudy"
# draws a white circle with the node name and the number of obs.
innerWeights <- function(node){
  grid.circle(r=0.36,gp = gpar(fill = "White",col="White"))
  mainlab <- paste( node$psplit$variableName, "\n(n = ")
  mainlab <- paste(mainlab, sum(node$weights),")" , sep = "")
  grid.text(mainlab,gp = gpar(col='black'))
}
