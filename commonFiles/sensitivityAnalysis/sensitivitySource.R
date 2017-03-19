#script that does the sensitivity analysis for all of the 9 jars

#Author: Juan Gabriel Garcia
#Date: July 22 2016
#email:jggarcia@sfu.ca

#Modifications:
	#March 2 2017: 



source('sobolGpCreator.R')


sensitivitySource=function(kernels,d){
	#kernels is a string vector with the names
	#of the kernels to be evaluated
	#sour is the source number to do the sensitivity
	#d is the dimensionality of the space


	
	n=length(kernels);s=1
	sobols=data.frame()
	for(i in 1:9){
		print(paste("I'm in source",i,"Calculating the Sobol Indices"))
		for(j in 1:n){
			mod=kmObjectCreator(kernels[j]) 
			res=sobolGpCreator(mod,d)
			sobols[s,1]=i
			sobols[s,2]=kernels[j];
			sobols[s,3]=res$S$mean[1] #---->sensitivity for gamma
			sobols[s,4]=res$S$mean[2] #---->sensitivity for z0
			sobols[s,5]=res$S$mean[3] #---->sensitivity for zi
			sobols[s,6]=res$S$mean[4] #---->sensitivity for L
			sobols[s,7]=res$S$mean[5] #---->sensitivity for zcut
			s=s+1

		}
	}
	names(sobols)=c('sensor','kernel','gamma','z0','zi','L','zcut')
	return(sobols)
}
			
	
