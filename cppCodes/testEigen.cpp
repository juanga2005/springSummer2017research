//Script to test the eigen library


#include<iostream>
#include<Eigen/Dense>

using Eigen::MatrixXd;

int main(){
	MatrixXd m=MatrixXd::Random(5,5);
	MatrixXd n=MatrixXd::Random(5,5);
	std::cout<<m<<"\n"<<std::endl;
	//std::cout<<n<<std::endl;
	//std::cout<<"mxn is \n"<<m*n<<std::endl;
	std::cout<<m.transpose()<<std::endl;	
	return 0;
}
