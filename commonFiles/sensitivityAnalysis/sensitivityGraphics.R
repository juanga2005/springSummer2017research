#Script that creates the graphics for the sensitivity analylsis



	
data=read.csv('sensitivityParametersInfo.csv')
data=data[,-1]

#jpeg('../../../../Tesis/FigChap4/sensitivityPlot.jpg',width=1600,height=1200)
par(mfrow=c(3,3))

for(k in 1:9){
	s=subset(data,sensor==k)
	s=s[,3:7]
	boxplot(s)
	abline(h=0,col='blue')
	title(paste('Sensitivity sensor ',k))
}
#dev.off()

