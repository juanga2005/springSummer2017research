
testWork.exe: kernel.o covMatrix.o fileIn.o model.o   testWork.o
	g++ kernel.o covMatrix.o testWork.o  fileIn.o  model.o -o testWork.exe

kernel.o: kernel.cpp kernel.h
	g++ -c kernel.cpp

covMatrix.o: covMatrix.cpp covMatrix.h
	g++ -c covMatrix.cpp

fileIn.o: fileIn.cpp fileIn.h 
	g++ -c fileIn.cpp

model.o: model.cpp model.h
	g++ -c model.cpp

testWork.o:  Functor.h kernelFunction.h  testWork.cpp
	g++ -c testWork.cpp

clean:
	rm *.o *testWork.exe
