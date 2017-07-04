/** ---------------------------------------

*File Name : kernel.h

*Date : 28-06-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: mar 04 jul 2017 13:21:33 PDT

*Purpose: Creates the of kernels for the Gaussian Process

*Modifications:

----------------------------------------**/


#ifndef KERNEL_H_
#define KERNEL_H_

#include<Eigen/Dense>
#include<string>
#include "Functor.h"
#include "kernelFunction.h"

using Eigen::MatrixXd;using std::string;





class kernel{

	private:

	public:
		
		//initializer
		kernel(){};
		//Destructor
		//~kernel();
		//methods
		Functor<kernelFunction> type(const string kertype);
};


#endif
