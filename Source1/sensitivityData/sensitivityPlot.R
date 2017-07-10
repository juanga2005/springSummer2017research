###########################################

#File Name : sensitivityPlot.R

#Date : 06-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: jue 06 jul 2017 11:41:20 PDT

#Purpose: Create the plots from the sensitivity analysis

#Modifications:

###########################################

library(ggplot2)
#datos=read.csv('../../Source2/sensitivityData/sensitivityDataSource2.csv');datos=datos[,-1]
datos=read.csv('../../commonFiles/sensitivityAnalysis/sesitivity_data.csv');datos=datos[,-1]
datos=datos[,c(1,2,3,5,7,9,11)]
#g=ggplot(datos,aes(
jpeg('../../../../Tesis/FigChap4/sensitivityPlot.jpg')
par(mfrow=c(3,3))
for(j in 1:9){
	s=subset(datos,Sensor==j,)
	s=s[,3:7]
	tit=paste("Dustfall Jar ",j)
	boxplot(s,col=2:6,las=2,main=tit)
	abline(h=0,lwd=2,lty=2)
}
mtext("Sensitivity Analysis for the Dustfall Jars",side=3,line=-1.4,outer=T)
dev.off()
