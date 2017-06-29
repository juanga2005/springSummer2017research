/**
Header for the optim class. It contains all the
optimization methods we want to use

Author: Juan Gabriel Garcia
Date: May 29 2017
email: jggarcia@sfu.ca

**/

#ifndef OPTIM_H_
#define OPTIM_H_
#include<cmath>
#include<limits>
#include<stdexcept>

using std::cout;using std::endl;
//Global variables
const double rup=(-1.+sqrt(5.))/2;
const double rlow=1-rup;


template<class T>
class Functor;	//Forward declaration


template<class T>
class optim{
	/**
	intialization:
	 *) itMax is the maximum number of iterations for the optimization routine
	 *) tol is the tolerance criterion to stop the iterative scheme used
	**/	
	private:
		int itMax;
		double tol;
	public:
		
		//initializer
		optim(int itmax=40,double t=1e-6):itMax(itmax),tol(t){};

		//methods
		double golden(const Functor<T>& f,double low,double up)const;
		double newton(const Functor<T>& f,double a,double b,double start)const;
		double steepestDescent(const Functor<T>& f,vector<double> start)const;
};




//the golden rule method
template<class T> 
double optim<T>::golden(const functor1<T>& f,double low,double up)const{
	int niter=0;
	double minTempLast=low,minTemp=up;
	double flow=f(low+rlow*(up-low));
	double fup=f(low+rup*(up-low));
	double change=std::numeric_limits<double>::infinity();

	//body of the code
	while (change>tol*fabs(minTempLast) && niter<itMax){
		minTempLast=minTemp;
		minTemp=(low+up)/2.;
		if(flow<fup){
			up=low+rup*(up-low);fup=flow;
			flow=f(low+rlow*(up-low));
		}
		else{
			low=low+rlow*(up-low);flow=fup;
			fup=f(low+rup*(up-low));
		}
		change = fabs(minTemp-minTempLast);
		niter++;
	}
	return minTemp;
}

//Newton's method
template<class T>
double optim<T>::newton(const functor1<T>& f,double a,double b,double start)const{
	int niter=0;	
	double minTemp=start,minTempLast=b;

	while(fabs(minTemp-minTempLast)>tol*fabs(minTempLast) && niter<itMax){
		minTempLast=minTemp;
		try{
			if(f(minTempLast,2)==0){
				throw std::overflow_error("Division by zero: ");
			}
			minTemp=minTempLast-f(minTempLast,1)/f(minTempLast,2);
		}
		catch(std::overflow_error e){
			cout<<e.what()<<endl;
			cout<<"Enter another starting value (q to quit)"<<endl;	 
			std::cin>>minTemp;
			minTempLast=b;
			continue;
		}

		try{
			if(minTemp>b ||minTemp<a){
				throw std::out_of_range("Value outside [a,b]");
			}

		}
		catch(std::out_of_range e){
			cout<<e.what()<<endl;
			cout<<"Enter another starting value (q to quit)"<<endl;
			std::cin>>minTemp;
			minTempLast=b;
			continue;
		}
		niter++;
	}
	return minTemp;
}


















#endif
