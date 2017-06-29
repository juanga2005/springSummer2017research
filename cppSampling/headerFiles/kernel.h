/** ---------------------------------------

*File Name : kernel.h

*Date : 28-06-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: jue 29 jun 2017 00:16:10 PDT

*Purpose: Creates the of kernels for the Gaussian Process

*Modifications:

----------------------------------------**/


#ifndef KERNEL_H_
#define KERNEL_H_

#include<Eigen/Dense>
#include<string>
#include<cmath>

class kernelFunction; //The class of kernel functions

class kernel{

	private:
		string kerType; //The kernel type ("gauss","powExp")

	public:
		
		//initializer
		kernel(char kertype){
		switch(kertype){
			case("gauss"): 
				Functor<kernelFunction> f(
};



class kernelFunction{
	/** 
	Class that contains all the kernel functions
	**/
	
	public:
		double gauss(const MatrixXf& x1,const MatrixXf& x2,double l){
			/**	x1 and x2 are row vectors **/
			if(x1.size()!=x2.size()){
				cout<<"The sizes of the arguments in the kernel has different sizes"<<endl;
				exit(1);
			}
			MatrixXf aux=x1-x2;
			double r=aux.transpose()*aux;
			return exp(r/l^2);
		}
};





#endif
