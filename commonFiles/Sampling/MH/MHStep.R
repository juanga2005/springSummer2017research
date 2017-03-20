#Script to perform one step of the MH algorithm


library('MASS') #To produce multivariate normal distributions
#Author: Juan Garcia
#email: jggarcia@sfu.ca
#date: March 9 2017
#setwd('../../GP')
#source('gpCreator.R')
#source('gpPredict.R')
#source('gpColCreator.R')
#source('gpColPredict.R')
#source('gpMatrixCreator.R')
#source('gpMatrixPredict.R')
#setwd('../Sampling')
#source('logGamma.R')
#source('loglike.R')
#setwd('./MH')
MHStep=function(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,stepSize){
	#M is a list with 4x9(i.e. transposed) km elements
	#Xtest is the point where to test in parameter space
	#Qtest is the point in the source space where to test
	#m are the zinc measurements
	#sigma is the variance of the noise
	#alphaQtest are the values for alpha for the gammas in Qtest
	#Beta are the values for the gammas in Qtest
	#joker is an auxiliary variable to decide if we accepted or rejected the step
	#logProbOld is the old value of the probability is the old value prior the step

	if(joker==0){
		logprobx=logProbOld
	}
	#Creating the value of the pdf at the point x 
	else{
		temp1=loglike(M,t(Xtest),Qtest,m,sigma);	
		temp2=0
		temp3=0
		for(j in 1:2){
			temp2=temp2+logGamma(Xtest[j],1,1e-4)
		}
		temp2=temp2+logGamma(-Xtest[3],1,1e-4)
		for(k in 1:4){
			temp3=temp3+logGamma(Qtest[j],alphaQtest[j],betaQtest[j])
		}
		logprobx=temp1+temp2+temp3
	}

	#Moving into the unit square
	#XQunit=pushForward(Xtest,Qtest)

	#Proposing a step

	#newXtest=XQunit[1:3]+rnorm(3,0,0.025) #Step in the parameter space
	#newQtest=XQunit[4:7]+rnorm(4,0,0.00112391) #Step in the sources space
	
	tuning=2
	#newXtest=Xtest+c(runif(1,-tuning*0.2*stepSize,tuning*0.2*stepSize),runif(1,-tuning*stepSize,tuning*stepSize),runif(1,-tuning*125*stepSize,tuning*125*stepSize))
	#newQtest=Qtest+c(runif(1,-0.03329528*stepSize,0.03329528*stepSize),runif(1,-0.0761035*stepSize,0.0761035*stepSize),runif(2,-0.004756469*stepSize,0.004756469*stepSize))


	
	newQtest=Qtest+mvrnorm(1,mu=rep(0,4),Sigma=stepSize[4:7,4:7])
	u1=runif(1,-stepSize[1,1],stepSize[1,1])
	u2=runif(1,-stepSize[2,2],stepSize[2,2])
	u3=runif(1,-stepSize[3,3],stepSize[3,3])


	newXtest=Xtest+c(u1,u2,u3)
	#param=c(Xtest,Qtest)
	#newParam=param+mvrnorm(1,mu=rep(0,7),Sigma=stepSize)
	#newXtest=newParam[1:3]
	#newQtest=newParam[4:7]
	
#	newXtest=Xtest+c(rnorm(1,0,0.2*stepSize),rnorm(1,0,1*stepSize),rnorm(1,0,100*stepSize))
#	newQtest=Qtest+c(rnorm(1,0,0.003329528*stepSize),rnorm(1,0,0.00761035*stepSize),rnorm(2,0,0.0004756469*stepSize))
	#Going back
	#XQunzip=pullBack(newXtest,newQtest)
	#newXtest=XQunzip[1:3]
	#newQtest=XQunzip[4:7]



	######Trying using a gamma distribution to sample
	#signo=sample(c(-1,1),7,replace=T,prob=c(0.5,0.5))
	#newXtest=Xtest+c(signo[1]*rgamma(1,1,scale=1e4),signo[2]*rgamma(1,1,scale=1e4),signo[3]*rgamma(1,1,scale=1e4))*stepSize
	#newQtest=numeric(4)
	#for (j in 1:4){
	#	auxiliar=signo[j+3]*rgamma(1,alphaQtest[j],scale=betaQtest[j])		
	#	newQtest[j]=Qtest[j]+auxiliar*stepSize
	#}

	#Checking that we landed in the support of the prior
	cond1=newXtest[1]<0 || newXtest[2]<0 || newXtest[3]>0;
	cond2=newXtest[1]>0.6 || newXtest[2]>3 ||newXtest[3]<(-600);
	cond3=sum(newQtest<0)>0
	if (cond1 || cond2 || cond3){ #This means I landed outside the support
		logproby=-Inf
	}
	else{
		
		temp1=loglike(M,t(newXtest),newQtest,m,sigma);	
		temp2=0
		temp3=0
		for(j in 1:2){
			temp2=temp2+logGamma(newXtest[j],1,1e-4)
		}
		temp2=temp2+logGamma(-newXtest[3],1,1e-4)
		for(k in 1:4){
			temp3=temp3+logGamma(newQtest[j],alphaQtest[j],betaQtest[j])
		}
		logproby=temp1+temp2+temp3
	}
	#Evaluating the probability of transition
	if(logprobx<=-1e200){
		transprob=1
	}
	else{
		aux=logproby-logprobx
		aux2=exp(aux)
		#print('The transition is')
		#print(aux2)
		transprob=min(1,aux2)
	}

	#Deciding the transition
	u=runif(1,0,1)
	if(u<transprob){
		Xtest=newXtest
		Qtest=newQtest
	}
	else{
		joker=0
	}
	return(c(Xtest,Qtest,joker,logprobx))	
			
}
				
	
