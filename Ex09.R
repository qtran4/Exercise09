#Exercise 09

#Set the working directory and load packages
setwd("/Users/bethoceguera/Documents/PhD Year 1/First Semester/Introduction to Biocomputing/Exercises/Exercise09")
library(ggplot2) #To load ggplot package
library(cowplot) #To load cowplot package

# 1. Write a script that loads this text file and produces a scatter plot of those two variables that inlcudes a trendline
stats <- read.csv("local-authority-statistics-june-2022-quarter.csv")

localAuthority <- ggplot(data=stats,aes(x=Period,y=Data_value,))+
  geom_point()+
  xlab("Year")+ylab("Dollars")+
  ggtitle("Local Authority Financial Statistics")+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))+
  geom_smooth(method="lm")

localAuthority
  
# 2. Write a script that generates two figures that summarize the data 

# First, show a barplot of the means of the four populations
data <- read.csv("data.txt") #Load Data
northData <- data[data$region=="north",] #North region data
eastData <- data[data$region=="east",] #East region data
southData <- data[data$region=="south",] #South region data
westData <- data[data$region=="west",] #West region data

northMean <- mean(northData$observations) #Mean of North Data
eastMean <- mean(eastData$observations) #Mean of East Data
southMean <- mean(southData$observations) #Mean of South Data
westMean <- mean(westData$observations) #Mean of West Data

SummTable <- data.frame(Region=c("North","East","South","West"),
  Mean=c(northMean,southMean,eastMean,westMean)) #Summary Table

barplot <- ggplot(data=SummTable,aes(x=Region,y=Mean))+
  geom_bar(stat = "identity")+
  theme_bw()+theme_classic()+ 
  xlab("Region")+ylab("Means")             #Variable of barplot of means

barplot #Shows the result

#Second, show a scatter plot of all the observations 
scatterplot <- ggplot(data=data,aes(x=region,y=observations))+
  geom_jitter()+
  theme_bw()+theme_classic()+
  xlab("Region")+ylab("Observations")      #Variable of scatter plot of all observations

scatterplot #Shows the result

#Plot both together
fig <- plot_grid(barplot,scatterplot,labels=c("a","b"),rel_widths=c(1,1),ncol=2,nrow=1)
fig #Shows the resultant 2 graphs adjacent to each other 

#Do the bar and scatter plots tell you different stories? Why?
#   The bar and scatter plots do tell different stories.
#   The bar chart is rather limited in that it only tells the mean values of each region
#     while not showing distribution of values.
#   Conversely, the scatter plot does not account for mean values but does shows the significant
#     distribution that exists among the values. Although knowing the mean may be helpful,
#     the bar graph doesn't showcase that observation values can go as high as 30+ or as low as 1-. 

##DONE
