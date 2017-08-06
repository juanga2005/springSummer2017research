###########################################

#File Name : test.R

#Date : 22-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mar 25 jul 2017 14:35:32 PDT

#Purpose:

#Modifications:

###########################################

source('functionClass.R')
source('../zinc.R')
source('../setAlpha.R')
source('../unitConverter.R')
source('MCintegrate.R')
source('qGradient.R')
points=100
Q=c(unitConverter(35),unitConverter(80),unitConverter(5),unitConverter(5))
me=zinc()
alpha=setAlpha(0.99,3)
beta=(alpha-1)/Q
l=1.66e-6
a=runif(points)
b=runif(points)
c=runif(points)
Xtest=cbind(a,b,c)
q1=rgamma(points,alpha[1],beta[1])
q2=rgamma(points,alpha[2],beta[2])
q3=rgamma(points,alpha[3],beta[3])
q4=rgamma(points,alpha[4],beta[4])

qtest=cbind(q1,q2,q3,q4)
aq=Aq(Xtest,qtest,unitConverter(35),1)
print(norm(aq[[1]][,1]))
print(aq[[1]][,1]%*%me)
#exponential=ex(aq,l,1,1)
#exponential2=ex(aq,l,1,2)
#int1=MCintegrate(aq,l,1,2);int2=MCintegrate(aq,l,1,1)
#print(int1/int2)
#aa=log(int1);bb=log(int2)
#inter=aa-bb
#print(inter)
#print(exp(inter))
#print(exponential)
#print(exponential2)
#print(qGradient(unitConverter(35),aq,l,1))
