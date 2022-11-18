library(ggplot2)
#Question1
averagesalary<-read.table("AgetoSalary.txt",header=TRUE,sep="\t",stringsAsFactors=FALSE)
ggplot(data = averagesalary, aes(x=Age,y=Salary))+
  geom_point()+
  stat_smooth(method="lm")
  theme_classic()
#Question2
data=read.table("data.txt",header=TRUE,sep=",",stringsAsFactors=FALSE)
## Barplot of the means of the two populations
ggplot(data, aes(x=region, y=observations, fill=as.factor(region))) +
  stat_summary(geom="bar", fun="mean") +
  xlab("Regions") +
  ylab("Average # of Observations")+
  theme_bw()

##Scatterplot of all of the observations
ggplot(data = data, aes(x=region, y=observations))+
  geom_point() +
  geom_jitter()+
  theme_bw()
#Stories of the Scatterplot vs Bar Plot: The bar plot makes it seem like there are a fairly similar amount of average observations, but the 
# scatter plot shows that there are vastly different distributions for the observations in different regions