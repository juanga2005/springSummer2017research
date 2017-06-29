/** 
Script for the continuous f:R^n---->R

Author: Juan Garcia
Date: June 04 2017
email: jggarcia@sfu.ca

**/

#ifndef CRN_H_
#define CRN_H_

#include<Eigen/Dense>
using Eigen::MatrixXf;

class CRn{

	public:

		double f0(MatrixXf x){
			 double s;	
			for(int j=0;j<x.rows();j++){	
				s=s+x(j,0)*x(j,0)+1;
			}
			return s;
		}

	
		MatrixXf gradf0(MatrixXf x){
			MatrixXf temp(x.rows(),1);
			for(int j=0;j<x.rows();j++){
				temp(j,0)=2*x(j,0);
			}
			return temp;
		}
		MatrixXf Hf0(MatrixXf x){
			MatrixXf temp=Eigen::MatrixXf::Identity(x.rows(),x.rows());
			return 2*temp;
		}
	
};

#endif	
