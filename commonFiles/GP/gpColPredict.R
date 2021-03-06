#Function that creats a 9x1 vector containing the gp processes for the 9 jars

#Author:Juan Gabriel Garcia
#Date: July 24 2016
#email:jggarcia@sfu.ca

#Modifications:
	#Vectorize the shit out of this

path='~/Documents/SFU_files/Research/springSummer2017research/commonFiles/GP/'
source(paste(path,'gpColCreator.R',sep=''))

		


gpColpredict=function(Xtest){
	#Data is the file conatining ALL the info i.e the 9 sources
	#param is the vector containing the info of which parameters are important
	#kernel says what kernel to use to do the analysis
	#x is the vector to which the column vector of GPs is going to be evaluated
	Data=Data[,-1] #Removing the anoying first column named X
	G=numeric(9) #---> Vector that will contain the value of the GP process at x

	for(k in 1:9){
		sens=subset(Data,sensor==k)
		mod=gp_creator(sens,param,kernel)
		output=gp_predict(mod,x)
		G[k]=output$mean
	}
	return(G)
}

