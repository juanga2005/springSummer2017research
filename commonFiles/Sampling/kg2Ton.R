###########################################

#File Name : kg2Ton.R

#Date : 18-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mar 18 jul 2017 19:26:11 PDT

#Purpose: function that changes a value in kg/sec into ton/year

#Modifications:

###########################################

kg2Ton=function(x){
	return(x*3.6*24*365)
}
