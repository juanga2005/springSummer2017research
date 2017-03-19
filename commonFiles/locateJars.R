#Function that locates matrix coordinates of  the jars on the grid

#Author:Juan Gabriel Garcia
#Date: July 21 2016
#Modifications:
	#March 2 2017: Vectorize the whole thing 

locateJars=function(Data,xmin,xmax,ymin,ymax,nx,ny,translation){
	#Data is a data frame that contains the x-y coordinates of the jars
	#xmin,xmax,ymin,ymax are the values that bound the domain [xmin,xmax]x[ymin,ymax]
	#nx,ny are the number of nodes in x and y respectively
	#The output is a data frame with the x matrix coordinate and the y matrix coordinate

	###Important: The translation parameter depends on how many units to the
	###negative axis do we move ex: in the first run we used a grid of -4000 to 4000
	### so translation=4000
	
	number_coord=dim(Data)[2]
	num_jars=dim(Data)[1]
	coordinates=matrix(0,number_coord,num_jars)
	Data=t(Data)
	
	dx=(xmax-xmin)/nx;dy=(ymax-ymin)/ny #Calculates the coarseness of the grid
	delta=c(dx,dy)
	n=c(nx,ny)
	aux=floor(Data+translation)
	aux2=aux/delta
	offset=(Data+4000)%%delta
	coordinates[offset<=(delta/2)]=floor(aux2[offset<=delta/2])+1
	coordinates[offset>(delta/2)]=floor(aux2[offset>delta/2])+2

	coordinates=as.data.frame(t(coordinates))

	names(coordinates)=c('col','row')
	return(coordinates)
}

		
			
	
	
