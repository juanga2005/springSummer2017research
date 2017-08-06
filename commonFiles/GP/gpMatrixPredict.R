#Script to predict the value of the matrix at (gamma,z0,L)

#Author: Juan Garcia
#email:jggarcia@sfu.ca
#Date: March 9 2017

path='~/Documents/SFU_files/Research/springSummer2017research/commonFiles/GP/'
source(paste(path,'gpPredict.R',sep=''));


gpMatrixPredict=function(M,Xtest){
	#X test is a 3 dimensional vector with the coordinates (gamma,z0,L)
	#M is a 9x4 list with all the km elements from trainig the matrix
	
	A=matrix(0,nrow=9,ncol=4)
	for(i in 1:9){
		for(j in 1:4){
			p=gpPredict(M[[j]][[i]],Xtest)
			A[i,j]=p$mean
		}
	}
	return(A)
}
			
