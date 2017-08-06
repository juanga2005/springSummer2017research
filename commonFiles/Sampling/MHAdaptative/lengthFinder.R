#Script to find the appropiate length in each direction in every dimension

#Author: Juan Garcia
#Date: March 18 2017
#email: jggarcia@sfu.ca

lengthFinder=function(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,direction,stepSize,nSamples){
	#The arguments have the same meaning as in MHstep but direction
	#direction is in what axis we are going to move, the convention is
	#1=gamma; 2=z0;3=L;4=q1;5=q2;6=q3;7=q4

	nTries=10 #Number of adjustments to the step size
	
	param=c(Xtest,Qtest);
	
	#choosing the non-fixed parameter
	#param=param[-direction]
	
	k=floor(nSamples/nTries) #Number of moves in order to determine the characteristic length
		
	for(j in 1:nTries){
		temp=numeric(k)
		for (l in 1:k){
			aux=MHStep(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,stepSize)
			param[direction]=aux[direction]
			#updating the step
			Xtest=param[1:3]
			Qtest=param[4:7]
			lambda=stepSize[direction,direction]
			temp[l]=aux[direction]
			joker=aux[8]
			logProbOld=aux[9]
		}
		#message('in the aux direction we have ',temp)
		acc=length(unique(temp))/k
		print('the acceptance rate is: ')
		print(acc)
		if(acc<0.4 & acc>0.25){
			lambda=lambda*1.1
		}
		else if (acc<=0.25 & acc>=0.1){
			lambda=lambda/1.1
		}
		else{
			if (acc<0.1){
				lambda=lambda/2
			}
			else{
				lambda=lambda*2
			}
		}
		message('the value of the size in the direction ',direction,' is: ')
		print(lambda)
		stepSize[direction,direction]=lambda
			
	}
	return(lambda)
}
	
		
