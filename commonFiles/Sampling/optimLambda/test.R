###########################################

#File Name : test.R

#Date : 09-08-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mié 09 ago 2017 17:38:44 PDT

#Purpose: Test the files in this folder

#Modifications:

###########################################
source('MCintegrate.R')
library('DiceKriging')

lambdas=c(5.68984e-07,2.84492e-06,5.68984e-06,1.137968e-05,5.68984e-05)
thin=10000
#f=numeric(length(lambda))
j=1
#for(lambda in lambdas){
#
#	aq=Aq(lambda,thin)
#	f[j]=MCintegrate(aq)
#	j=j+1
#	print(j)
#}


model=km(design=data.frame(x=lambdas),response=data.frame(y=f),covtype='gauss',nugget.estim=T)
lTest=seq(min(lambdas)*0.99,max(lambdas)*1.01,by=1e-8)
p=predict(model,newdata=data.frame(x=lTest),type='UK')
plot(lambdas,f,ylim=c(min(p$lower95),max(p$upper95)))
lines(lTest,p$mean)
lines(lTest,p$upper95,col='red')
lines(lTest,p$lower95,col='red')
