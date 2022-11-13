# ggplot2 and cowplot load
library(ggplot2)
library(cowplot)

# set up directory
setwd("/Users/7907blueyes/Desktop/Biocomputing/R/Exercise09")

# QUESTION ONE  
# load in data
predationrisk <- read.csv("predationrisk.csv", header = TRUE, stringsAsFactors = FALSE)
# scatter plot with trend line
ggplot(predationrisk, aes(x = Group.Size, y = Predation.Risk)) + geom_point() +
  xlab("Group Size") + ylab("Predation Risk") + stat_smooth(method = "lm")

# QUESTION TWO
# load in data (separated by commas)
data <- read.csv("data.txt", header = TRUE, stringsAsFactors = FALSE)
# calculating mean of averages
avgnorth <- mean(data[data$region == "north",2])
avgsouth <- mean(data[data$region == "south",2])
avgwest <- mean(data[data$region == "west",2])
avgeast <- mean(data[data$region == "east",2])
# saving averages in data frame
avgdata <- data.frame(region = c("north", "south", "east", "west"), average = c(avgnorth, avgsouth, avgeast, avgwest))
# bar plot
ggplot(avgdata, aes(x = region, y = average)) + geom_bar(stat = "identity") + theme_bw()
# scatter plot with observations
ggplot(data, aes(x = region, y = observations)) + geom_jitter()

# Do the bar and scatter plots tell you different stories? Yes, the two graphs tell different 
# stories about the data. In the bar graph, the region averages are incredibly similar leading 
# one to believe that the observations are fairly close. In the scatter plots, it is clear that 
# the observations are concentrated at different points and that the regions are not altogether 
# that similar. 

                                                                 