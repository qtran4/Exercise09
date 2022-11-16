
#1

# Set working directory
setwd("/Users/avivalund/Desktop/Biocomputing/Exercise09")

# Read data
Circuit<-read.csv("Ex9Data.txt")

# load a package every time you wish to use it
library(ggplot2)
library(cowplot)

#Make plot without grey background and gridlines
ggplot(data = Circuit,
       aes(x = Current, y = Magnetic.Field)) +
  geom_point() +
  stat_smooth(method="loess") +
  theme_classic()

#2

#read data
Compass<-read.csv("data.txt")

# barplot of the means of the four populations
ggplot(Compass, aes(x = region, y = observations)) +
  stat_summary(fun.y = mean,
               geom = "bar") 

# scatter plot of all of the observations
ggplot(data = Compass,
       aes(x = region, y = observations)) +
  geom_jitter() +
  theme_classic()

# Answer the following questions as a comment in your R script 
# Do the bar and scatter plots tell you different stories? Why?
# Answer
  # The bar plot shows the mean number of observations, which takes away
  # from what the scatterplot shows, which includes the range and 
  # distribution of the points.