
testWork.exe: kernel.o covMatrix.o testWork.o
	g++ kernel.o covMatrix.o testWork.o -o testWork.exe

kernel.o: kernel.cpp kernel.h
	g++ -c kernel.cpp

covMatrix.o: covMatrix.cpp covMatrix.h
	g++ -c covMatrix.cpp

testWork.o: testWork.cpp Functor.h kernelFunction.h
	g++ -c testWork.cpp

clean:
	rm *.o *testWork.exe
