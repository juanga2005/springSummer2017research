source('gpCreator.R');source('gpPredict.R')
source('gpMatrixCreator.R');source('gpMatrixPredict.R')

M=gpMatrixCreator()
print(M)
Xtest=t(c(0.1,0.001,-1))

s=Sys.time()
for (k in 1:100){
	gpMatrixPredict(M,Xtest)
}
e=Sys.time()
print(s-e)

