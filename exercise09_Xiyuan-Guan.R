# Biocomputing 2022 Exercise09
# 2022-11-11
# Written by Xiyuan Guan
rm(list=ls())
gc()

library(ggplot2)


# task 1
# Find some data on two variables that you would expect to be related to each others
# produces a scatter plot of those two variables that includes a trend line.
setwd("C:/Users/guanx/Documents/N.ND/BIOS 31420 Aqua Eco TA/")
# load dataset from Aquatic Ecology, 2022 Fall
dataset <- read.csv("Data Set Fall 2022 Total.csv")
# subset Temperature measurements on 9/6/2022
Temp <- dataset[which(dataset$CCODE=="TEMP" & dataset$DDATE=="9/6/2022"),]
head(Temp)
Temp$DPTH
Temp$depth <- c(0:9) # Transform water depth into numeric type
# plot depth vs water temperature in St. Mary's Lake
ggplot(Temp, aes(x=depth, y= VALU))+
  geom_point()+
  xlab("Depth (m)")+
  ylab("Temperature (℃)")+
  ggtitle("Temperature in St. Mary's Lake")+
  stat_smooth(method="loess")+ # spline
  theme_classic()


# task 2

setwd("C:/Users/guanx/Documents/N.ND/BIOS 60318 Biocomputing/test/exercise9/Exercise09/")
data <- read.csv("data.txt")
# First, show a barplot of the means of the four populations. 
ggplot(data, aes(x=region, y=observations))+
  stat_summary(fun.y = mean,
                geom = "bar")+
  theme_classic()

# I think boxplot is better to use here
ggplot(data, aes(x=region, y=observations))+
  geom_boxplot()

# Second, show a scatter plot of all of the observations
# geom_jitter() adds a small amount of random variation to the location of each point, 
# and is a useful way of handling overplotting caused by discreteness in smaller datasets.
ggplot(data, aes(region,observations))+
  geom_jitter(alpha=0.1) # alpha: make the points transparent

# Do the bar and scatter plots tell you different stories? Why?
# The bar and scatter plots tell different stories. 
# The scatter plot shows how data distribute along observations, as the "alpha" aesthetic makes it clearer to see the density.
# In east region, the observations tend to be normally distributed, with high frequencies in the middle and low frequencies on both sides.
# In north region, the observations are uniform and concentrated distributed.
# In south region, the observations are divided into two parts, with the upper part being more sparse and the lower part more concentrated.
# In west region, the observations are uniform and sparse distributed.
# The bar plot only shows the mean observations of four populations, where 4 populations have very similar mean values. 
# However, I think the boxplot is better to use here to show the sparsity and dispersion by the range of boxes, and to compare with the jitter plot.
# It's good at showing the mean value of the observations, but is weak at representing the real distribution.