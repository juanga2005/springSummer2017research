###########################################

#File Name : statsPlots.R

#Date : 08-08-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mar 08 ago 2017 17:09:39 PDT

#Purpose:Script to plot the statistics from
#the different results

#Modifications:

###########################################


info=read.csv('parStatistics.csv');info=info[,-1]

##Plotting the results for the sources

est=info[4:7,1]
estatus=c(est[1],35,est[2],80,est[3],5,est[4],5)
group=c(1,1,2,2,3,3,4,4)
x=c('q1','q2','q3','q4')
Tab=t(cbind(group,estatus))

barplot(Tab,beside=T)#,names.arg=x)
