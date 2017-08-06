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

#sigma=5.68e-6
sigma=5.68984e-6
#sigma=2.1e-7
alphaQtest=setAlpha(0.99,3)
betaQtest=(alphaQtest-1)/Qtest
joker=1
logProbOld=0

lAux=sapply(c(35,80,5,5),unitConverter);ppp=0.004
#stepSize=diag(c(0.11,0.1,150,1e-5,1e-5,1e-5,1e-5),7); #The covariance matrix to choose the step size
#stepSize=diag(c(0.06,0.03,6,1e-5,1e-5,1e-6,1e-6),7); #The covariance matrix to choose the step size
#stepSize=diag(c(0.2,0.8,150,4e-7,4e-7,4e-8,4e-8),7); #The covariance matrix to choose the step size
#stepSize=diag(c(0.11,0.8,150,8e-7,1e-6,1e-7,1e-7),7); #The covariance matrix to choose the step size
#stepSize=diag(c(0.15,0.8,150,lAux[1]*ppp,lAux[2]*ppp,lAux[3]*ppp,lAux[4]*ppp),7); #The covariance matrix to choose the step size
setwd('./MHScaled')
source('MHStep.R')
source('adaptativeStepSize.R')
source('lengthFinder.R')
jump=0.125
#jump=0.125 #This works with the snr 1:10
stepSize=diag(rep(jump,7),7)

sigmas=c(0.1*sigma,0.5*sigma,2*sigma,10*sigma)


for(sigma in sigmas){

	#source('./MHStep.R')
	##Main loop
	nSamples=150000
	samples=matrix(0,nrow=nSamples,ncol=7) #Samples for each variable are going to be store in each column
	nn=0
	#Initializing the step size
	#for (j in 1:7){
		#stepSize[j,j]=lengthFinder(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,j,stepSize,200)
	#}
	#print(stepSize)

	print('Starting the process at ');inicio=Sys.time()
	print(inicio);print(paste('for the value of sigma =',sigma))
	for(k in 1:nSamples){
		aux=MHStep(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,stepSize)
		#updating
		Xtest=aux[1:3]
		Qtest=aux[4:7]
		logProbOld=aux[9]
		joker=aux[8]
		samples[k,1:3]=Xtest
		samples[k,4:7]=Qtest
		#Check\ing if necessary to change the step size
		donde=5000
		if(k%%donde==0){	
			
			print(k)
			acc=length(unique(samples[(k-(donde-1)):k,1]))/donde
			print(acc)
			Sys.sleep(.1)
			if(acc<0.15 || acc>0.35){
				stepSize=adaptativeStepSize(M,Xtest,Qtest,m,sigma,alphaQtest,betaQtest,joker,logProbOld,stepSize,500)
			}
		}
		
		
	}	
	write.csv(samples,paste('sigma',sigma,'.csv',sep=''))	
	print("Ending the process at ")
	print(Sys.time());final=Sys.time()
	print("The time taken to complete the simulation was ")
	print(final-inicio)
}
