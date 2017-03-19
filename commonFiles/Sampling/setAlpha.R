#Script to set alpha

source('unitConverter.R')
source('quantileGamma.R')
setAlpha=function(quantile,n){
	

	q0=c(unitConverter(35),unitConverter(80),unitConverter(5),unitConverter(5))
	
	alpha=numeric(4)
	
	for(k in 1:4){
		alpha[k]=quantileGamma(quantile,q0[k],n)
	}
	return(alpha)
}
