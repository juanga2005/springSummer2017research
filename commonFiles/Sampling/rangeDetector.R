#Script that finds the range of the parameters

#Author: Juan Gabriel Garcia
#Date: July 25 2016
#email:jggarcia@sfu.ca

#Modifications:

path='~/Documents/SFU_files/Research/springSummer2017research/commonFiles/commonData/design64ThreeVar.txt'
path2='~/Documents/SFU_files/Research/springSummer2017research/commonFiles/Sampling/unitConverter.R'
datos=read.table(path)
source(path2)
rangeDetector=function(){

	#param are the parameters whose range is going to be measured
	

	p=as.matrix(datos)
		
	rango=c(0,0)
	qmin=c(0,0,0,0)
	qmax=c(unitConverter(140),unitConverter(320),unitConverter(80),unitConverter(80))#Choosing the range in q
	pmax=c(0.6,3)	
	for(k in 1:7){
		if(k<=3){
			
			if(k==3){
				rango=rbind(rango,c(-600,0))
			}
			else{
				
				rango=rbind(rango,c(0,pmax[k]))
			}
		}
		else{
			rango=rbind(rango,c(qmin[k-3],qmax[k-3]))
		}

	}
	rango=rango[-1,]
	return(rango)
}
		
