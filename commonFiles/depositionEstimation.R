#Function that extract the coordinates in the .t00* files

#Author:Juan Gabriel Garcia
#Date:July 21 2016
#Modifications:
	#March 2 2017: 1. Change the name to depositionEstimation
	#2. Added the dir variable to look for the directory where the computer experiments are
	#3. Added the sor argument to give flexibility on what source to do the analysis

	#March 3 2017: 1. Adding the condition label to choose between s and t so to choose the
	#128 data point or the 64 data point

depositionEstimation=function(Data,n,nx,ny,dir,sor,label){
	#Data is a data frame with the coordinates where to look at the deposition
	#n is the number of different experiments that were performed
	#nx,ny are the number of grid points
	#dir is the string with the location of the folder computerExperiments
	#sor is the source number where to estimate the deposition
	#label is a char variable that could take the values s or t

	#the output is a data frame with the despotion according to the order in jar_coordinates()
	joker=''
	type='1'
	if (label=='t'){
		sor=''
		joker='.'
		type='2'
	}
	num_coord=dim(Data)[1]
	deposition=data.frame()
	print('Locating the sources in the grid matrix')
	for(i in 1:num_coord){
		xcoord=Data[i,1];ycoord=Data[i,2]
	
		for(j in 1:n){
			if(j<10){
				a=read.table(paste(dir,'ComputerExperiments/f.d000',type,joker,label,sor,'00',j,sep=''))
				b=matrix(a$V1,nrow=ny,ncol=nx,byrow=T)
			}
			if(j<100 & j>=10){
				a=read.table(paste(dir,'ComputerExperiments/f.d000',type,joker,label,sor,'0',j,sep=''))
				b=matrix(a$V1,nrow=ny,ncol=nx,byrow=T)
			}
			if(j>=100){
				a=read.table(paste(dir,'ComputerExperiments/f.d000',type,joker,label,sor,j,sep=''))
				b=matrix(a$V1,nrow=ny,ncol=nx,byrow=T)
			}
			deposition[j,i]=b[xcoord,ycoord]
		}
	}
	names(deposition)=c('pos1','pos2','pos3','pos4','pos5','pos6','pos7','pos8','pos9')
	return(deposition)
}


			

			
			

	
