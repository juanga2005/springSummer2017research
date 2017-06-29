/**
Script to create the set C^{2}(R;R)

Author: Juan Garcia
Date: June 4 2017
email: jggarci@sfu.ca

**/


#ifndef C2R_H_
#define C2R_H_


class C2R{

	public:


		double f0(double x){
			return (x-1)*(x-1)*(x-1)*(x-1);
		}
	
		double f1(double x){
			return 4*(x-1)*(x-1)*(x-1);
		}
		double f2(double x){
			return 12*(x-1)*(x-1);
		}
};

#endif

