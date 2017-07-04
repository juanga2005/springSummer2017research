/** ---------------------------------------

*File Name : kernel.cpp

*Date : 03-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: lun 03 jul 2017 17:30:09 PDT

*Purpose: Methods for the kernel.h header

*Modifications:

----------------------------------------**/

#include "kernel.h"

Functor<kernelFunction> kernel::type(const string kertype){
	int d;
	if(kertype=="gauss"){
		 d=1;
	}
	switch(d){
		case(1): 
			kernelFunction ff;
			Functor<kernelFunction> f(&ff,&kernelFunction::gauss);
			return f;
		}
}
