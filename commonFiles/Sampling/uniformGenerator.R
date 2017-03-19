#Function that generates a random uniform vector with different starting
#point in each of its dimensions

#Author:Juan Gabriel Garcia
#Date: 25 July 2016
#email:jggarcia@sfu.ca

#Modifications:
#July 25 2016: Added the table with unscaled parameters to treat the case of crazy ranges in the parameters

datos=read.table('../../Source1/pre_analysis_files/design_unscaled.txt')


uniformGenerator=function(param,x,q,delta){
	#x is the vector in the space parameter
	#q is the vector in the source parameter (normalized)
	#delta is the step size a number between 0,1 that  represent the precentage of the range of the space
	#param is the number of the parameters relevant 
	p=as.matrix(datos[,param])
	rango=range_detector(param)
	n=length(x)
	u=numeric(4+n)
	k=4+n
	v=c(x,q)
	for(i in 1:k){
		rang=rango[i,2]-rango[i,1]
		u[i]=runif(1,v[i]-rang*delta,v[i]+delta*rang)
	}
	return(u)
}
