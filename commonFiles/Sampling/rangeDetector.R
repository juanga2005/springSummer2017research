#Script that finds the range of the parameters

#Author: Juan Gabriel Garcia
#Date: July 25 2016
#email:jggarcia@sfu.ca

#Modifications:


datos=read.table('../commonData/design64ThreeVar.txt')
source('unitConverter.R')
rangeDetector=function(){

	#param are the parameters whose range is going to be measured
	

	p=as.matrix(datos)
		
	rango=c(0,0)
	qmin=c(0,0,0,0)
	qmax=c(unitConverter(105),unitConverter(240),unitConverter(15),unitConverter(15))#Choosing the range in q
	pmax=c(10,20)	
	for(k in 1:7){
		if(k<=3){
			
			if(k==3){
				rango=rbind(rango,c(-2000,0))
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
		
