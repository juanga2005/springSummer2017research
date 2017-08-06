#Script to train the GP for the whole matrix
path='~/Documents/SFU_files/Research/springSummer2017research/commonFiles/GP/'
source(paste(path,'gpColCreator.R',sep=''))

#Author: Juan Gabriel Garcia
#March 9 2017
#email: jggarcia@sfu.ca

gpMatrixCreator=function(){
	
	#M contians all the 36 km object from the trained GP
	M=list()	
	M1=gpColCreator(1)
	M2=gpColCreator(2)
	M3=gpColCreator(3)
	M4=gpColCreator(4)
	M=list(M1,M2,M3,M4)
	return(M)
}	
