/** 
header for the class of gradient based methods

Author: Juan Garcia
Date: June 4 2017
email: jggarcia@sfu.ca

**/

#ifndef GBM_H_
#define GBM_H_
#include<iostream>
#include<Eigen/Dense>
#include"Functor.h"
#include<cmath>


using Eigen::MatrixXf;

template<class T>
class Functor;


template<class T>
class GBM{

	private:
		//tolerance for convergence
		double tol;
		//maximum number of iterations
		int maxIter;

	public:
		
		//Initializer
		GBM(double t=1e-6, int maxiter=10):tol(t),maxIter(maxiter){};
		
		//Methods
		MatrixXf steepestD(const Functor<T>& f,const MatrixXf& start)const;

};
	

//Steepest descent	
template<class T>
MatrixXf GBM<T>::steepestD(const Functor<T>& f,const MatrixXf& start)const{
		/**
		f is the function we want to find the minimizer of. 
		start is a vector that sets the starting point
		**/
		int niter=0;
		MatrixXf xold=start; 
		MatrixXf xnew;
		//auxiliary variables for line search
		double beta=0.9,tau=0.5;	
		while(niter<maxIter && f(xold,1).norm()>tol){

			//Armijo-Goldstein line search
			double alpha=0.5;
			//std::cout<<"aux1 is \n"<<aux1<<std::endl;
			//std::cout<<"f(aux1) is \n"<<f(aux1)<<std::endl;
			while(f(xold+alpha*f(xold,1))>f(xold)+alpha*beta*f(xold,1).norm()*f(xold,1).norm()){
				alpha=tau*alpha;
				std::cout<<"Backtracking..."<<alpha<<std::endl;
			}
			xnew=xold-alpha*f(xold,1);
			xold=xnew;
			niter++;
		}

return xnew;
			
}	

#endif



	
