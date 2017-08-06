###########################################

#File Name : parameterEstimationResults.R

#Date : 18-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mar 18 jul 2017 20:34:07 PDT

#Purpose: Create the values for the estimates
#of each of the variables of interest

#Modifications:

###########################################


#datos=read.csv('onemillionSamples.csv');datos=datos[,-1];n=dim(datos)[1]
#names(datos)=c('gamma','z0','L','q1','q2','q3','q4')
#afterB=datos[(n/2):n,]

source('kg2Ton.R')
estimates=data.frame()

for(j in 1:7){
	for(k in 1:3){
		mSamples=afterB[,j]
		media=mean(mSamples)
		v=var(mSamples)
		cv=abs(media)/sqrt(v)
		estimates[j,1]=media
		estimates[j,2]=sqrt(v)
		estimates[j,3]=1/cv
	}
}	
names(estimates)=c("Mean","Sd","CV")
write.csv(estimates,'parameterEstimates.csv')
