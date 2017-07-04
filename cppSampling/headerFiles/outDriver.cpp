/** ---------------------------------------

*File Name : outDriver.cpp

*Date : 04-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: mar 04 jul 2017 14:18:44 PDT

*Purpose:

*Modifications:

----------------------------------------**/

#include "fileOut.h"

int main(int argc,char** argv){
	int** pI=new int*[2];
	double** pD=new double*[2];
	for(int i=0;i<2;i++){
		pI[i]=new int[3];
		pD[i]=new double[3];
		for(int j=0;j<3;j++){
			pI[i][j]=(1+i)*(j+1);
			pD[i][j]=(double)(i+1)/double(j+1);
		}
	}
	fileOut<int> outInt(argv[1],0);
	outInt.write(2,3,pI);

	fileOut<> outDouble(argv[2],1);
	outDouble.write(2,3,pD);
	return 0;
}
