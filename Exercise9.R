#Elias Issa Exercise09

#Set Working Directory
setwd("/Users/elias/Downloads")
#Initialize ggplot2
library(ggplot2)

#Q1
#Load data set oxygen
oxygen <- read.table("Oxygen.txt", header= T, sep = "\t", stringsAsFactors=FALSE)


#Plot o2% against relative fluorescence and add a trend line, Standard error is false
ggplot(data=oxygen, aes(x = O2, y = RF)) + geom_point() +xlab("Oxygen (%)")+ylab("Relative Fluorescence")+theme_classic()+geom_smooth(se=F,method="lm")
  
  
#Q2
#Load data.txt
data <- read.table("data.txt", header= T, sep = ",", stringsAsFactors=FALSE)

#Plot bar chart of mean observations for each region
ggplot(data=data, aes(x = region, y = observations)) + geom_bar(position="dodge",stat="summary",fun= "mean") +xlab("Region")+ylab("Observations")+theme_classic()

#Plot scatterplot of observations for each region
ggplot(data=data, aes(x = region, y = observations)) + geom_point()+ geom_jitter() +xlab("Region")+ylab("Observations")+theme_classic()

#The bar and scatter plots tell different sotries as based on the bar plot the data seems very similar
#Based on the scatter plot the data is very different as they have different distributions with similar means
#This would be reflected in other analysis such as finding the standard deviations of the data
