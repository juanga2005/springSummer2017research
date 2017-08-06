###########################################

#File Name : plottingIntegrand.R

#Date : 24-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: lun 24 jul 2017 20:33:17 PDT

#Purpose:Script to plot the integral 

#Modifications:

###########################################

source('functionClass.R')
source('MCintegrate.R')
source('../setAlpha.R')
source('../unitConverter.R')
q=seq(0,0.01,length=40);
q0=c(unitConverter(35),unitConverter(80),unitConverter(5),unitConverter(5))
alpha=setAlpha(0.99,3);beta=(alpha-1)/q0
f=numeric(length(q))
l=2.1e-7
np=50
Xtest=cbind(runif(np,0,0.6),runif(np,0,3),runif(np,-600,0))
qtest=cbind(rgamma(np,alpha[1],beta[1]),rgamma(np,alpha[2],beta[2]),
rgamma(np,alpha[3],beta[3]),rgamma(np,alpha[4],beta[4]))

ind=1
for(j in 1:length(q)){
	aq=Aq(Xtest,qtest,q[j],ind)
	f[j]=MCintegrate(aq,l,ind,1)	
	print(j)
}




