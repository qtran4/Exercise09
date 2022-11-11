library(ggplot2)
library (ggeffects)
library (cowplot)
setwd("/users/sydneyharris/desktop")

#Question 1
lizard <- read.table ("/users/sydneyharris/desktop/lizard.txt", header =T, sep =",")
#Degree days above thermal minimum is the number of days where the temperature is above the thermal minimum
#lizard activity represents how the movements of the lizards 
#This will help test for a relationship between temperature and lizard activity
ggplot (lizard, aes (x=Degree.days.above.thermal.minimum, y=Lizard.activity))+
  geom_point()+
  stat_smooth(method="lm")+
  xlab("Degree Days Above Thermal Minimum")+
  ylab("Lizard Activity")+
  theme_classic()

#Question 2
data <- read.table("/users/sydneyharris/desktop/data.txt", header=T, sep = ",")

#Bar plot of mean of four populations using geom_bar() and stat summary
ggplot(data, aes(x=region, y= observations))+
  geom_bar(stat = "summary",
           fun="mean")+
  xlab("Populations")+
  ylab("Mean Number of Observations")+
  theme_classic()

#Scatter plot of all observations using geom_jitter to better see each individual observation
#color by region to make the regions contrast more
ggplot(data, aes(x=region, y=observations, color = region))+
  geom_jitter()

#Analysis of the graphs:
#The graphs do tell different stories.
#The bar plot of the average population observations conveys that the average population sizes are very similar for all regions.
#The scatterplot conveys that there the distribution of observations is not the same.
#While the averages might be similar, the east and west regions have very large spreads and the north region has a small spread.
#The south region is skewed to both extreme ends with few observations in the middle.
#These differences in distributions are removed when only the average population is displayed.