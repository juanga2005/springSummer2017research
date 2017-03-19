rm(list=ls())

# read input data
xdata <-as.matrix(read.table("../data/design_scaled.dat", header=TRUE))

# read output data
ydata <-as.matrix(read.table("../data/maxdep_scaled.dat", header=TRUE))


## 1D Example 2
xsize <- dim(xdata);
ysize <- dim(ydata);

n = xsize[1]; d = xsize[2];

clist=list(pgtol=1e-14, lmm=100, factr=1e2, maxit=2000, optim.method='BFGS')
utol <-11
##Kriging fit
library(DiceKriging, lib.loc="~/R-packages/")
KMmodel <- km(formula=~1, design=xdata, response=ydata, covtype='powexp', control=clist)
KMmodel_coeffs <- coef(KMmodel)
KM_p <- c(do.call("cbind",KMmodel_coeffs[3]))
KM_th <- c(do.call("cbind",KMmodel_coeffs[2]))
KM_th <- 0.5*(1/KM_th)^2
KM_RMSE <-sqrt(mean((leaveOneOut.km(KMmodel, 'UK')$mean - ydata)^2))

CVprediction <- leaveOneOut.km(KMmodel,'UK')$mean
CVresidual <- (CVprediction - ydata)
plot(CVprediction,CVresidual/max(abs(CVresidual)), ylim=c(-1,1), xlab='CV prediction', ylab='Standardized CV residual')

setEPS()
 postscript("DiceKrigingDiag.eps")
plot(KMmodel)
dev.off()

setEPS()
 postscript("CVpredVSresid.eps")
plot(CVprediction,2*CVresidual/max(abs(CVresidual)), ylim=c(-2,2), xlab='CV prediction', ylab='Standardized CV residual')
dev.off()

library(sensitivity, lib.loc="~/R-packages/")

kriging.mean <- function(Xnew, m) { predict.km(m, Xnew, "UK", se.compute = FALSE, checkNames = FALSE)$mean }

SA.metamodel <- fast99(model = kriging.mean, factors =d , n = 1000, q = "qunif", q.arg = list(min = 0, max = 1), m = KMmodel)

setEPS()
 postscript("SAKriging.eps")
plot(SA.metamodel)
dev.off()

