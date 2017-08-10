###########################################

#File Name : MHPlots.R

#Date : 14-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mar 08 ago 2017 19:23:19 PDT

#Purpose: Plotting the results from the MH

#Modifications:

###########################################

source('../unitConverter.R')
source('../kg2Ton.R')
source('../setAlpha.R')
#datos=read.csv('oneMillionSamplesnr10.csv');datos=datos[,-1]
#datos=read.csv('sigmaTestcsv');datos=datos[,-1]
#datos=read.csv('sigma1.137968e-05.csv');datos=datos[,-1]
datos=read.csv('sigma5.68984e-06.csv');datos=datos[,-1]
#datos=read.csv('oneMillionSamples2.csv');datos=datos[,-1]
names(datos)=c('gamma','z0','L','q1','q2','q3','q4')
n=dim(datos)[1]
#afterB=datos[(n/2):n,]#After burn data
#afterB=datos[(n/2):n,]#After burn data
thin=seq(1,n,by=20)
afterB=datos[thin,]
#afterB=datos
#plotting the trace plots

l=1.5
m=1.5
jpeg('../../../../../Tesis/FigChap4/traces.jpg')#,width=1600,height=1200)
par(mfrow=c(3,3))
nn=c("p",expression(z[0]),"L",expression(q[1]),expression(q[2]),expression(q[3]),expression(q[4]))
#
#
for(j in 1:7){
	plot(afterB[,j],type='l',xlab="Sample",ylab="",main=paste("Trace plot for ",nn[j]),cex.lab=l,cex.main=m)
	title(ylab=nn[j],line=1.6,cex.lab=l)
}
dev.off()
jpeg('../../../../../Tesis/FigChap4/histogramsI.jpg')#width=1600,height=1200)
#X11()
par(mfrow=c(2,2))
for(j in 1:4){
	if(j!=4){
		d=density(afterB[,j])
		hist(afterB[,j],xlab=nn[j],main=paste("Histogram for ",nn[j]),cex.lab=1.5,cex.main=1.5,prob=T,ylim=c(0,max(d$y)))
		lines(d,col='blue',lwd=2)
		#if(j==1){
			ind=which(d$y==max(d$y))
			xx=d$x[ind]
			abline(v=xx,col='red',lwd=2,lty=2)
			print(xx)	
		#}
		#else{
	#		xx=summary(afterB[,j])[3]
	#		abline(v=xx,col='red',lwd=2,lty=2)
	#		print(xx)
		#}
	}
	else{
		plot(0,0,col='white',xaxt='n',yaxt='n',ylab='',xlab='',frame.plot=F)
		legend('topright',c('Density Fit','Point Estimate'),lty=c(1,2),col=c('blue','red'),cex=1.5)
	}
	

}
dev.off()
jpeg('../../../../../Tesis/FigChap4/histogramsII.jpg')#width=1600,height=1200)
#X11()
lista=c(35,80,5,5)
par(mfrow=c(2,2))
for(j in 4:7){
	mu=mean(afterB[,j]);v=var(afterB[,j])
	alpha=mu^2/v;beta=mu/v
	alpha2=setAlpha(0.99,3);beta2=(alpha2-1)/sapply(lista,unitConverter)
	x=seq(0,0.04,length=1000);yy=dgamma(x,alpha,beta);z=dgamma(x,alpha2[j-3],beta2[j-3]);zz=max(z)
	aux=(alpha-1)/beta
	hist(afterB[,j],main=paste("Histogram for Source",j-3),cex.lab=l,cex.main=m,prob=T,ylim=c(0,max(yy,zz)),
	xlab='Source Strength (Kg/s)')
	lines(x,yy,col='blue',lwd=2)
	lines(x,dgamma(x,alpha2[j-3],beta2[j-3]),col='blue',lty=2,lwd=2)
	abline(v=aux,lwd=2,lty=2)
	abline(v=unitConverter(lista[j-3]),col='red',lwd=2,lty=4)
	print(kg2Ton(aux))
	if(j==7){
		legend('topright',c('Gamma Fit','Prior','Point Estimate','Engineer Estimate'),lty=c(1,2,2,4),col=c('blue','blue','black','red'),cex=1.1)
	}
}
dev.off()

