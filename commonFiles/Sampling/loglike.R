#function with output the exponent of the normal distribution

#Author:Juan Gabriel Garcia
#Date: 24 July 2016
#email: jggarcia@sfu.ca

#Modifications:
#Remove the dependence on qstar (July 29 2016) 
#Add the dustfall jar area (August 2 2016)

#Remove all arguments and put M a list that contains 36 km objects
#Xtest is the point where to evaluate the matrix 
#Qtest is the point in the Q space where we evaluate the matrix vector product
#m are the 9 zinc measurements
pp='~/Documents/SFU_files/Research/springSummer2017research/commonFiles/'
files=list.files(path=paste(pp,'GP/',sep=''),pattern='.*R',full.names=T);files=files[-(7:8)]
sapply(files,source,.GlobalEnv)
#source('../GP/gpCreator.R')
#source('../GP/gpPredict.R')
#source('../GP/gpColCreator.R')
#source('gpColPredict.R')
#source('gpMatrixCreator.R')
#source('gpMatrixPredict.R')
loglike=function(M,Xtest,Qtest,m,sigma){
	

	#M a list contaning 36 KM objects
	#Xtest gives the coordinates where to evaluate A
	#Qtest gives the coordinates where to evaluate the sources
	#m are the experimental measures	
	#Output: -\|m-qstar*A(x)q\|^2
	A=gpMatrixPredict(M,Xtest)
	e=m-0.0206*A%*%Qtest
	norma=sum(e^2)
	aux=-9/2*log(2*pi)-9*log(sigma)
	return(-0.5*norma/sigma^2+aux)
}
