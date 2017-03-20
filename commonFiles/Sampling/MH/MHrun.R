#Script to run the MH algorithm


#Loading the list M
setwd('../../GP')
source('gpCreator.R')
source('gpPredict.R')
source('gpColCreator.R')
source('gpColPredict.R')
source('gpMatrixCreator.R')
source('gpMatrixPredict.R')
M=gpMatrixCreator()
#Initial location


#Setting the measurements and parameters
setwd('../Sampling')
source('logGamma.R')
source('loglike.R')
source('unitConverter.R')
source('setAlpha.R')
source('zinc.R')
source('rangeDetector.R')
source('pushForward.R')
source('pullBack.R')
Xtest=c(0.5,0.1,-250)
Qtest=c(unitConverter(35),unitConverter(80),unitConverter(5),unitConverter(5))
m=zinc()

sigma=5.68e-6
alphaQtest=setAlpha(0.99,3)
betaQtest=Qtest/(alphaQtest-1)

joker=1
logProbOld=0
stepSize=diag(c(0.11,0.1,150,1e-5,1e-5,1e-5,1e-5),7); #The covariance matrix to choose the step size

#source('./MHStep.R')
##Main loop
nSamples=1000000
samples=matrix(0,nrow=nSamples,ncol=7) #Samples for each variable are going to be store in each column
nn=0
setwd('./MH')
source('MHStep.R')
source('lengthFinder.R')
j=1
#Initializing the step size
#for (j in 1:7){
#	stepSize[j,j]=lengthFinder(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,j,stepSize,3000)
#}
#print(stepSize)

for(k in 1:nSamples){
	aux=MHStep(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,stepSize)
	#updating
	Xtest=aux[1:3]
	Qtest=aux[4:7]
	logProbOld=aux[9]
	joker=aux[8]
	samples[k,1:3]=Xtest
	samples[k,4:7]=Qtest
	print(k)
	#Checking if necessary to change the step size
	if(k%%2500==0){	
		
		acc=length(unique(samples[(k-2499):k,1]))/2500
		print(acc)
		Sys.sleep(5)
		if(acc<0.1 || acc>0.6){
			print('entre porque acc<0.2 or acc>0.4')
			#for (j in 1:7){
			#	stepSize[j,j]=lengthFinder(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,j,stepSize,3000)
			#}
			nn=nn+1
		}
	}
	
	
}	
write.csv(samples,'onemillionSamples.csv')	
