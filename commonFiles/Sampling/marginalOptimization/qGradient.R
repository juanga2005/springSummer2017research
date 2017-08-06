###########################################

#File Name : qGradient.R

#Date : 24-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mié 26 jul 2017 06:12:49 PDT

#Purpose:Script with the gradient of the j-th source

#Modifications:

###########################################
source('functionClass.R')
source('MCintegrate.R')
eps=.Machine$double.xmin
alpha=setAlpha(0.99,3)
qtemp=c(unitConverter(35),unitConverter(80),unitConverter(5),unitConverter(5))
beta=(alpha-1)/qtemp
qGradient=function(q,aq,l,ind){
	f1=-beta[ind]+(alpha[ind]-1)/q
	f2=MCintegrate(aq,l,ind,1);f3=MCintegrate(aq,l,ind,2)*l^2
	f4=-f2/(f3)
	#ff=log(f3)-log(f2)
	#print(paste('this is f3',f3))
	#f4=-exp(ff)/l^2
	return(f1+f4)
}

	
