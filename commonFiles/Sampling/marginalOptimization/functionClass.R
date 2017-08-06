###########################################

#File Name : functionClass.R

#Date : 22-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: jue 27 jul 2017 13:52:39 PDT

#Purpose:

#Modifications:

###########################################

source('../setAlpha.R')
source('../unitConverter.R')
source('../zinc.R')
library(DiceKriging)
files=list.files(path='../../GP',pattern='*.R',full.names=T)
files=files[-7]
sapply(files,source,.GlobalEnv)
#M=gpMatrixCreator()
A=function(Xtest){
	#Xtest is the input (gamma,z0,L) or an matrix nx3 with n inputs
	#A is the emulator \widehat{A}
	Xtest=as.matrix(Xtest)
	n=dim(Xtest)[1]
	aux=array(NA,c(9,4,n))
	for(j in 1:n){
		aux[,,j]=(gpMatrixPredict(M,t(Xtest[j,])))
	}
	return(aux)
}


Aq=function(Xtest,qtest,q,ind){
	#Xtest is an nx3 matrix
	#qtest is the test values for the 3 remaining q
	#q is the value to be held fix
	#ind is the value to held fix as q_{ind}
	#Aq is the matrix vector product A*q
	a=A(Xtest)
	if(ind!=0){
		aux=1:4;aux=aux[-ind]
		q=rep(q,dim(qtest)[1])
		qtest[,ind]=q
	}
	temp=sapply(1:dim(a)[3],function(i) a[,,i]%*%qtest[i,])
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
	
ex=function(aq,l,ind,type){
	#type could be 1 or 2 depending on the function to return
	#ind is the index of the q_{ind} we are calculating the gradient to
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
		aux2=sapply(1:dim(aq[[2]])[3],function(i)((aq[[1]]-m)[,i]%*%t(t(aq[[2]][,ind,i]))))
		return(aux2*exp(aux))
	}
	if(type==3){
		aux3=Norm(aq[[1]]-m)^2
		return(aux3*exp(aux))
	}
}

