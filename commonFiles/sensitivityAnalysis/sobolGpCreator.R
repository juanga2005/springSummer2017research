#Script to do the sensitivity analysis using the Sobol indices

#Author:Juan Gabriel Garcia
#Date: July 22 2016
#email:jggarcia@sfu.ca

#Modifications:
	#March 2 2017: changed the name of the file


library(sensitivity)
source('kmObjectCreator.R')


sobolGpCreator=function(KM,d){
	#KM is an object of the family km
	#d is the dimensionality of the space
	n=100;
	X1=data.frame(matrix(runif(d*n),nrow=n));
	X2=data.frame(matrix(runif(d*n),nrow=n));
	candidate=data.frame(matrix(runif(d*n),nrow=n))
	res=sobolGP(model=KM,type='UK',MCmethod='sobol',X1,X2,nsim=100,conf=0.9,nboot=100,sequential=T,
        candidate,sequential.tot=F,max_iter=1000)
	return(res)
}
