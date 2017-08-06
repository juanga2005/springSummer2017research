###########################################

#File Name : test.R

#Date : 21-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: sáb 22 jul 2017 15:40:15 PDT

#Purpose: Test codes

#Modifications:

###########################################
#source('MC.R')
source('gradClass.R')
source('../unitConverter.R')
source('../setAlpha.R')
npoints=100
a=runif(npoints)
b=runif(npoints)
d=runif(npoints,-600,0)
Xtest=cbind(a,b,d)
l=sqrt(5.68e-6);
aaa=unitConverter(5)
q=c(unitConverter(35),unitConverter(80),aaa,aaa)
alpha=setAlpha(0.99,3)
beta=q/(alpha-1)
print(alpha);print(beta)
print(gradSumq(q))
#print(A(Xtest))
#print(ex(aq,l,2))
inicial=Sys.time()
aq=Aq(Xtest,q)
print(gradF(aq,l,beta,q))
#print(MC(ex,aq,1))
final=Sys.time()
print(final-inicial)
