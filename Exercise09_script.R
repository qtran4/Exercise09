#Assumes working directory is set to Exercise09 directory

library(ggplot2)
library(cowplot)

#1

#loads txt file
q1_data <- read.table("q1_data.txt", header=TRUE, sep="\t")

#generates scatterplot with trendline
ggplot(q1_data, aes(x = Height, y = Weight)) +
  geom_point() +
  xlab("Height (ft)") +
  ylab("Weight (lbs)") +
  stat_smooth(method="lm") +
  theme_classic()

#2

#loads txt file
q2_data <- read.table("data.txt", header=TRUE, sep=",")

#generates barplot showing the mean observations for each region
ggplot(q2_data, aes(x=region,y=observations, fill=region)) +
  stat_summary(fun=mean, geom= "bar") +
  xlab("Region") +
  ylab("Average Observations") +
  theme_classic()

#generates scatterplot showing observations for each region
ggplot(q2_data, aes(x=region,y=observations, color=region)) +
  geom_jitter() +
  xlab("Region") +
  ylab("Observations") +
  theme_classic()

#The scatterplot and barplot do tell different stories. The barplot makes it seem like
#the observations are the same in all regions. However, looking at the scatterplot,
#we can see that the distribution of observations varies quite a bit between regions.
#For example, in the east there is a wide range of observations. In the north, the range
#of observations is small, yet the average is the same as the other regions. In the south,
#there seems to be two clusters of groups, a high and low obervation cluster. The west
#also showed a wide distribution of values.
