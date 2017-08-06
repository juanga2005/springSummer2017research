#Script to pick an adaptitive time step for the MH algorithm

#Author:Juan Garcia
#email: jggarcia@sfu.ca
#Date: March 10 2017

adaptativeStepSize=function(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,stepSize,nSamples){
	#nSamples to choose the number of samples to average
	print('Recalculating the step size')
	counter=0
	while(T){
		temp=rep(0,nSamples)
		for(l in 1:nSamples){
			aux=MHStep(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,stepSize)
			temp[l]=aux[1]	
		}
		acc=length(unique(temp))/nSamples
		if((acc<0.35) & (acc>0.15)){
			print(paste('After',counter,'iterations the new step size is'))
			print(stepSize[1,1])
			return(stepSize)
		}
		else if(acc<=0.15){
			#stepSizeNew=(stepSize-boundaryMin)/2
			#boundaryMax=stepSize
			stepSize=stepSize/1.1
			counter=counter+1
		}
		else if (acc>=0.35){
				stepSize=stepSize*1.1
				counter=counter+1
		}
		if(counter%%10==0){
			print(paste("I've been trying to recalculate the step size",counter,"times"))
			print(paste('With step size of',stepSize[1,1],'the acceptance is',acc))
		}
		
	}
}
		
				
