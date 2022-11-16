# Exercise 09
# Written by: Isaiah Murrell-Thomas
# Need to load ggplot and cowplot
library(ggplot2)
library(cowplot)

# Problem 1
# Find some data on two variables that you would expect to be related to each other. These data can come
# from your own research, your daily life, or the internet. Enter those data into a text file or Excel and then
# save a text file, and write a script that loads this text file and produces a scatter plot of those two variables
# that includes a trend line.
# I am using data from my lab research on DOC in potable water systems. The data you will see represented in a graph
# will be a calibration curve from my most recent run on 11/8/22
# Load data 
Problem1=read.table("Problem1Data.txt", header=TRUE, sep="\t")
# Make scatter plot
ggplot(Problem1, aes(x=Mean.Area, y=Concentration..mg.L.)) + geom_point() + geom_smooth(method=lm)

# Problem 2
# Given the data in “data.txt”. Write a script that generates two figures that sumamrize the data. First, show
# a barplot of the means of the four populations. Second, show a scatter plot of all of the observations. You may
# want to “jitter” the points (geom_jitter()) to make it easier to see all of the observations within a population
# in your scatter plot. Alternatively, you could also try setting the alpha argument in geom_scatterplot()
# to 0.1. Answer the following questions as a comment in your R script - Do the bar and scatter plots tell you
# different stories? Why?
# Load data
Problem2=read.table("data.txt", header=TRUE, stringsAsFactors = FALSE, sep=",")
# Make scatter plot
ggplot(Problem2, aes(x=region, y=observations)) + geom_jitter(alpha=0.2) + xlab("Region") + ylab("Observations")
# Make bar graph of the means
ggplot(Problem2, aes(x=region, y=observations)) + stat_summary(geom="bar", fun="mean") + ylab("Mean Observations") + xlab("Region") 
# Answer to the question:
# The graphs do indeed tell different stores. The bar graph shows the mean population for each region. The scatter plot shows all 
# all the data, but when you jitter the points and use the alpha command, you can see the density of the points which gives you a idea
# of how many points have similar values (in other words it acts like the mode showing you frequency)