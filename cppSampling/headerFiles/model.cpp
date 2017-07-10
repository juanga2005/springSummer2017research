/** ---------------------------------------

*File Name : model.cpp

*Date : 09-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: lun 10 jul 2017 01:24:39 PDT

*Purpose:Driver for the header
file model.h

*Modifications:

----------------------------------------**/


#include"model.h"
#include<Eigen/Dense>
using Eigen::MatrixXd;

MatrixXd model::create(const char* fname,double* param){
	/** Creates the covariances matrix K
	using the data fname

	Input:
	*fname: filename with location that contains the training data
	*param: pointer that contains the info of the paramters 
		    for the kernel
	Output:
	*MatrixXd the covariance matrix K
	**/


	//Loading the training data
	const char* fold=this->folderName;
	char buffer[256];
	strncpy(buffer,fold,sizeof(buffer));
	strncat(buffer,fname,sizeof(buffer));
	fileIn f(buffer);
	MatrixXd Xtrain=f.data2mat();
			
	//Createing the covariance matrix
	covMatrix C("gauss");
	MatrixXd K=C.covariance(Xtrain,Xtrain,param[0],param[1]);
	
	return K;
}





















