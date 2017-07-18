###########################################

#File Name : MHPlots.R

#Date : 14-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: vie 14 jul 2017 21:22:14 PDT

#Purpose: Plotting the results from the MH

#Modifications:

###########################################


#datos=read.csv('onemillionSamples.csv');datos=datos[,-1]
names(datos)=c('gamma','z0','L','q1','q2','q3','q4')
n=dim(datos)[1]
#afterB=datos[(n/2):n,]#After burn data

#plotting the trace plots

par(mfrow=c(3,3))
jpeg('../../../../../Tesis/FigChap4/traces.jpg',width=1600,height=1200)
nn=c("p",expression(z[0]),"L",expression(q[1]),expression(q[2]),expression(q[3]),expression(q[4]))


for(j in 1:7){
	plot(afterB[,j],type='l',xlab="Sample",ylab=nn[j],main=paste("Trace plot for ",nn[j]))
}
dev.off()
jpeg('../../../../../Tesis/FigChap4/histograms.jpg',width=1600,height=1200)
par(mfrow=c(3,3))
for(j in 1:7){
	hist(afterB[,j],xlab=nn[j],main=paste("Histogram for ",nn[j]))
}
dev.off()
