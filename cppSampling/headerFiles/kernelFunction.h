/** ---------------------------------------

*File Name : kernelFunction.h

*Date : 02-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: lun 03 jul 2017 17:51:52 PDT

*Purpose:

*Modifications:

----------------------------------------**/


#ifndef KERNELFUNCTION_H_
#define KERNELFUNCTION_H_

#include<Eigen/Dense>
#include<cmath>
using Eigen::MatrixXd;


class kernelFunction{
	/** 
	Class that contains all the kernel functions
	**/
	
	public:
		double gauss(double r,double l){
			return exp(-r/pow(l,2));
		}
		double test(const MatrixXd* A){
			return 2;
		}
};



#endif
