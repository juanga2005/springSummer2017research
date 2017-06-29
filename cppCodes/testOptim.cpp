//Test optim routine

#include<iostream>
#include<cstdlib>
#include<iomanip>
#include"./headerFiles/functor1.h"
#include"./headerFiles/optim.h"
#include"./headerFiles/function.h"

using std::cout;using std::endl;


int main(int argc, char**argv){
	int itMax=atoi(argv[1]);
	double delta=atof(argv[2]);
	double start=atof(argv[3]);
	function func;
	functor1<function> f(&func,&function::fun0,&function::fun1,&function::fun2);
	optim<function> opt(itMax,delta);//(itMax,delta);
	double fMin=opt.newton(f,0.,1.,start);
	cout<<"The approx minimizer is "<<std::setprecision(16)<<fMin<<endl;
	return 0;
}
