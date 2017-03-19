#Script that creates the csv with the sensitivity data

#Author:Juan Gabriel Garcia
#Date: 22 July 2016
#email:jggarcia@sfu.ca

#Modifications:




source('sensitivitySource.R')

kernels=c('gauss','exp','matern5_2','matern3_2','powexp')
d=5


info=sensitivitySource(kernels,d)

write.csv(info,'sensitivyParametersInfo.csv')


