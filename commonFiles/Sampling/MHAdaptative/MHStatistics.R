###########################################

#File Name : MHStatistics.R

#Date : 27-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mar 08 ago 2017 20:42:35 PDT

#Purpose:Script to obtain the statistics 
#from the samples

#Modifications:

###########################################
source('../rangeDetector.R')
source('../kg2Ton.R')
datos=read.csv('sigma5.68984e-06.csv')
datos=datos[,-1];names(datos)=c('p','z0','L','q1','q2','q3','q4')
datos[,3]=-datos[,3]
n=dim(datos)[1]
ind=seq(1,n,by=20)
datos=datos[ind,]
stats=numeric(7)

for(j in 1:3){
	d=density(datos[,j])
	ind=which(d$y==max(d$y))

	stats[j]=d$x[ind]
	print(stats[j])
}

#stats[2]=summary(datos[,2])[3]
#stats[3]=summary(datos[,3])[3]

for(j in 4:7){
	mu=mean(datos[,j]);v=var(datos[,j])
	alpha=mu^2/v;beta=mu/v
	stats[j]=(alpha-1)/beta
}

validity=rangeDetector()
validity[3,2]=-validity[3,1]
validity[3,1]=0

integrator=function(pointSample,r,ind){
	#integrates around point sample in a ball of radius r
	#if(ind==3){	
	#	aux=-datos[,ind]
	#	pointSample=-pointSample
	#}
	#else{	
		aux=datos[,ind]
	#}
	#Calculating the constant of normalization
	left=(pointSample-r)
	right=(pointSample+r)
	if(left<=0){
		left=0
	}
	if(right>validity[ind,2]){
		right=validity[ind,2]
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
	
	#if(j==3){
	#	stats[j]=-stats[j]
	#}	
	r=findr(stats[j],j)
	interval[[j]]=c((stats[j]-r)*((stats[j]-r)>0),min((stats[j]+r),validity[j,2]),r)
}


###Writing the data####
dat=data.frame()
for(j in 1:7){
	if(j<=3){
		dat[j,1]=stats[j]
		dat[j,2]=interval[[j]][1]
		dat[j,3]=interval[[j]][2]
	}
	else{
		
		dat[j,1]=kg2Ton(stats[j])
		dat[j,2]=kg2Ton(interval[[j]][1])
		dat[j,3]=kg2Ton(interval[[j]][2])
	}
}
names(dat)=c('Estimate','leftInt','rightInt')	
write.csv(dat,'parStatistics.csv')
