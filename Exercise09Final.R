#Exercise09

#Part1
#set directory
setwd("/Users/romanfresquez/Tutorials/Exercise09")
#create variable with data on the net worth of singers as their age increases
artist.worth<-read.csv("Ex09DataFinal.csv")

#load the plotting packages
library(ggplot2)
library(cowplot)

#plot age against net worth and add a linear trend line
ggplot(data=artist.worth,
       aes(x=Age,y=Net.Worth..millions.))+
  geom_point()+
  stat_smooth(method="lm")+
  theme_classic()

#Part 2
#create variable with data from data.txt
location.data<-read.csv("data.txt")
#find out the column names by pulling the first 10 lines
location.data[c(1:10),]

#create bar graph of data points
ggplot(data=location.data, aes(x=region,y=observations))+
  stat_summary(fun.y=mean,
               geom="bar")

#following is for checking that my averages on the bar graph were correct
#create variables for each region data points
north<-location.data[location.data$region=="north",]
east<-location.data[location.data$region=="east",]
south<-location.data[location.data$region=="south",]
west<-location.data[location.data$region=="west",]
#check the averages with the bar graph 
north.mean<-mean(north$observations)
east.mean<-mean(east$observations)
south.mean<-mean(south$observations)
west.mean<-mean(west$observations)

#scatter plot for observartions
ggplot(data=location.data, aes(x=region,y=observations))+
  geom_jitter()+
  theme_classic()


