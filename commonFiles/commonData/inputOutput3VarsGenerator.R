#Script that creates the input output table for the three variables case

source('../depositionEstimation.R')
source('../jarCoordinates.R')
source('../locateJars.R')
inputOutput3VarsGenerator=function(S){
	#S is the source number


	#Parameters
	xmin=ymin=-200;xmax=ymax=1200 #Range in the grid
	nx=ny=30 #Number of grid points in x an y
	parameters=read.table('design64ThreeVar.txt')

	translation=-ymin

	n=dim(parameters)[1]
	fullTable=matrix(0,nrow=n*9,ncol=5) #Colums: source, parameters,deposition
	jar.coordinates=jarCoordinates()
	jar.location=locateJars(jar.coordinates,xmin,xmax,ymin,ymax,nx,ny,translation)

	dir=paste('../../Source',S,'/',sep="")

	sourceDeposition=depositionEstimation(jar.location,n,nx,ny,dir,S,'s')
	#print(paste('Creating the file with parameters and deposition for the Source',S))
	
	aux=matrix(rep(1:9,n),nrow=n,byrow=T)
	aux=as.vector(aux)
	
	fullTable[,1]=as.matrix(aux)
	fullTable[,2]=parameters[,1]
	fullTable[,3]=parameters[,2]
	fullTable[,4]=parameters[,3]	
	fullTable[,5]=as.vector(as.matrix(sourceDeposition))
	fullTable=as.data.frame(fullTable)
	names(fullTable)=c('location','gamma','z0','L','deposition')
	
	#Saving the table
	
	fol=paste('../../Source',S,'/inputOutputTableSource',S,'.csv',sep="")
	write.csv(fullTable,fol)

}
