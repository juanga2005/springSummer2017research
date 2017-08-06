###########################################

#File Name : gradDescent.R

#Date : 24-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mié 26 jul 2017 14:26:30 PDT

#Purpose:Script to do the steepest descent

#Modifications:

###########################################

source('qGradient.R')
source('../unitConverter.R')
source('../setAlpha.R')
source('MCintegrate.R')


gradDescent=function(ind){
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
	q1=rgamma(npoints,alpha[1],beta[1])
	q2=rgamma(npoints,alpha[2],beta[2])
	q3=rgamma(npoints,alpha[3],beta[3])
	q4=rgamma(npoints,alpha[4],beta[4])
	q0=q0[ind]+0.00005
	qtest=cbind(q1,q2,q3,q4)
	nsteps=0
	maxSteps=1000
	tol=1e-6
	if(ind==3 || ind==4){
		stepSize=5e-9
	}
	if(ind==2){
		stepSize=5e-7
	}
	if(ind==1){
		stepSize=1e-8
	}
	while(1){
		aq=Aq(Xtest,qtest,q0,ind)
		aux=qGradient(q0,aq,l,ind)
		qnew=q0+stepSize*aux
		q0=qnew
		nsteps=nsteps+1
		print(norm(aux))
		if(norm(aux)<tol){
				return(q0)
				break
		}
		if(nsteps==maxSteps){
			l=list()
			l[[1]]=q0;l[[2]]=norm(q0)
			return(l)
			break
		}
	}
}
