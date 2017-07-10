/** ---------------------------------------

*File Name : fileIn.h

*Date : 04-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: dom 09 jul 2017 22:09:59 PDT

*Purpose: Script to read data from .txt files

*Modifications:

----------------------------------------**/


#ifndef FILEIN_H_
#define FILEIN_H_

#include<vector>
#include<string>
#include<Eigen/Dense>
using std::vector;using std::string;
using Eigen::MatrixXd;

class fileIn{

	private:
		vector<vector<double> >v;
		void tokenizer(const string& str,vector<string>& tokens);
		const char* Fname;
	public:
		fileIn(const char* fname);
		~fileIn(){};
		int getVNRows(){return v.size();}
		int getVLength(int i){return v[i].size();}
		double getV(int i, int j){return v[i][j];}
		MatrixXd data2mat();
		
};



#endif
