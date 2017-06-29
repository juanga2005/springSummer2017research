/** ---------------------------------------

*File Name : testString.cpp

*Date : 28-06-2017

*Author: Juan Garcia

*Email: jggarcia@sfu.ca

*Last Modified: mié 28 jun 2017 23:48:54 PDT

*Purpose:

*Modifications:

----------------------------------------**/

#include<iostream>
#include<string>

using namespace std;

int main(){
	string st1="hi";
	string st2="hI";
	string st3="hi";

	cout<<(st1==st3)<<endl;

	if(st1!=st2){
		cout<<"String is not case sensitive"<<endl;
	}
	if(st1==st3){
		cout<<"Puedo comparar cadenas"<<endl;
	}
	return 0;
}
