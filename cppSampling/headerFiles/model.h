/** ---------------------------------------

*File Name : model.h

*Date : 09-07-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: lun 10 jul 2017 01:16:48 PDT

*Purpose: Header for the model
class for GP regression

*Modifications:

----------------------------------------**/


#ifndef MODEL_H_
#define MODEL_H_

#include"kernel.h"
#include"covMatrix.h"
#include"fileIn.h"



class model{
	/**Creates the covariance matrices for
	a given trianing data **/

	private:
		const char* folderName;//Is the name of the folder that contains the training data always ends with /"

	public:
		model(const char* foldername):folderName(foldername){};
		MatrixXd create(const char* fname,double* param);//Creates the covariance Matrix K with the data in fname
};





#endif
