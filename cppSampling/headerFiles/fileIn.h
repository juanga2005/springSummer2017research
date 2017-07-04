/** ---------------------------------------

*File Name : fileIn.h

*Date : 04-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: mar 04 jul 2017 14:46:21 PDT

*Purpose: Script to read data from .txt files

*Modifications:

----------------------------------------**/


#ifndef FILEIN_H_
#define FILEIN_H_

#include<vector>
#include<string>
using std::vector;using std::string;


class fileIn{

	private:
		vector<vector<double>>v;
		void tokenizer(const string& str,vector<string>& tokens);
	public:
		fileIn(const char* fname);
		~fileIn(){};
		int getVNRows(){return v.size();}
		int getVLength(int i){return v[i].size();}
		double getV(int i, int j){return v[i][j];}
		
};



#endif
