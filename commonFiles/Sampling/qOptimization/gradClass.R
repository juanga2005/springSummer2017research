###########################################

#File Name : gradClass.R

#Date : 22-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: lun 24 jul 2017 01:28:57 PDT

#Purpose:Contains the gradient of relevant functions in 
#the script functionClass.R

#Modifications:

###########################################
source('functionClass.R')
if(getwd()!='/home/juanpc/Documents/SFU_files/Research/springSummer2017research/commonFiles/Sampling/qOptimization'){
	setwd('../Sampling/qOptimization/')
}
source('../unitConverter.R')
source('../setAlpha.R')
gradSumq=function(q){
	alpha=setAlpha(0.99,3)
	
	#Gradient of the productory of sources
	#q is the vector of sources

	f1=(alpha[1]-1)/q[1];
	f2=(alpha[2]-1)/q[2];
	f3=(alpha[3]-1)/q[3];
	f4=(alpha[4]-1)/q[4];
	#f1=(alpha[1]-1)*prod(q)/q[1]
	#f4=(alpha[2]-1)*prod(q)/q[2]
	#f2=(alpha[3]-1)*prod(q)/q[3]
	#f3=(alpha[4]-1)*prod(q)/q[4]
	return(c(f1,f2,f3,f4))
}

gradinnerex=function(beta,q){

	return(-beta*innerex(beta,q))
}



logGradF=function(aq,l,beta,q){
	f1=gradSumq(q)
	f2=-beta
	f3=-MC(ex,aq,2)/MC(ex,aq,1)

	return(f1+f2+f3)
}
