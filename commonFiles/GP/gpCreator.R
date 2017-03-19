#Functions that creates an object of the class km


#Author:Juan Gabriel Garcia
#Date: July 23 of 2016
#email:jggarcia@sfu.ca

#Modifications:




library(DiceKriging)

gpCreator=function(Xtrain,param,kernel){
	#Xtrain contains the .csv file with the parameters and deposition
	#param is a vector that contains the location of the relevant paramters
	#labels 1=gamma;2=z0;3=L;4=zi;5=zcut
	#kernel is the kind of kernel to be used
	param=sort(param)
	fin=dim(Xtrain)[2]
	if(length(param)==1){
		design.train=data.frame(x1=Xtrain[,param[1]])
	}
	if(length(param)==2){
		design.train=data.frame(x1=Xtrain[,param[1]],x2=Xtrain[,param[2]])
	}
	if(length(param)==3){
		design.train=data.frame(x1=Xtrain[,param[1]],x2=Xtrain[,param[2]],x3=Xtrain[,param[3]])
	}
	if(length(param)==4){
		design.train=data.frame(x1=Xtrain[,param[1]],x2=Xtrain[,param[2]],x3=Xtrain[,param[3]],
					x4=Xtrain[,param[4]])
	}
	if(length(param)==5){	
		design.train=data.frame(x1=Xtrain[,param[1]],x2=Xtrain[,param[2]],x3=Xtrain[,param[3]],
					x4=Xtrain[,param[4]],x5=Xtrain[,param[5]])
	}

	output=Xtrain[,fin]
	mod=km(design=design.train,response=output,covtype=kernel,nugget=1e-4,nugget.estim=T)
	
	return(mod)
}
