/**
header that contains the function class

Author: Juan Garcia
Date: 29 May 2017
email: jggarcia@sfu.ca

**/

#ifndef FUNCTION_H_
#define	FUNCTION_H_

\class Functor;

class function{
	public:	
	//current function
	double fun0(double x){
		return -x*(1.-x);
	}
	double fun1(double x){
		return -1.+2.*x;
	}
	double fun2(double x){
		return 2.;
	}
};

#endif
