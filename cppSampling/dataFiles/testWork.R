###########################################

#File Name : testWork.R

#Date : 10-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: lun 10 jul 2017 19:15:05 PDT

#Purpose: Script to test C++ outputs

#Modifications:

###########################################


Xtrain=read.table('./S1/XS1L1.csv',sep=",")
ytrain=read.table('./S1/yS1L1.csv',sep=",")
Xtrain=as.matrix(Xtrain)
Xtest=matrix(c(0.25,0.2,-145),ncol=3)


dist=function(Xtrain,Xtest){
	n=dim(Xtrain)[1]
	d=dim(Xtrain)[2]
	t=dim(Xtest)[1]
	onesdt=matrix(rep(1,d*t),nrow=d);onesnd=matrix(rep(1,n*d),nrow=n)
	Dist=Xtrain^2%*%onesdt+onesnd%*%t(Xtest)^2-2*Xtrain%*%t(Xtest)
	return(Dist)
}
gauss=function(Dist,l,nugget){
	aux=Dist*Dist
	return(exp(-aux/(2*l^2)))
}
Dist=dist(Xtrain,Xtrain)
cov=gauss(Dist,0.25,0)
print(cov)

f=function(xmin,xmax,x){
	return(x/(xmax-xmin)-xmin/(xmax-xmin))
}
