#function that creates the GP model as a KM object


#Author:Juan Gabriel Garcia
#Date: July 22 2016
#email: jggarcia@sfu.ca

#Modifications:
	#March 2 2017: Remove the argument Data and add up the argument sour and sensor


library(DiceKriging)
Data=read.csv('../../Source1/inputOutputTableSource1.csv') #This is the file where all the info about the parameter is
Data=Data[,-1]


kmObjectCreator=function(kernel){
	#Sensor is an integer that gives the sensor of interest
	#sour is an integer telling the source number
	#kernel contains the kernel that you want to use to do the GP fitting
	#print(head(Data))
	#pause	
	design.train=data.frame(gamma=Data[,2],z0=Data[,3],zi=Data[,4],L=Data[,5],zcut=Data[,6])
	deposition=Data[,7] #This should be the deposition column in data
	mod=km(design=design.train,response=deposition,covtype=kernel,nugget=1e-4,nugget.estim=T)
	return(mod)
}
