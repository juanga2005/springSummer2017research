###########################################

#File Name : MHStatistics.R

#Date : 27-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: vie 28 jul 2017 00:34:37 PDT

#Purpose:Script to obtain the statistics 
#from the samples

#Modifications:

###########################################

#datos=read.csv('oneMillionSamplesnr10.csv')
#datos=datos[,-1];names(datos)=c('p','z0','L','q1','q2','q3','q4')
n=dim(datos)[1]
#datos=datos[(n/2):n,]
stats=numeric(7)

d=density(datos$p)
ind=which(d$y==max(d$y))

stats[1]=d$x[ind]
stats[2]=summary(datos[,2])[3]
stats[3]=summary(datos[,3])[3]

for(j in 4:7){
	mu=mean(datos[,j]);v=var(datos[,j])
	alpha=mu^2/v;beta=mu/v
	stats[j]=(alpha-1)/beta
}


integrator=function(pointSample,r,ind){
	#integrates around point sample in a ball of radius r
	if(ind==3){	
		aux=-datos[,ind]
		pointSample=-pointSample
	}
	else{	
		aux=datos[,ind]
	}
	#Calculating the constant of normalization
	left=(pointSample-r)
	right=(pointSample+r)
	if(left<=0){
		left=0
	}
	indF=((left<aux)&(aux<right))
	return(1/(length(aux))*sum(indF))
}


findr=function(pointSample,ind){
	#Finds the value of r that gives the 68% conf interval
	ran=range(datos[,ind])
	r=0
	tol=1e-2
	niter=0
	maxiter=500
	pr=0
	while((niter<maxiter)&(abs(pr-0.68)>tol)){
		pr=integrator(pointSample,r,ind)
		niter=niter+1
		if(abs(pr-0.68)<tol || niter==maxiter){
			return(r)
		}
		r=r+(ran[2]-ran[1])*0.001
	}
}

interval=list()
for(j in 1:7){
	
	if(j==3){
		stats[j]=-stats[j]
	}	
	r=findr(stats[j],j)
	interval[[j]]=c((stats[j]-r)*((stats[j]-r)>0),stats[j]+r,r)
}	
