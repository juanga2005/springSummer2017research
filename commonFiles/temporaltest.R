source('jarCoordinates.R');source('locateJars.R');source('depositionEstimation.R')

xmin=ymin=-200;xmax=ymax=1200 #Range of the grid (in meters)
nx=ny=30; #Number of grid points in x and y
n=64; # Number of computer experiments
translation=200 #--> This is for the first set of experiments
dir='../Source1/'
sor=1
#########################################################

jar.coordinates=jarCoordinates()#--> Obtain the coordinates of the jars

jar.location=locateJars(jar.coordinates,xmin,xmax,ymin,ymax,nx,ny,translation)

deposition.values=depositionEstimation(jar.location,n,nx,ny,dir,sor)
