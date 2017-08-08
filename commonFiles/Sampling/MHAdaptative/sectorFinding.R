###########################################

#File Name : sectorFinding.R

#Date : 07-08-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: lun 07 ago 2017 02:53:35 PDT

#Purpose:Script to locate the sector where a point landed

#Modifications:

###########################################


sectorFinding=function(XtestUnit,QtestUnit){
	#numbers sectors from left to right bottom to top
	point=c(XtestUnit,QtestUnit)
		n=sum(point<0.5)
		if(n==7){
			return(0)
		}
		else{
			return(1)
		}
}

	
