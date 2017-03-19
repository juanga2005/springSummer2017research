#Script to change the coordinates from the unit square into the real parameter space

#Author: Juan Gabriel Garcia
#Date: August 4 2016
#email: jggarcia@sfu.ca

source('rangeDetector.R')
pullBack=function(Xtest,Qtest){
	#x is this vector (gamma,z0,L,q1,q2,q3,q4)
	y=numeric(7);
	r=rangeDetector()
	
	y=(r[,2]-r[,1])*c(Xtest,Qtest)+r[,1]
	
	return(y)
}
