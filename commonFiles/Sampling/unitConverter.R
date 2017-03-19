#Script to change from ton/yr----> kg/s 

#Author: Juan Gabriel Garcia
#Date: July 29 2016
#email: jggarcia@sfu.ca

#Modifications:



unitConverter=function(q){
	#q is the number to change from ton/yr into kg/s

	return(q/(3.6*24*365))
}
