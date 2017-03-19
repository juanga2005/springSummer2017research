#Script to change the coordinates from the real parameter space into the unit square 

#Author: Juan Gabriel Garcia
#Date: August 4 2016
#email: jggarcia@sfu.ca

source('rangeDetector.R')
pushForward=function(Xtest,Qtest){
	#x is this vector (gamma,z0,L,q1,q2,q3,q4)
	y=numeric(7);
	r=rangeDetector()
	
	y=c(Xtest,Qtest)/(r[,2]-r[,1])-r[,1]/(r[,2]-r[,1])
	return(y)
}
