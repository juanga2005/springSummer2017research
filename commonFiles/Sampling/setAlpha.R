#Script to set alpha
path='~/Documents/SFU_files/Research/springSummer2017research/commonFiles/Sampling/'
source(paste(path,'unitConverter.R',sep=''))
source(paste(path,'quantileGamma.R',sep=''))
setAlpha=function(quantile,n){
	

	q0=c(unitConverter(35),unitConverter(80),unitConverter(5),unitConverter(5))
	
	alpha=numeric(4)
	
	for(k in 1:4){
		alpha[k]=quantileGamma(quantile,q0[k],n)
	}
	return(alpha)
}
