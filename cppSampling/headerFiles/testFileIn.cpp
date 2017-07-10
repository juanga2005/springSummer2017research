/** ---------------------------------------

*File Name : testFileIn.cpp

*Date : 05-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: dom 09 jul 2017 21:29:20 PDT

*Purpose:

*Modifications:

----------------------------------------**/

#include<iostream>
#include"fileIn.h"
#include<Eigen/Dense>


using namespace std;
using Eigen::MatrixXd;

int main(){
	fileIn f("inputOutputTableSource1.csv");
	//cout<<f.getV(3,4)<<endl;
	//cout<<f.getVNRows()<<endl;
	//cout<<f.getVLength(1)<<endl;
	int n=f.getVNRows();
	int m=f.getVLength(1);
	cout<<n<<endl;
	MatrixXd aux(n,m);
	for(int i=0;i<n;i++){
		for(int j=0;j<m;j++){
	  		aux(i,j)=f.getV(i,j);
		}
	}
	cout<<aux.cols()<<endl;
	cout<<aux.rows()<<endl;	
	cout<<aux(1,3)<<endl;
	//cout<<aux<<endl;
	MatrixXd M=f.data2mat("inputOutputTableSource1.csv");
	cout<<M<<endl;
	return 0;
}
