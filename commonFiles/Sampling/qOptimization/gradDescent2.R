###########################################

#File Name : gradDescent.R

#Date : 22-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: sáb 22 jul 2017 18:03:35 PDT

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
beta=q0/(alpha-1)
#points to samples
npoints=100
forP=runif(npoints,0,0.6)
forZ0=runif(npoints,0.3)
forL=runif(npoints,-600,0)

Xtest=cbind(forP,forZ0,forL)

q0=c(1,2,3,4)
nsteps=0
maxSteps=1000
tol=1e-3
stepSize=1e-3
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


