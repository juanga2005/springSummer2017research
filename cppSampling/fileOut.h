//Template to handle output files


#include<iostream>
#include<fstream>
#include<cstdlib>

template<class T=double> class fileOut{
	
	private:
		char* fName;
		bool App;	//This is to decide if append or not
	public:
		fileOut(char* fileName,bool app=0); //constructor
		~fileOut(){};//destructor

		void write(int nrows,int ncols,const T* const* pData)const;
};

//Method definitions

template<class T> fileOut<T>::fileOut(char* fileName,bool app){
	fName=fileName;
	App=app;
}

template<class T> void fileOut<T>::write(int nrows,int ncols,const T* const* pData)const{
	
	if(App==0){
		std::ofstream outFile;
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
		outFile.close();
	}
	else{
		std::ofstream outFile(fName,std::ios::app);
			if(!outFile.is_open()){
				std::cout<<"Error opening the output file!" <<std::endl;
				exit(1);
			}
			for(int i=0;i<nrows;i++){
				for(int j=0;j<ncols;j++){
					outFile<<" "<<pData[i][j]<<" "j;
				}
				outFile<<std::endl;	
			}
			outFile.close();
		}
}


