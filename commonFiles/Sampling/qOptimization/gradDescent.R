###########################################

#File Name : gradDescent.R

#Date : 22-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: lun 24 jul 2017 01:42:32 PDT

#Purpose: Script that implements the gradient descent routine

#Modifications:

###########################################

source('gradClass.R')
source('../unitConverter.R')
source('../setAlpha.R')
source('MC.R')
#starting point
q0=c(unitConverter(35),unitConverter(80),unitConverter(5),unitConverter(5));l=5.68e-6
alpha=setAlpha(0.99,3)
beta=(alpha-1)/q0
#points to samples
npoints=10
forP=runif(npoints,0,0.6)
forZ0=runif(npoints,0.3)
forL=runif(npoints,-600,0)

Xtest=cbind(forP,forZ0,forL)

#q0=c(1e-3,1e-3,1e-3,1e-3)
nsteps=0
maxSteps=1000
tol=1e-3
stepSize=1e-8
while(1){
	aq=Aq(Xtest,q0)
	aux=logGradF(aq,l,beta,q0)	
	qnew=q0+stepSize*aux
	q0=qnew
	nsteps=nsteps+1
	print(norm(aux))
	if(nsteps==maxSteps || norm(aux)<tol){
			break
	}
}


#The maximum is around qj=0.45 for all j
