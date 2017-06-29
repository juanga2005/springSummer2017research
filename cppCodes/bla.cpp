#include<iostream>
#include<Eigen/Dense>
using namespace std;
using Eigen::MatrixXd;

int main(){
	MatrixXd m(3,1);
	MatrixXd oneEl(3,1);
	m<<1,2,3;
	oneEl<<3,5,6;
	cout<<"The addition is "<<endl;
	cout<<m+3*oneEl<<endl;
	cout<<oneEl<<endl;
	cout<<"The size is "<<m(1,0)<<endl;
	cout<<m<<endl;
	cout<<m.transpose()*m<<endl;
	cout<<m.norm()<<endl;
	//cout<<v.size()<<endl;;
	//cout<<v<<endl;
	return 0;
}
