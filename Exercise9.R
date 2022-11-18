# Nathan Kroeze
# Exercise 9
# 11/18/2022

library(tidyverse)

# Q1: Enter those data into a text file or Excel and then
# save a text file, and write a script that loads this text file and produces a scatter plot of those two variables
# that includes a trend line.

setwd("C:/Users/Natha/Desktop/Biocomputing/Exercise09/")
researchData <- read.csv("researchData.csv")
researchData <- researchData[,-1] #remove count column

ggplot(researchData, aes(d13C,d15N)) + 
  geom_jitter() + geom_smooth(method = "lm") + 
  labs(title = "Research Isotope Data")
 
# Q2: Write a script that generates two figures that sumamrize the data. First, show
# a barplot of the means of the four populations. Second, show a scatter plot of all of the observations.

dataEx <- read.table("data.txt",header = TRUE, sep = ",")

ggplot(data = dataEx, aes(x=region,y=observations)) + 
  stat_summary(geom = "bar",fun = "mean") +
  xlab("Region") + ylab("Means of Populations") + theme_bw() 

ggplot(data = dataEx, aes(x=region,y=observations)) + 
  geom_jitter() +
  xlab("Region") + ylab("Observations") + theme_bw() 

# Answers:
# The plots tell different stories because the bar plot demonstrates that the average population for 
# each region is roughly the same, however the scatter plot shows that the variance in these data are not
# consistent across regions. For example, the western region has a wide variance of observations but
# the northern region has a narrow densely populated band. This difference is lost in the bar plot and
# would have been missed if not plotted separately.
