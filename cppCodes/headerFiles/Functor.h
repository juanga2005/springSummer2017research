/**
Header for the function class. This object
represents functions f:R^{n}--->R

Author: Juan Garcia
Date: June 4 2017
email: jggarcia@sfu.ca


**/

#ifndef FUNCTOR_H_
#define FUNCTOR_H_

#include<Eigen/Dense>
using Eigen::MatrixXf;

template<class T>
class Functor{

	/**
	The class T makes reference to any object of functions multivalued or univalued
	
	intialization Arguments: 
	n: integer. The number of arguments a function has
	pT: pointer to the class T
	pF: function to be pointet at in class T
	pF0: function of just one argument to be pointet at
	gradpF: gradient function of pF, gradpF:R^{n}---->R^{n}
	**/

	private:
		int n;
		T* pT;
		double (T::*pF)(MatrixXf);
		double (T::*pF0)(double);
		MatrixXf (T::*gradpF) (MatrixXf); 
		MatrixXf (T::*HF)(MatrixXf);
	public:
		
		//Initializers

		//Initializer for functions f:R---->R 
		Functor(T* pt,double (T::*pf0)(double)):pT(pt),pF0(pf0){};  		
		//Initializer for functions f:R^{m}--->R
		Functor(int m,T* pt,double (T::*pf)(MatrixXf)):n(m),pT(pt),pF(pf){}; 
		//Initializer for functions f:R--->R^{m} with its derivative df:R^{m}---->R^{m}
		Functor(int m,T* pt,double (T::*pf)(MatrixXf),MatrixXf (T::*gradpf)(MatrixXf)):n(m),pT(pt),gradpF(gradpf),pF(pf){};
		//Initialization with the Hessian included
		Functor(int m,T* pt,double (T::*pf)(MatrixXf),MatrixXf (T::*gradpf)(MatrixXf),MatrixXf(T::*hf)(MatrixXf)):n(m),pT(pt),gradpF(gradpf),pF(pf),HF(hf){};


		
		
		//Overloading ()
		
		//overloading for f:R---->R
		double operator()(double x)const{
			return (pT->*pF0)(x);
		}
		//overloading for f:R^{m}---->R
		double operator()(MatrixXf x)const{
			return (pT->*pF)(x);
		}
		//overloading for f:R^{m}--->R^{m}
		MatrixXf operator()(MatrixXf x,int der)const{
			//der is the derivative number
			switch(der){
				case 1: return (pT->*gradpF)(x);
				case 2: return (pT->*HF)(x);
			}
		}

			
};

#endif	
