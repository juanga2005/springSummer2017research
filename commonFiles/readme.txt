The folder commonFiles contains all the files common to the four sources.

Folder included:
	1. commonData: Contains the data that can be used in common for each source
	2. sensitivityAnalysis: Contains the functions to do a sensitivity analysis


Files included:

	-----------parent Folder ----------------------------------------
	1. 
	jarCoordinates.R: Script tha returns a data frame that contains the
	x and y coordinates of the nine sources.

	2.
	locateJars.R: Locate the jars in the grid. Returns a data frame	with
	the x column given the location of the column and the y column
	the row.
	3. 
	depositionEstimation.R: Given the location of the sensors in the grid,
	uses the files in the folder computerExperiments to obtain the value
	of the deposition at the location for each of the different experiments.

	------------commonData ----------------------------------------------
	4.
	commonData/designScaled128.txt: Contains the values of the parameters where
	the simulations were ran, scaled in the hypercube [0,1]^5. This data
	is used exclusively for the sensitivity analysis.
	
	5.
	commonData/tableWithParameter.R: Creates a .csv file with the values of all 
	the parameters for all the different sources. This is used exclusively for the
	sensitivity analysis.

	6.
	commonData/paramterTable.csv: Contains a table with the first column
	the sensor repeated the next 5 columns is the parameter combination scaled and 
	the last 4 columns is the deposition on each sensor. This is used exclusively 
	for the sensitivity analysis.
	
	7.
	commonData/design64ThreeVar.txt: Contains the experimental design with 64
	points for the three relevant variables (gamma,z0,L).
	
	8.
	commonData/inputOUtput3VarsGenerator.R: Generates a .csv file with
	the values of the 64 parameters for the three relevant varibles. Then
	stores the corresponding .csv files in the folder SourceX.


	----------GP-----------------------------------------------------------
	9.
	GP/gpCreator.R: Creates an object from the class km that was trained
	by the set Xtrain.
	
	10.
	GP/gpPredict.R: Given an object of the class km, predicts the output
	of the model of the set Xtest.
	
	11.
	GP/gpColCreator.R: Creates a list with 9 km objects for the column col, that
	represents wich source is under study.

	12.
	GP/gpColPredict.R: Predicts the values of the column col on the Xtest set.

	13.
	GP/gpMatrixCreator.R: Creates a 4x9 (i.e. transposed) list where each
	element correspond to a km object for the creation of the matrix

	14.
	GP/gpMatrixPredict.R: Given a 4x9 list of elements with km objects, predict
	the value of the matrix A at the point Xtest.










 

	----------sensitivityAnalysis------------------------------------------

	7.
	sensitivityAnalysis/kmObjectCreator.R: creates a km object for a given 
	sensor and a given source.

	8.
	sensitivityAnalysis/sobolGpCreator.R: creates the sobol object to
	do the sobol index analysis.
	
	9.
	sensitivityAnalysis/sensitivitySource.R: Return a list with the sensitivity indices for 
	all four sources and all nine sensors.

	10.
	sensitivityAnalysis/sensitivityOutput.R: Creates a .csv file with a data frame that 
	contains all values of the parameters (\gamma,...,L) along with the values
	of the deposition for each source. The file is stored in the folder SourceX, where
	X is 1,2,3 or 4 depending on the source where we are doing the analysis.



