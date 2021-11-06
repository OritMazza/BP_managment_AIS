
###########################################Preprocess##########################################
#Treating NULLs
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


###Normalize the data
d <- new.cohort.df
( nidx <- grep(paste(c("numeric","integer"), collapse="|"), lapply(d, class)) )
norm <- function(x) { (x - min(x)) / (max(x) - min(x)) } 
d[,nidx] <- apply(d[,nidx], MARGIN=2, FUN=norm )
str(d)
new.cohort.df<-d

#Interactions between var
options(max.print = 10000)        # Change global options to print all interactions
regInt <- glm(PredictFinal ~ .^2, 
              data = train.df, 
              family = "binomial")
summary(regInt)

#STEPWISE REGRESSION == Feature selection stage
reg <- glm(PredictFinal ~ ., 
           data = train.df, 
           family = "binomial")

reg.step<-step(reg)

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

### split the data
set.seed(111)
train.index <- sample(1:dim(new.cohort.df)[1], dim(new.cohort.df)[1]*0.6)  
train.df <- new.cohort.df[train.index, ]
valid.df <- new.cohort.df[-train.index, ]

########################################Mechine Learning Models############################################
#########10 fold cross validation
control <- trainControl(method="repeatedcv", number=10, repeats=3, search="random")

#########Classification tree
library(party)
model <- train(PredictFinal~., data=train.df, method="ctree", preProcess="scale",metric = ifelse(is.factor(train.df$PredictFinal), "Accuracy", "RMSE"), trControl=control)
print(model)
plot(model)
pred<-predict(model,newdata=valid.df)
confusionMatrix((pred),valid.df$PredictFinal,positive='1', mode = "prec_recall")

#Plot one tree
tr<-ctree(PredictFinal~., data=train.df)
#Print the model results
tr
pred<-predict(tr,newdata=valid.df)
confusionMatrix((pred),valid.df$PredictFinal,positive='1', mode = "prec_recall")

plot(tr)

library(AUC)
r <- roc(pred, as.factor(valid.df$PredictFinal))
auc(r)
plot(r)

#########Random forest
model <- train(PredictFinal~., data=train.df, method="rf", metric = ifelse(is.factor(train.df$PredictFinal), "Accuracy", "RMSE"), trControl=control)
pred<-predict(model,newdata=valid.df)
confusionMatrix((pred),valid.df$PredictFinal,positive='1', mode = "prec_recall")

library(randomForest)
rfRec=randomForest(PredictFinal ~ . , data = new.cohort.df , subset = train.index)
rfRec
pred<-predict(rfRec,new.cohort.df[-train.index,])
confusionMatrix(pred,valid.df$PredictFinal,positive='1', mode = "prec_recall")

#Plot importance
library(dplyr)
library(ggplot2)
library(RColorBrewer)
set.seed(66)

# Importance by Mean Decrease in Gini Index
# Arrange according to descending order
var_importance <- data_frame(variable=setdiff(colnames(train.df), "PredictFinal"),
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

#########Logistic regression
reg <- glm(PredictFinal ~ ., 
           data = train.df, 
           family = "binomial")
summary(reg)
pred <- predict(reg, valid.df, type = "response")
confusionMatrix(pred,valid.df$PredictFinal,positive='1', mode = "prec_recall")

##########Neural network
set.seed(1)
library(nnet)
nn<- nnet(PredictFinal ~ ., 
          data = train.df, size = 5, 
          decay = 0.01, maxit = 1000)
pred <- predict(nn, valid.df)
confusionMatrix(pred,valid.df$PredictFinal,positive='1', mode = "prec_recall")

