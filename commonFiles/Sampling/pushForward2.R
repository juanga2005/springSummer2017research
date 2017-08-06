#Script to change the coordinates from the real parameter space into the unit square 

#Author: Juan Gabriel Garcia
#Date: August 4 2016
#email: jggarcia@sfu.ca
path='~/Documents/SFU_files/Research/springSummer2017research/commonFiles/Sampling/'
source(paste(path,'rangeDetector.R',sep=''))
pushForward2=function(Point){
	#x is this vector (gamma,z0,L,q1,q2,q3,q4)
	#Point is c(Xtest,Qtest)
	y=numeric(7);
	r=rangeDetector()
	
	y=Point/(r[,2]-r[,1])-r[,1]/(r[,2]-r[,1])
	return(y)
}
