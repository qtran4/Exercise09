# exercise 09
setwd("/Users/theresereisch/Desktop/Exercise09")
## question 1
## find some data on two variables that you would expect to be related to each other
## these data can come from your own research, your daily life, or the internet
## enter those data into a text file or excel and then save a text file
## write a script that loads this text file and produces a scatter plot of those two variables that includes a trend line
heightWeight <- read.csv("/Users/theresereisch/Downloads/height_weightdata.csv")

ggplot(heightWeight, aes(x=height..in.inches., y=weight..in.lbs.)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Height (inches)") +
  ylab("Weight (lbs)")

## question 2
## given the data in "data.txt"
data <- read.csv("data.txt")
## write a script that generates two figures that summarize the data
## first show a barplot of the means of the four populations
### find the means of the observations first

North <- mean(data[data$region=="north",2])
South <- mean(data[data$region=="south",2])
East <- mean(data[data$region=="east",2])
West <- mean(data[data$region=="west",2])
avgdata <- data.frame(region=c("North", "South", "East", "West"), average=c(North, South, East, West))

ggplot(avgdata, aes(x = region, y = average)) +
  geom_bar(stat="identity") +
  theme_bw() +
  xlab("Region")
  
## second show a scatter plot of all of the observations
## you may want to 'jitter' the points (geom_jitter()) to make it easier to see all of the observations within a population in your scatter plot
## alternatively you could also try setting the alpha argument in geom_scatterplot() to 0.1

ggplot(data, aes(x=region, y = observations)) +
  geom_jitter() +
  xlab("Region")

## answer the following questions as a comment in your R script
## do the bar and scatter plots tell you different stories? why?
### The bar plot shows that the observations across the four regions are very similar, whereas the scatterplot shows more of an in-depth look at the distribution of the observations. This is partially due to the fact the the barplot is displayng the means of the observations rather than the actual data itself, whereas the scatterplot is showing the full dataset. 

