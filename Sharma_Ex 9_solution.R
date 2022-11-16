
#1 Find some data on two variables that you would expect to be related to each other.
#These data can come from your own research, your daily life, or the internet. 
#Enter those data into a text file or Excel and then save a text file, and write a
#script that loads this text file and produces a scatter plot of those two variables 
#that includes a trend line.

#using read.csv2() function to read the file. My computer doesnot follow US keyboard
#it use comma as a decimal instead of dot in excel.

createdfile <- read.csv2(file="createdfile.csv", header = TRUE)
getwd()
setwd("/Users/pujasharma/Documents/Phd_data/Exercise09")
#Temperature as predictor variable and tree water use as a response variable
#how temperature influence on the tree water use capacity of tree
library(ggplot2)
ggplot(data=createdfile, aes(x=Temperature...F., y=WaterUse..l.day.))+
geom_point()+
  ylab("Tree Water Use (l/day)")+
  xlab("Temperature(°F)")+
  geom_smooth(method="lm")
#..in Temperature and water use is because of some symbol I used like bracket 
#and degree for temperature.


#2 Given the data in “data.txt”. Write a script that generates two figures that
#summarize the data. First, show a barplot of the means of the four populations. 
#Second, show a scatter plot of all of the observations. You may want to “jitter” 
#the points (geom_jitter()) to make it easier to see all of the observations 
#within a population in your scatter plot. Alternatively, you could also try 
#setting the alpha argument in geom_scatterplot() to 0.1. Answer the following 
#questions as a comment in your R script - Do the bar and scatter plots tell you 
#different stories? Why?

#read the file "data.txt".
#barplot shows the mean observation of each four population with standard error. 
#The observation on north population seems not deviated, with low standard error bar.
#While, the data in east,south and west population is highly deviated from mean,
#with high standard error bar.

#Scatter plot shows the true observation of each point. We can see the data in 
#east and west population is highly deviate in range between 0 and 30 observation.
#While, north population observation is in small range between 12 and 18.
#South region population has observation in two patches between 4-7 and 20-30.

#Thus, the standard error is high in east, south and west region and low in north one
#(the one where data is not deviated from mean)
data <- read.csv(file = "data.txt", header = TRUE, sep = ",")
#Bar
ggplot(data=data, aes(x=region, y=observations))+
  stat_summary(geom="bar", fun.y="mean") +
  stat_summary(geom="errorbar", fun.data = "mean_se", width=0.3) +
  ylab("Means of the Four Population ")+
  xlab("Region")+
  theme_bw()+
  theme(legend.title=element_blank())
  
ggplot(data=data, aes(x=region, y=observations, color=region))+
geom_jitter()+
  theme(legend.title=element_blank())


