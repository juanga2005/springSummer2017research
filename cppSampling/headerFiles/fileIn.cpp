/** ---------------------------------------

*File Name : fileIn.cpp

*Date : 04-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: lun 10 jul 2017 01:18:59 PDT

*Purpose: Methods of the header fileIn.h

*Modifications:

----------------------------------------**/

#include"fileIn.h"
#include<fstream>
#include<iostream>
#include<cstdlib>
using std::string; using std::vector;using std::cout;using std::endl; using std::ifstream;


fileIn::fileIn(const char* fname){
	vector<string> words;
	string line;
	this->Fname=fname;
	ifstream in(fname);

	if(in.is_open()){
		while(!in.eof()){
			getline(in,line);
			if(line.length()!=0){
				tokenizer(line,words);
				if(words.size()!=0){
					v.push_back(vector<double>());
					for(int i=0;i<words.size();i++){
						v[v.size()-1].push_back(atof(words[i].c_str()));
					}
				}
				words.clear();
			}
		}
	}
	else{
		cout<<"Unable to open the file"<<endl;
		exit(1);
	}
}


void fileIn::tokenizer(const string& str,vector<string>& tokens){
	string delimiters=",";
	//Skip delimiters at the begining
	string::size_type lastPos=str.find_first_not_of(delimiters,0);
	//Find the end of the first token
	string::size_type pos=str.find_first_of(delimiters,lastPos);

	//Loop while there are tokens to be found i.e., one of the searcher for a delimiter (pos)
	//or nondelimiter (lastpos) does not fail

	while(string::npos!=pos||string::npos!=lastPos){
		//found a token add it to the vector
		tokens.push_back(str.substr(lastPos,pos-lastPos));
		//skip next set of delimiters and go to the next token
		lastPos=str.find_first_not_of(delimiters,pos);
		//find end of token or start of next delimiter
		pos=str.find_first_of(delimiters,lastPos);
	}
}

MatrixXd fileIn::data2mat(){
	/**
	Function that changes data into a MatrixXd object

	Input:
	*fname: an string containing the name of the file to be transformed
	
	Output:
	A MatrixXd element with the data in fname in it
	**/

		
	int n=this->getVNRows();//Number of rows
	int m=this->getVLength(1);//Number of columns
	
	MatrixXd output(n,m);

	for(int i=0;i<n;i++){
		for(int j=0;j<m;j++){
			output(i,j)=this->getV(i,j);
		}
	}
	return output;
}
