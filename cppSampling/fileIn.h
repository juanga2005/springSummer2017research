//Script to read files


#include<iostream>
#include<fstream>
#include<cstdlib>

template<class T=double> class fileIn{

	private:
		char fName;
		int nRows;
		int nCols;
	
	public:
	
		fileIn(char* fileName);//In case the size of the array is in the header of the file
		fileIn(char* fileName,int nrows,int ncols);
	
		~fileIn(){};

		void read(const T* const* pData,isIn=0)const;	
};

//Method definitions
	fileIn(char* fileName);
		
