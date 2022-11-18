#Problem 1
#Find data on any two variable of interest and plot

soccer<-read.csv("soccer - Sheet1 (2).csv",header=TRUE)
ggplot(soccer, aes(x=Number.of.Matches, y=Avg..Game.Score)) 
+xlab("Number of Matches (Mexico)")+ylab("Mexico's Avg Score")+
  geom_point()+geom_smooth(method=lm)+theme_classic()

#Problem 2
# Creating a scatter plot of region vs number of observations
#make sure to be on the correct wd--> Exercise09

dat<-read.table("data.txt",header=TRUE,stringsAsFactors = FALSE, sep=",")
ggplot(dat, aes(x=region,y=observations))+ geom_jitter(alpha=0.3)
+xlab("Region")+ylab("Observations")

#creating a bar plot
#still using the same data as before
dat<-read.table("data.txt",header=TRUE,stringsAsFactors = FALSE, sep=",")
ggplot(dat, aes(x=region,y=observations))+ stat_summary(geom="bar",fun="mean")+
  xlab("Region")+ylab("Mean Observation")+theme_classic()

#The scatter plot and bar do tell me different stories. The scatter plot shows
#the number of observations for each region. East and West both have observations
#that ranges from 0-30 and some outliers. While North is specific to 10-20 and 
#South is from 4-6 and 18-30. In contrast, the bar graph shows a mean of obser-
#-vations for each region. They all appear to be around 15. As such, there 
# is perhaps some variable that causes makes some observations more spread out
#vs specific in different regions. 



