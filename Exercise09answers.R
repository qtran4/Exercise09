#Problem 1
#Find data on any two variable of interest and plot

soccer<-read.csv("soccer - Sheet1 (2).csv",header=TRUE)
ggplot(soccer, aes(x=Number.of.Matches, y=Avg..Game.Score)) 
+xlab("Number of Matches (Mexico)")+ylab("Mexico's Avg Score")+
  geom_point()+geom_smooth(method=lm)+theme_classic()

#Problem 2
# Creating a bar plot 