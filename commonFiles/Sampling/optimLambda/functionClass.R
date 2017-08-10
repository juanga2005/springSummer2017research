###########################################

#File Name : functionClass.R

#Date : 19-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mié 09 ago 2017 17:21:54 PDT

#Purpose: Script that contains all the functions of interst

#Modifications:

###########################################
source('../setAlpha.R')
source('../unitConverter.R')
source('../zinc.R')
library(DiceKriging)
files=list.files(path='../../GP',pattern='*.R',full.names=T)
files=files[-(7:8)]
sapply(files,source,.GlobalEnv)
#M=gpMatrixCreator()
A=function(Xtest){
	#Xtest is the input (gamma,z0,L) or an matrix nx3 with n inputs
	#A is the emulator \widehat{A}
	Xtest=as.matrix(Xtest)
	n=dim(Xtest)[1]
	aux=array(0,c(9,4,n))
	for(j in 1:n){
		aux[,,j]=(gpMatrixPredict(M,t(Xtest[j,])))
	}
	return(aux)
}

Aq=function(lambda,thin){
	#lambda is the value of lambda we are taking the samples from
	#thin is the thinin value for the samples
	datos=read.csv(paste('./samples/sigma',lambda,'.csv',sep=''));datos=datos[,-1]
	n=dim(datos)[1]
	ind=seq(1,n,by=thin)
	datos=datos[ind,]
	Xtest=datos[,1:3]
	Qtest=datos[,4:7]
	a=A(Xtest)
	Qtest=as.matrix(Qtest)
	temp=sapply(1:dim(a)[3],function(i) a[,,i]%*%(Qtest[i,]))
	l=list(temp,a)
	return(l)#returns a matrix whose column is the multiplication with each matrix
}

norm=function(x){
	return(sqrt(sum(x^2)))
}
Norm=function(X){
	#x is a matrix
	return(sapply(1:dim(X)[2],function(i) norm(X[,i])))
}
	
ex=function(aq,l,type){
	#type could be 1 or 2 depending on the function to return
	m=zinc()
	n=dim(aq[[1]])[2]
	m=rep(m,n)
	m=matrix(m,ncol=n)
	#l is the lambda factor
	#m is the vector of measurements
	aux=-0.5/l^2*(Norm(0.0206*aq[[1]]-m))^2
	if(type==1){
		return(exp(aux))
	}
	if(type==2){
		aux2=sapply(1:dim(aq[[2]])[3],function(i) t(aq[[2]][,,i])%*%(aq[[1]][,i]-m[,1])/l^2)
		return(aux2*exp(aux))
	}
}

lninnerex=function(beta,q){
	#beta is the vector with the beta values for each
	#gamma distribution in q

	return(-(beta*q))
}


	
		

#setwd('../Sampling/marginalOptimization/')
