/** ---------------------------------------

*File Name : fileOut.h

*Date : 04-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: mar 04 jul 2017 14:22:11 PDT

*Purpose: Class that streams out data files with specified structure

*Modifications:

----------------------------------------**/


#ifndef FILEOUT_H_
#define FILEOUT_H_

#include<iostream>
#include<fstream>
#include<cstdlib>

template<class T=double> class fileOut{

	private:	
		char* fName;
		bool App;
	public:
		fileOut(char* fileName, bool app=0):fName(fileName),App(app){};
		~fileOut(){};

		void write(int nrows,int ncols,const T* const* pData)const;
};

template<class T> void fileOut<T>::write(int nrows, int ncols,const T* const* pData)const{

	//Assuming no appending
	if(App==0){
		std::ofstream outFile; //Creating an object of the class ofstream
		outFile.exceptions(std::ofstream::failbit|std::ofstream::badbit);

		try{
			outFile.open(fName);
		}
		catch(std::ofstream::failure e){
			std::cout<<"Error opening the output file: "<<e.what()<<std::endl;

		}

		for(int i=0;i<nrows;i++){
			for(int j=0;j<ncols;j++){
				outFile<<" "<<pData[i][j]<<" ";
			}
			outFile<<std::endl;
		}
		outFile.close();//closing the file
	}
	//Assuming appending
	else{
		std::ofstream outFile(fName,std::ios::app);
		if(!outFile.is_open()){
			std::cout<<"Error opening output file!" <<std::endl;
			exit(1);
		}
		
		for(int i=0;i<nrows;i++){
			for(int j=0;j<ncols;j++){
				outFile<<" "<<pData[i][j]<<" ";
			}
			outFile<<std::endl;
		}
		outFile.close();
	}
}

#endif
