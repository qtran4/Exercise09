##Exercise 9: Plotting


##Question 1:
#find data on two related variables 
#create data file into txt.
#generate scatterplot of two variables
#include trend line 

#install ggplot package
library(ggplot2)
library(cowplot)

#dataset compares CO2 emission vs years
CO2.data <- read.table("CO2emissions.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
CO2.data

#create scatterplot with trendline
ggplot(CO2.data, aes(x = as.numeric(Year), y = as.numeric(CO2.Emmissions)))  + 
  geom_point() + 
  xlab("Year") + 
  ylab("CO2 Emissions (kilotons)") +
  theme_classic() +
  stat_smooth()


##Question 2:
#write script that generates two figures that summarize the data
#show a barplot of the means of the four populations
#show a scatterplot of the observations
data <- read.csv("data.txt", header=TRUE)
data

#barplot
ggplot(data, aes(x = region, y = observations)) +
  stat_summary(fun.y = mean, geom = "bar") +
  theme_classic() +
  xlab("Region") +
  ylab("Average Observations")

#scatterplot
ggplot(data, aes(x = region, y = observations)) +
  geom_jitter() +
  theme_classic() +
  xlab("Region") +
  ylab("Observations")

##The scatterplot seems to offer a more accurate representation of the spread of the data
##The scatterplot provides information about each observation point and the different densities
##For example, the "South" region has two distinct clumps of data points, 
##a higher density around values 20-30, and a lower density around 5
##The barplot only reveals to us the average observation for each region
##The barplot is a bit deceiving because it shows all the regions having observations around 15,
##however, the scatterplot better reveals to us the variation across each region
