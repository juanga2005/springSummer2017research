#Function whose output is the coordinates of the jars

#Author: Juan Gabriel Garcia
#Date: July 21 2016
#email: jggarcia@sfu.ca

#Modifications:
	#March 3 2017: Moved the folder 




jarCoordinates=function(){
	#Returns a data frame with the x and y 
	#coordinates in its columns

	x=c(816.0,860.2,843.2,527.0,544.0,442.0,214.2,0,34.0)
	y=c(0,44.2,225.0,146.2,367.20,758.2,1071.0,907.8,601.8)
	coord=data.frame(xcoord=x,ycoord=y)
	
	return(coord)
}

