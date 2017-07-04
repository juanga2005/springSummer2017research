###########################################

#File Name : paramTest.R

#Date : 03-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mar 04 jul 2017 13:51:51 PDT

#Purpose:

#Modifications:

###########################################

library(DiceKriging)

Xtrain=seq(0,1,length=10)
Xtrain2=c(0,0.3,0.6,0.7,0.75,0.2,0.28,0.88,0.05,1)
ytrain=sin(2*pi*Xtrain);
Xtest=0.25

#model=km(design=data.frame(x=Xtrain),response=data.frame(y=ytrain),covtype="gauss",nugget.estim=T)
#
#p=predict(model,newdata=data.frame(x=Xtest),type='UK')
#
#print(p$mean)


#2d Example
n=64
Xtrain=matrix(runif(3*n),ncol=3)
ytrain=sin(2*pi*(Xtrain[,1]+Xtrain[,2]+Xtrain[,3]))

model=km(design=data.frame(x1=Xtrain[,1],x2=Xtrain[,2],x3=Xtrain[,3]),response=data.frame(y=ytrain),covtype="gauss",nugget.estim=T)
e=Sys.time()
p=predict(model,newdata=data.frame(x1=0.33,x2=0.33,x3=0.34),type='UK')
f=Sys.time()
print(p$mean)
print(f-e)
