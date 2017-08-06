###########################################

#File Name : MC.R

#Date : 19-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: sáb 22 jul 2017 17:48:15 PDT

#Purpose:Script with the MonteCarlo class

#Modifications:

###########################################
source('functionClass.R')
if(getwd()!='/home/juanpc/Documents/SFU_files/Research/springSummer2017research/commonFiles/Sampling/marginalOptimization'){
	setwd('../Sampling/marginalOptimization/')
}
MC=function(integrand,aq,type){
	#integrand is the integrand
	#nsamples is the number of samples to take
	#forP=runif(nsamples,0,0.6)
	#forZ=runif(nsamples,0,3)
	#forL=runif(nsamples,-600,0)
	#Xtest=cbind(forP,forZ,forL)
	l=2e-1;
	nsamples=dim(aq[[1]])[2]
	temp=integrand(aq,l,type)
	aux=0.6*3*600
	if (type==1){
		return(1/(aux*nsamples)*sum(temp))
	}
	if(type==2){
		return(1/(aux*nsamples)*rowSums(temp))
	}

}

