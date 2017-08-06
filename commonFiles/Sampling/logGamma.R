#Script to calculate the logarithm of the gamma distribution


#Author: Juan Garcia	
#Date: March 9 2017
#email: jggarcia@sfu.ca


logGamma=function(x,alpha,beta){
	aux1=alpha*log(beta)
	aux2=(alpha-1)*log(x)
	#aux2=0
	aux3=beta*x
	aux4=log(gamma(alpha))

	return(aux1+aux2-aux3-aux4)

}
