/** ---------------------------------------

*File Name : auxF.h

*Date : 10-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: lun 10 jul 2017 18:46:34 PDT

*Purpose:The class that contains all the auxiliary
funcitons needed

*Modifications:

----------------------------------------**/


#ifndef AUXF 
#define AUXF	
#include<Eigen/Dense>
using Eigen::MatrixXd;

class auxF{

	public:
	MatrixXd dom2cube(const MatrixXd &X);//Change domain to unit cube
	MatrixXd cube2dom(const MatrixXd &X);//Change unit cube to actual domain
};
#endif
