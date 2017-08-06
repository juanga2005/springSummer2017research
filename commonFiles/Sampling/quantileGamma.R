#Script to calculate the quantiles of gamma assuming beta*(alpha-1)=q0



quantileGamma=function(quantile,q0,n){
	#quantile is the quantile of interest
	#q0 is where the mode of the gamma function is located
	#n is how many times the value q0 contains the info we need

	#initial guest
	
	alpha0=20
	alpha1=1.001
	diff=abs(qgamma(quantile,alpha0,(alpha0-1)/q0)-n*q0)
	
	#Parameters for the algorithm
	tol=1e-15
	max_iter=10000
	n_iter=1

	while(diff>=tol & max_iter>n_iter){
		
		c=(alpha0+alpha1)/2
		p1=(qgamma(quantile,alpha0,(alpha0-1)/q0)-n*q0)*
			(qgamma(quantile,c,(c-1)/q0)-n*q0)
		
		
		 #p2=(qgamma(quantile,alpha1,scale=q0/(alpha1-1))-n*q0)*
			#(qgamma(quantile,c,(c-1)/q0)-n*q0)

		if(p1<0){	
			alpha1=c
		}
		else{
			alpha0=c
			
		}					

		diff=abs(qgamma(quantile,c,(c-1)/q0)-n*q0)
		n_iter=n_iter+1
	}
	return(c)
}
