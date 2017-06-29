

#include<iostream>
#include<Eigen/Dense>
#include"./headerFiles/Functor.h"
#include"./headerFiles/CRn.h"
#include"./headerFiles/GBM.h"
#include"./headerFiles/C2R.h"

using Eigen::MatrixXf;
using namespace std;

int main()
{
	int narg=3;
	MatrixXf x(narg,1);	x<<4,6,2;
	CRn ff;
	Functor<CRn> f(narg,&ff,&CRn::f0,&CRn::gradf0,&CRn::Hf0);

	GBM<CRn> opt(1e-9,200);
	MatrixXf minimizer=opt.steepestD(f,x);

	//Testing the functor of functor

	cout<<"The function is "<<f(x)<<endl;
	cout<<"The gradient is \n"<<f(x,1)<<endl;
	cout<<"The Hessian is \n"<<f(x,2)<<endl;
	cout<<"The minimizer is at \n"<<minimizer<<endl;
	return 0;
}
