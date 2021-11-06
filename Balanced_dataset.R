
###############################Treating the imbalanced classification problem################################
########Only the train dataset was used to create balanced dataset

### split the data
set.seed(111)
train.index <- sample(1:dim(new.cohort.df)[1], dim(new.cohort.df)[1]*0.6)  
train.df <- new.cohort.df[train.index, ]
valid.df <- new.cohort.df[-train.index, ]

library(ROSE)

##############The next code was used on each antyhypertensive treatment to create a balanced dataset.

#data_balanced_both
#BetaLabetalol
data_balanced_both <- ovun.sample( BetaLabetalol ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$BetaLabetalol)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\Balanced_Labetalol.csv", row.names = FALSE)

#VasoHydralazin
#data_balanced_both
data_balanced_both <- ovun.sample( VasoHydralazine ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$VasoHydralazine)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\Balanced_Hydralazine.csv", row.names = FALSE)

#BetaMetoprolol
data_balanced_both <- ovun.sample( BetaMetoprolol ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$BetaMetoprolol)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\Balanced_Metoprolol.csv", row.names = FALSE)

#Lisinopril
data_balanced_both <- ovun.sample( ACEIILisinopril ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$ACEIILisinopril)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\ACEIILisinopril.csv", row.names = FALSE)

#DiuFurosemide
data_balanced_both <- ovun.sample( DiuFurosemide ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$DiuFurosemide)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\Balanced_Furosemide.csv", row.names = FALSE)

#CaAmlodipine

data_balanced_both <- ovun.sample( CaAmlodipine ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$CaAmlodipine)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\Balanced_Amlodipine.csv", row.names = FALSE)

#Nicardipine

data_balanced_both <- ovun.sample( CaNicardipine ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$CaNicardipine)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\Balanced_Nicardipine.csv", row.names = FALSE)

#BetaCarvedilol

data_balanced_both <- ovun.sample( BetaCarvedilol ~ ., data = train.df , method = "both", p=0.5,  N=627, seed = 1)$data
table(data_balanced_both$BetaCarvedilol)
write.csv(data_balanced_both, file = "C:\\Users\\97252\\Desktop\\Balanced_Carvedilol.csv", row.names = FALSE)
