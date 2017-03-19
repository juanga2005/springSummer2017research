a=read.csv('thirdtry.csv');a=a[,-1]
datos=a[25e3:5e3,]
names(datos)=c('gamma','z0','L','q1','q2','q3','q4')
#Trace plots
par(mfrow=c(3,3))

for(j in 1:7){
	plot(datos[,j],type='l',ylab=names(datos[j]))
a

}

X11()
par(mfrow=c(3,3))
for(j in 1:7){
	hist(datos[,j],ylab=names(datos)[j])
}

