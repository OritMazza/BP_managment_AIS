#This code generated the Time-Wigthed-Avarage of the systolic blood pressure and diastolic blood pressure
#for each patient in the dataset. 

#For MIMIC
cohort.df<-read.csv("MIMICBPWigthedAVG.csv", stringsAsFactors=FALSE)
#For eICU
cohort.df<-read.csv("eICUBP.csv", stringsAsFactors=FALSE)

#For MIMIC
summary(cohort.df)
sum(is.na(cohort.df$charttime))#0

cohort.df$icustay_id<-as.factor(as.character(cohort.df$icustay_id))
table(cohort.df$icustay_id)
length(unique(cohort.df$icustay_id))

library(lubridate)
class(cohort.df$charttime)
cohort.df$charttime <- as.character(cohort.df$charttime)
                                
 library(anytime)
cohort.df$charttime<-anytime(cohort.df$charttime)#Good but several null

cohort.df$charttime <- as.POSIXct(cohort.df$charttime, format="%d/%m/%Y %H:%M")#Good
                        #    format="%Y-%m-%dT%H:%M" #format time "%Y/%m/%d %H:%M"
                          
#Create dataFrame with Icustays and Weighted SysBP
New.df<-as.data.frame(unique(cohort.df$icustay_id)) 
class(New.df)
New.df$Icusyay<-0
New.df$SysBPW<-0
New.df$DiasBPW<-0
New.df$MeansBPW<-0

New.df[1,2]

time<-as.numeric(difftime(cohort.df[13647,6], cohort.df[13637,6], units = "hours"))
time

#Cala SysBPW
X<-0
Y<-0
i<-1
j<-1
k<-0

#number of icustays = 1043
while (i <= length(unique(cohort.df$icustay_id)))
  { 
#Just the values of each patient  
   while(j<=table(cohort.df$icustay_id)[i])
     
   {
#If SysBP is not null     
  if(is.na(cohort.df[j+k,8])==FALSE & is.na(cohort.df[j+k,6])==FALSE)
     {        
    if(X==0)
    {   
     X<-cohort.df[j+k,8]#SysBP
     t<-cohort.df[j+k,6]
     
     #Remember the 1st time wimdow
     t1<-cohort.df[j+k,6]
     #print the unique icustay
      print(cohort.df[j+k,3])
     New.df[i,2]<-cohort.df[j+k,3]
       #  Y <-(cohort.df[j,8] - X)/
       print(X)
       j<-j+1
    }    
   else
   {
     #Remember the last time window
     tf<-cohort.df[j+k,6]
     #Calac the time difference between now and previous
     time<-as.numeric(difftime(cohort.df[j+k,6], t, units = "hours"))
     t<-cohort.df[j+k,6]
       Y <-Y+ (time*((cohort.df[j+k,8] + X)/2))
       X<-cohort.df[j+k,8]
          j<-j+1
   }
  }
     else
     {
       j<-j+1
     }
   } 
  TimeTotal<-as.numeric(difftime(tf, t1, units = "hours"))
  
  New.df[i,3]<-Y/TimeTotal
  
  print(Y/TimeTotal)
  i<-i+1
  X<-0
  Y<-0
  t<-0
  j<-1
  k<-k+as.numeric(table(cohort.df$icustay_id)[i-1])  
}

#Cala DiasBPW
X<-0
Y<-0
i<-1
j<-1
k<-0

#number of icustays = 1043
while (i <= length(unique(cohort.df$icustay_id)))
{ 
  #Just the values of each patient  
  while(j<=table(cohort.df$icustay_id)[i])
    
  {
    #If DiasBP is not null     
    if(is.na(cohort.df[j+k,9])==FALSE & is.na(cohort.df[j+k,6])==FALSE)
    {        
      if(X==0)
      {   
        X<-cohort.df[j+k,9]#DiasBP
        t<-cohort.df[j+k,6]
        
        #Remember the 1st time wimdow
        t1<-cohort.df[j+k,6]
        #print the unique icustay
        print(cohort.df[j+k,3])
        New.df[i,2]<-cohort.df[j+k,3]
        #  Y <-(cohort.df[j,8] - X)/
        print(X)
        j<-j+1
      }    
      else
      {
        #Remember the last time window
        tf<-cohort.df[j+k,6]
        #Calac the time difference between now and previous
        time<-as.numeric(difftime(cohort.df[j+k,6], t, units = "hours"))
        t<-cohort.df[j+k,6]
        Y <-Y+ (time*((cohort.df[j+k,9] + X)/2))
        X<-cohort.df[j+k,9]
        j<-j+1
      }
    }
    else
    {
      j<-j+1
    }
  } 
  TimeTotal<-as.numeric(difftime(tf, t1, units = "hours"))
  
  New.df[i,4]<-Y/TimeTotal
  
  print(Y/TimeTotal)
  i<-i+1
  X<-0
  Y<-0
  t<-0
  j<-1
  k<-k+as.numeric(table(cohort.df$icustay_id)[i-1])  
}

#Cala MeanBPW
X<-0
Y<-0
i<-1
j<-1
k<-0

#number of icustays = 1043
while (i <= length(unique(cohort.df$icustay_id)))
{ 
  #Just the values of each patient  
  while(j<=table(cohort.df$icustay_id)[i])
    
  {
    #If MeanBP is not null     
    if(is.na(cohort.df[j+k,10])==FALSE & is.na(cohort.df[j+k,6])==FALSE)
    {        
      if(X==0)
      {   
        X<-cohort.df[j+k,10]#MeansBP
        t<-cohort.df[j+k,6]
        
        #Remember the 1st time wimdow
        t1<-cohort.df[j+k,6]
        #print the unique icustay
        print(cohort.df[j+k,3])
        New.df[i,2]<-cohort.df[j+k,3]
        #  Y <-(cohort.df[j,8] - X)/
        print(X)
        j<-j+1
      }    
      else
      {
        #Remember the last time window
        tf<-cohort.df[j+k,6]
        #Calac the time difference between now and previous
        time<-as.numeric(difftime(cohort.df[j+k,6], t, units = "hours"))
        t<-cohort.df[j+k,6]
        Y <-Y+ (time*((cohort.df[j+k,10] + X)/2))
        X<-cohort.df[j+k,10]
      
        j<-j+1
      }
    }
    else
    {
      j<-j+1
    }
  } 
  TimeTotal<-as.numeric(difftime(tf, t1, units = "hours"))
  
  New.df[i,5]<-Y/TimeTotal
  
  print(Y/TimeTotal)
  i<-i+1
  X<-0
  Y<-0
  t<-0
  j<-1
  k<-k+as.numeric(table(cohort.df$icustay_id)[i-1])  
}
   
write.csv(New.df, file = "C:\\Users\\97252\\MIMICBPW.csv", row.names = FALSE)
##
#For eICU
summary(cohort.df)
sum(is.na(cohort.df$charttime))#0

cohort.df$patientunitstayid<-as.factor(cohort.df$patientunitstayid)
table(cohort.df$patientunitstayid)
length(unique(cohort.df$patientunitstayid))

#Create dataFrame with Icustays and Time-Weighted-Average BP
New.df<-as.data.frame(unique(cohort.df$patientunitstayid)) 
class(New.df)
New.df$patientunitstayid<-0

New.df$SysBPW<-0
New.df$DiasBPW<-0
New.df$MeanBP<-0

New.df[1,2]
 
time<-(cohort.df[2,2] - cohort.df[1,2])
time
summary(cohort.df)

#Cala SysBPW
X<-0
Y<-0
i<-1
j<-1
k<-0

#number of icustays = 1043
while (i <= length(unique(cohort.df$patientunitstayid)))
{ 
  #Just the values of each patient  
  while(j<=table(cohort.df$patientunitstayid)[i])
    
  {
    #If SysBP is not null     
    if(is.na(cohort.df[j+k,3])==FALSE)
    {        
      if(X==0)
      {   
        X<-cohort.df[j+k,3]#SysBP
        t<-cohort.df[j+k,2]
        #Remember the 1st time wimdow
        t1<-cohort.df[j+k,2]
        #print the unique icustay
        print(cohort.df[j+k,1])
        New.df[i,2]<- cohort.df[j+k,1]
        #  Y <-(cohort.df[j,8] - X)/
        #   print(Y)
        j<-j+1
      }    
      else
      {
        #Remember the last time window
        tf<-cohort.df[j+k,2]
        #Calac the time difference between now and previous
        time<-cohort.df[j+k,2] - t
        t<-cohort.df[j+k,2]
        Y <-Y+ ((time/60)*((cohort.df[j+k,3] + X)/2))
        X<-cohort.df[j+k,3]
        j<-j+1
      }
    }
    else
    {
      j<-j+1
    }
  } 
  TimeTotal<-(tf - t1)/60
  
  New.df[i,3]<-Y/TimeTotal
  
  print(Y/TimeTotal)
  i<-i+1
  X<-0
  Y<-0
  t<-0
  j<-1
  k<-k+as.numeric(table(cohort.df$patientunitstayid)[i-1])  
}

#For DiasBP
X<-0
Y<-0
i<-1
j<-1
k<-0
#number of icustays 
while (i <= length(unique(cohort.df$patientunitstayid)))
{ 
  #Just the values of each patient  
  while(j<=table(cohort.df$patientunitstayid)[i])
    
  {
    #If DiasBP is not null     
    if(is.na(cohort.df[j+k,4])==FALSE)
    {        
      if(X==0)
      {   
        X<-cohort.df[j+k,4]#DiasBP
        t<-cohort.df[j+k,2]
        #Remember the 1st time wimdow
        t1<-cohort.df[j+k,2]
        #print the unique icustay
        print(cohort.df[j+k,1])
        New.df[i,2]<- cohort.df[j+k,1]
        #  Y <-(cohort.df[j,8] - X)/
        #   print(Y)
        j<-j+1
      }    
      else
      {
        #Remember the last time window
        tf<-cohort.df[j+k,2]
        #Calac the time difference between now and previous
        time<-cohort.df[j+k,2] - t
        t<-cohort.df[j+k,2]
        Y <-Y+ ((time/60)*((cohort.df[j+k,4] + X)/2))
        X<-cohort.df[j+k,4]
        j<-j+1
      }
    }
    else
    {
      j<-j+1
    }
  } 
  TimeTotal<-(tf - t1)/60
  
  New.df[i,4]<-Y/TimeTotal
  
  print(Y/TimeTotal)
  i<-i+1
  X<-0
  Y<-0
  t<-0
  j<-1
  k<-k+as.numeric(table(cohort.df$patientunitstayid)[i-1])  
}
 
#For MeanBP

X<-0
Y<-0
i<-1
j<-1
k<-0

#number of icustays 
while (i <= length(unique(cohort.df$patientunitstayid)))
{ 
  #Just the values of each patient  
  while(j<=table(cohort.df$patientunitstayid)[i])
    
  {
    #If DiasBP is not null     
    if(is.na(cohort.df[j+k,5])==FALSE)
    {        
      if(X==0)
      {   
        X<-cohort.df[j+k,5]#MeanBP
        t<-cohort.df[j+k,2]
        #Remember the 1st time wimdow
        t1<-cohort.df[j+k,2]
        #print the unique icustay
        print(cohort.df[j+k,1])
        New.df[i,2]<- cohort.df[j+k,1]
        #  Y <-(cohort.df[j,8] - X)/
        #   print(Y)
        j<-j+1
      }    
      else
      {
        #Remember the last time window
        tf<-cohort.df[j+k,2]
        #Calac the time difference between now and previous
        time<-cohort.df[j+k,2] - t
        t<-cohort.df[j+k,2]
        Y <-Y+ ((time/60)*((cohort.df[j+k,5] + X)/2))
        X<-cohort.df[j+k,5]
        j<-j+1
      }
    }
    else
    {
      j<-j+1
    }
  } 
  TimeTotal<-(tf - t1)/60
  
  New.df[i,5]<-Y/TimeTotal
  
  print(Y/TimeTotal)
  i<-i+1
  X<-0
  Y<-0
  t<-0
  j<-1
  k<-k+as.numeric(table(cohort.df$patientunitstayid)[i-1])  
}
 
write.csv(New.df, file = "C:\\Users\\97252\\Desktop\\eICUBPWA.csv", row.names = FALSE)
##