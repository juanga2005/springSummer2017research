#Script to pick an adaptitive time step for the MH algorithm

#Author:Juan Garcia
#email: jggarcia@sfu.ca
#Date: March 10 2017


adaptativeStepSize=function(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,stepSize,nSamples){
	#nSamples to choose the number of samples to average
	k=floor(nSamples/20) #Number of points to evaluate
	boundaryMax=1
	boundaryMin=0
	acc=numeric(20)
	for(j in 1:20){
		temp=numeric(k)
		for(l in 1:k){
			aux=MHStep(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,stepSize)
			temp[l]=aux[1]
		}
		acc[j]=length(unique(temp))/k
		print('the acceptance rate is:')
		print(acc[j])
		if(acc[j]<0.4 & acc[j]>0.25){
			#stepSizeNew=(boundaryMax-stepSize)/2
			#boundaryMin=stepSize
			stepSize=stepSize*1.1;
		}
		else if(acc[j]<=0.25 & acc[j]>=0.10){
			#stepSizeNew=(stepSize-boundaryMin)/2
			#boundaryMax=stepSize
			stepSize=stepSize/1.1
		}
		else{
			if (acc[j]<0.10){
				stepSize=stepSize/2
			}
			else{
				stepSize=stepSize*2
			}
		}
		#stepSize=stepSizeNew
		print('The step size is ')
		print(stepSize)
	}
	return(stepSize) #0.416651
}
		
				
