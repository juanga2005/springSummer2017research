/** ---------------------------------------

*File Name : covMatrix.cpp

*Date : 03-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: lun 10 jul 2017 01:55:50 PDT

*Purpose: Contains all the methods of the header covMatrix.h

*Modifications:

----------------------------------------**/

#include "covMatrix.h"
#include<Eigen/Dense>
#include<iostream>
using Eigen::MatrixXd;
using namespace std;

MatrixXd covMatrix::distances(const MatrixXd &Xtrain,const MatrixXd &Xtest){
	/**
	Calculates the distance between the training and test set.
	
	Inputs:
	* Xtrain: nxd matrix with the training data
	* Xtest: txd matrix with the test set 

	Outputs:
	* nxt matrix D, such that D(i,j) is the distance between 
	  the i-th training point with the j-th test point

	 **/
	int n=Xtrain.rows(), d=Xtrain.cols();
	int t=Xtest.rows();
	//Creating the distance matrix
	MatrixXd D(n,t);
	MatrixXd aux=Xtrain*Xtest.transpose();
	MatrixXd Xtrain2(n,d); //Square of Xtrain
	MatrixXd Xtest2(t,d);//Square of Xtest
	//Creating the productwise multiplication
	MatrixXd onesdt=MatrixXd::Ones(d,t), onesnd=MatrixXd::Ones(n,d);
	for(int j=0;j<d;j++){
		for(int i=0;i<n;i++){
			double aij=Xtrain(i,j);
			Xtrain2(i,j)=aij*aij;
		}
		for(int i=0;i<t;i++){
			double aij=Xtest(i,j);
			Xtest2(i,j)=aij*aij;
		}
	}
	D=Xtrain2*onesdt+onesnd*(Xtest2.transpose())-2*aux;
	return D;
}



MatrixXd covMatrix::covariance(const MatrixXd &Xtrain,const MatrixXd &Xtest,const double l,const double nugget){

	/**
	Calculates the covariance matrix of the training and test set.

	Inputs:
	*Xtrain: nxd matrix with the training set
	*Xtest: txd matrix with the test set
	*l: positive real number that characterizes the kernel k(|x-x'|;l)
	*nugget: if positive is the regularization factor K+nugget*I

	Output:
	A nxt covariance matrix s.t. K(Xtrain,Xtest)_{ij}=k(|x_{i}-x'_{j}|,l)
	**/


	bool delta; //KroneckerDelta
	MatrixXd D=this->distances(Xtrain,Xtest);
	kernel k;
	int n=D.rows(),t=D.cols();

	//Checking the kernel Type
	if(kerType=="gauss"){
		Functor<kernelFunction> f=k.type("gauss");
		if(Xtrain.rows()==Xtest.rows()){
			MatrixXd temp(n,n);
			for(int i=0;i<n;i++){
				for(int j=0;j<n;j++){
						delta=(i==j);
						temp(i,j)=f(D(i,j),l)+nugget*delta;
					
				}
			}
			return temp;
		}
		else{
			MatrixXd temp(n,t);
			for(int i=0;i<n;i++){
				for(int j=0;j<t;j++){
						temp(i,j)=f(D(i,j),l);
					
				}
			}
			return temp;
		}
				
	}	
}	



double covMatrix::predict(const MatrixXd &K,const MatrixXd &k,const MatrixXd &ytrain){
	/**
	Predicts the output given by 

	Inputs:
	*K: is and nxn matrix of the form (K+nugget*I)^{-1}
	*k: is the 1x1 covariance matrix with the distance of the test point to Xtrain
	*ytrain: an nx1 vector with the trianing output 
	
	Output:
	the real numner prediction given by k'*(K)^{-1}*ytrain
	 **/

	double prediction;
	//Cholesky decomposition of K
	//LLT<MatrixXd> llt(K);
	////Solving for the prediction	
	MatrixXd aux=K.llt().solve(ytrain);
	//MatrixXd L=llt.matrixL();
	//MatrixXd aux=L.colPivHouseholderQr().solve(ytrain);
	//MatrixXd aux2=(L.transpose()).colPivHouseholderQr().solve(aux);
	//prediction=(k.transpose()*aux2).value();
	return prediction=(k.transpose()*aux).value();
}
