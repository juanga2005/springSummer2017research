/** ---------------------------------------

*File Name : auxF.cpp

*Date : 10-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: lun 10 jul 2017 19:05:14 PDT

*Purpose:Methods for the auxF class

*Modifications:

----------------------------------------**/


#include"auxF.h"

MatrixXd auxF::dom2cube(const MatrixXd &X){
	/**Changes the columns of and nxd matrix
	into the unit cube

	Inputs:
	*X an nxd real matrix
	
	Output:
	An nxd matrix A where max(A_{i})=1 and min(A_{i})=0
	**/
	

	int n=X.rows(),d=X.cols();
	MatrixXd temp=MatrixXd::Zero(n,d);
	//Finding the maximum and minimum in each column
	for(int j=0;j<d;j++){
		double min=HUGE_VAL,max=-HUGE_VAL;
		for(int i=0;i<n;i++){
			if(X(i,j)>max){
				max=X(i,j);
			}	
			if(X(i,j)<min){
				min=X(i,j);
			}
		}
		//Maping the j-th column
		for(int i=0;i<n;i++){
			temp(i,j)=(double)(X(i,j)/(max-min))-(double)(min/(max-min));
		}
	}
	return temp;
}	








