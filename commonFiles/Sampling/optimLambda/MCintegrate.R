###########################################

#File Name : MCintegrate.R

#Date : 24-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mié 09 ago 2017 17:25:45 PDT

#Purpose:Monte Carlo integration script

#Modifications:

###########################################
source('functionClass.R')
source('../setAlpha.R')
source('../unitConverter.R')
MCintegrate=function(aq){
	#func is the function to integrate
	nsamples=dim(aq[[2]])[3]
	m=zinc()
	m=matrix(rep(m,nsamples),ncol=nsamples)
    dA=0.0206
	#dA=1
	f=Norm(dA*aq[[1]]-m)
	return(1/nsamples*sum(f))
}	
