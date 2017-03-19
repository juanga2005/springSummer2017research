#Script to create a table with the five parameters


source('../jarCoordinates.R');source('../locateJars.R');source('../depositionEstimation.R')

tableWithParameters=function(case){

	if(case==1){

		xmin=ymin=-4000;xmax=ymax=4000 #Range of the grid (in meters)
		nx=ny=50; #Number of grid points in x and y
		parameters=read.table('designScaled128.txt')
	}

	if(case==2){

		xmin=ymin=-200;xmax=ymax=1200 #Range of the grid (in meters)
		nx=ny=30; #Number of grid points in x and y
		parameters=read.table('designScaled64.txt')
	}

	translation=-ymin #--> This is for the first set of experiments


	n=dim(parameters)[1]
	full_table=data.frame()

	s=1

	jar.coordinates=jarCoordinates()
	jar.location=locateJars(jar.coordinates,xmin,xmax,ymin,ymax,nx,ny,translation)



	sources=depositionEstimation(jar.location,n,nx,ny,'./',1,'t')
	print('Creating the file with the values of the parameters and deposition')


	for(k in 1:9){
		for(j in 1:n){
			full_table[s,1]=k
			full_table[s,2]=parameters[j,1]
			full_table[s,3]=parameters[j,2]
			full_table[s,4]=parameters[j,3]	
			full_table[s,5]=parameters[j,4]
			full_table[s,6]=parameters[j,5]
			full_table[s,7]=sources[j,k]
			#full_table[s,8]=sources[j,2]
			#full_table[s,9]=sources[j,3]
			#full_table[s,10]=sources[j,4]
			#full_table[s,11]=sources[j,5]
			#full_table[s,12]=sources[j,6]
			#full_table[s,13]=sources[j,7]
			#full_table[s,14]=sources[j,8]
			#full_table[s,15]=sources[j,9]
			s=s+1
		
		}
	}

	#aux=c('depositionSensor1','depositionSensor2','depositionSensor3','depositionSensor4',
	#'depositionSensor5','depositionSensor6','depositionSensor7','depositionSensor8','depositionSensor9')
	
	if(case==1){
		names(full_table)=c('sens','gamma','z0','zi','L','zcut','deposition')
		write.csv(full_table,'./parameterTableScaled.csv')
	}
	if(case==2){	
		names(full_table)=c('sens','gamma','z0','zi','L','zcut','deposition')
		write.csv(full_table,'./parameterTableScaled.csv')
	}
	print('File parameterTableScaled.csv successfully created')
}
