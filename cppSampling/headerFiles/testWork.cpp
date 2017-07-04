/** ---------------------------------------

*File Name : testWork.cpp

*Date : 02-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: mar 04 jul 2017 13:42:33 PDT

*Purpose:Script to test what I do

*Modifications:

----------------------------------------**/

#include<iostream>
#include "kernel.h"
#include "Functor.h"
#include "covMatrix.h"
#include<Eigen/Dense>
#include"kernelFunction.h"
#include<cmath>
#include<ctime>
using namespace std;
using Eigen::MatrixXd;
using Eigen::LLT;
int main(){
	const double pi=M_PI;
	//MatrixXd* pp=new(std::nothrow) MatrixXd(2,2);
	//*m=MatrixXd::Ones(2,2);
	//kernelFunction ff;
	//Functor<kernelFunction> f(&ff,&kernelFunction::test);
	////cout<<"it worked!"<<endl;
	//cout<<f(*m)<<endl;
	//cout<<m<<endl;
	//MatrixXd* XX=new(std::nothrow) MatrixXd(3,3);
	//cout<<"The value of XX is "<<(*XX)*(*XX)<<"And its address is "<<XX<<endl;
	int n=64;
	int d=3;
	MatrixXd Xtrain=MatrixXd::Random(n,d);
	MatrixXd Xtest(1,d);Xtest<<0.33,0.33,0.34;//Xtest<<0.25,0.25,0.25,0.25;
	MatrixXd ytrain(n,1);
	//Creating the training and test set
	//double* x=new double[10];
	//x[0]=0;x[1]=0.3;x[2]=0.6;x[3]=0.7;x[4]=0.75;x[5]=0.2;x[6]=0.28;x[7]=0.88;x[8]=0.05;x[9]=1;
	for(int i=0;i<n;i++){
			//ytrain(i,0)=sin(2*pi*(Xtrain(i,0)+Xtrain(i,1)+Xtrain(i,2)+Xtrain(i,3)));
			ytrain(i,0)=sin(2*pi*(Xtrain(i,0)+Xtrain(i,1)));
	}
	//cout<<C.distances(Xtrain,Xtest)<<endl;

	//cout<<"Xtrain \n"<<Xtrain<<endl; 
	//cout<<"ytrain \n"<<ytrain<<endl;
	covMatrix C("gauss");
	MatrixXd K=C.covariance(Xtrain,Xtrain,0.25,9.4e-10);
	double sec;
	clock_t b=clock();
//
	MatrixXd k=C.covariance(Xtrain,Xtest,0.25,0.1);
	double p=C.predict(K,k,ytrain);
	cout<<"The prediction is "<<p<<endl;

	sec=(double)(clock()-b)/(double)CLOCKS_PER_SEC;
	cout<<"The time spent was "<<sec<<endl;
//	//Xtrain(0,0)=1;Xtrain(1,1)=1;
//	//MatrixXd test=K.covariance(Xtrain,Xtrain,1,1);
//	//LLT<MatrixXd> L(test);
//	//MatrixXd C=L.matrixL();
//	//cout<<test<<endl;
//	//cout<<C<<endl;
//	//cout<<C*C.transpose()<<endl;	
//	//MatrixXd y(7,1);y<<1,1,1,1,2,4,-5;
//	//MatrixXd sol=C.colPivHouseholderQr().solve(y);
//	//cout<<sol<<endl;
//	//cout<<C*sol<<endl;
//
//
	
	return 0;
}	