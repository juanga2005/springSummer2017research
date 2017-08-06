###########################################

#File Name : empiricalCovCreator.R

#Date : 06-08-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: dom 06 ago 2017 17:27:06 PDT

#Purpose: Script to create the empirical covariance matrix of 
# a set of samples

#Modifications:

###########################################


empiricalCovCreator=function(covOld,meanOld,meanOlder,samples,center){
		#covOld is a previously build cov matrix
		#x is a 7x1 vector with the center of the covMatrix 
		#center is c(Xtest,Qtest)
		n=dim(covOld)[1]
		sd=(2.38)^2/7
		aux=(n-1)/n*covOld+sd/n*(n*t(t(meanOlder))%*%t(meanOlder)-(n+1)*t(t(meanOld))*t(meanOld)+t(t(center))*t(center))
		return(aux)
}
	
