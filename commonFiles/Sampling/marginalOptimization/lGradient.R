###########################################

#File Name : lGradient.R

#Date : 27-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: jue 27 jul 2017 13:55:08 PDT

#Purpose: Script for the lambda gradient

#Modifications:

###########################################
source('functionClass.R')

lGradient=function(lambda,aq){
	aux1=log(MCintegrate(aq,lambda,0,1)) #denominator
	aux2=log(MCintegrate(aq,lambda,0,3)) #numerator
	print(aux1);print(aux2)
	aa=aux2-aux1;aux=exp(aa)

	return(aa/lambda^3-9/lambda)
}


