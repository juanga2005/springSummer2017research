/** ---------------------------------------

*File Name : covMatrix.h

*Date : 02-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: mar 04 jul 2017 13:22:21 PDT

*Purpose: The covariance matrix class that 
contains all the information of all 
the covariance matrices according 
to the chosen kernel

*Modifications:

----------------------------------------**/


#ifndef COVMATRIX_H_ 
#define COVMATRIX_H_

#include<Eigen/Dense>
#include<string>
#include"Functor.h"
#include"kernel.h"
#include"kernelFunction.h"




using Eigen::MatrixXd;using std::string;
using Eigen::LLT;





class covMatrix{
	private:
		string kerType;
	public:
		
		//initializer
		covMatrix(string kertype):kerType(kertype){};
		

		//Methods
		MatrixXd distances(const MatrixXd  &Xtrain,const MatrixXd &Xtest);
		
		MatrixXd covariance(const MatrixXd &Xtrain,const MatrixXd &Xtest,const double l,const double nugget);

		double predict(const MatrixXd &K,const MatrixXd &k,const MatrixXd &ytrain);
};
//Methods




//Prediction method




#endif
