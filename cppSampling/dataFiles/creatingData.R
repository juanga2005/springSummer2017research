###########################################

#File Name : creatingData.R

#Date : 10-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: lun 10 jul 2017 00:58:42 PDT

#Purpose:Script to create the data to be read on R

#Modifications:

###########################################



for(i in 1:4){
temp=paste("../../Source",i,"/inputOutputTableSource",i,".csv",sep="")
a=read.csv(temp);a=a[,-1]
	for(j in 1:9){
		temp=subset(a,location==j)
		Xtrain=temp[,2:4]
		ytrain=temp[,5]
		string1=paste("XS",i,"L",j,".csv",sep="")	
		string2=paste("yS",i,"L",j,".csv",sep="")
		path1=paste("./S",i,"/",string1,sep="")
		path2=paste("./S",i,"/",string2,sep="")
		write.table(Xtrain,path1,sep=",",row.names=F,col.names=F)
		write.table(ytrain,path2,sep=",",row.names=F,col.names=F)
	}
}



