###########################################

#File Name : testAccuracy.R

#Date : 31-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: lun 31 jul 2017 21:12:13 PDT

#Purpose:Script to test the interpolation accuracy 
#for the GP creator

#Modifications:

###########################################
source('gpMatrixCreator.R');source('gpMatrixPredict.R')

M=gpMatrixCreator()
Xtest=t(c(0.1,0.001,-1))

A=gpMatrixPredict(M,Xtest)

q0=c(0,0,1,0)

print(A%*%q0)
