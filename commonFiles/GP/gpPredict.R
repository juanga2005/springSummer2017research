#Function that predicts the value of a gp on an specific point

#Author:Juan Gabriel Garcia
#Date: July 24 2016
#email: jggarcia@sfu.ca

#Modifications:


gpPredict=function(KM,Xtest){
	#KM is an object of the family km. 
	#x is the vector containing the point to be predicted
	Xtest=(as.matrix(Xtest))
	n=dim(Xtest)[2]
	if(n==1){
		new.design=data.frame(x1=Xtest[,1])
	}
	if(n==2){
		new.design=data.frame(x1=Xtest[,1],x2=Xtest[,2])
	}
	if(n==3){
		new.design=data.frame(x1=Xtest[,1],x2=Xtest[,2],x3=Xtest[,3])
	}
	if(n==4){	
		new.design=data.frame(x1=Xtest[,1],x2=Xtest[,2],x3=Xtest[,3],x4=Xtest[,4])
	}
	if(n==5){
		new.design=data.frame(x1=Xtest[,1],x2=Xtest[,2],x3=Xtest[,3],x4=Xtest[,4],x5=Xtest[,5])
	}
	p=predict(KM,new.design,type='UK')
	return(p)
}
