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
using Eigen::MatrixXd;

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
		double (T::*pF)(MatrixXd);
		double (T::*pF0)(double);
		double (T::*pF2)(double,double);
		double (T::*pFk)(MatrixXd,MatrixXd,double);
		MatrixXd (T::*gradpF) (MatrixXd); 
		MatrixXd (T::*HF)(MatrixXd);
	public:
		//Initializers

		//Initializer for functions f:R---->R 
		//Functor(T* pt,double (T::*pf0)(double)):pT(pt),pF0(pf0){}; 
		Functor(T* pt,double (T::*pf2)(double,double)):pT(pt),pF2(pf2){}; 
		//Initializer for gauss kernel 		
		Functor(T* pt,double (T::*pfk)(MatrixXd,MatrixXd,double)):pT(pt),pFk(pfk){};  		
		//Initializer for functions f:R^{m}--->R
		Functor(int m,T* pt,double (T::*pf)(MatrixXd)):n(m),pT(pt),pF(pf){}; 
		Functor(T* pt,double (T::*pf)(MatrixXd*)):pT(pt),pF(pf){}; 
		//Initializer for functions f:R--->R^{m} with its derivative df:R^{m}---->R^{m}
		Functor(int m,T* pt,double (T::*pf)(MatrixXd),MatrixXd (T::*gradpf)(MatrixXd)):n(m),pT(pt),gradpF(gradpf),pF(pf){};
		//Initialization with the Hessian included
		Functor(int m,T* pt,double (T::*pf)(MatrixXd),MatrixXd (T::*gradpf)(MatrixXd),MatrixXd(T::*hf)(MatrixXd)):n(m),pT(pt),gradpF(gradpf),pF(pf),HF(hf){};


		
		
		//Overloading ()
		double operator()(MatrixXd x1,MatrixXd x2,double l)const{
			return (pT->*pFk)(x1,x2,l);
		}	
		//overloading for f:R---->R
		double operator()(double x)const{
			return (pT->*pF0)(x);
		}
		double operator()(double x,double l)const{
			return (pT->*pF2)(x,l);
		}
		//overloading for f:R^{m}---->R
		double operator()(MatrixXd* x)const{
			return (pT->*pF)(*x);
		}
		//overloading for f:R^{m}--->R^{m}
		MatrixXd operator()(MatrixXd x,int der)const{
			//der is the derivative number
			switch(der){
				case 1: return (pT->*gradpF)(x);
				case 2: return (pT->*HF)(x);
			}
		}

			
};

#endif	
