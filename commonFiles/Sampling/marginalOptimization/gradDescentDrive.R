###########################################

#File Name : gradDescentDrive.R

#Date : 25-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mié 26 jul 2017 00:03:12 PDT

#Purpose: Drives for the gradDescent.R

#Modifications:

###########################################


source('gradDescent.R')

opts=numeric(4)
for(j in 4:1){
	opts[j]=gradDescent(j)
}
write.csv(opts,'marginalOptimals.csv')

