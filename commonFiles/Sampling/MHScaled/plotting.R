a=read.csv('onemillionSamples.csv');a=a[,-1]
samp=1:1e3:1e6
datos=a[5e5:1e6,]
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
	d=density(datos[,j],kernel='gauss')
	hist(datos[,j],ylab=names(datos)[j],prob=T)
	lines(d)
}

