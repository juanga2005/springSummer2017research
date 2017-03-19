#Script that contains the experimental zinc measurements

#Author:Juan Gabriel Garcia
#Date: July 25 2016
#email: jggarcia@sfu.ca

#Modifications:


zinc=function(){
	a=read.table('~/Documents/SFU_files/Research/summer2016research/Algorithms/Compilation/zinc.txt')
	return(as.numeric(a[6,1:9]))
}
