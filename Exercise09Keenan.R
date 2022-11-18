library(ggplot2)
#Question 1: 
baseball<-read.table('HRvRBI2.txt', header = TRUE)
#This data shows the number of home runs and RBIs for the top 50 home run hitters
ggplot(baseball, aes(x=HR, y=RBI)) + geom_point()+geom_smooth(method = lm, se=FALSE)

#Question 2:
data1 <- read.table('data.txt', header = TRUE, sep = ',')
ggplot(data1, aes(x=region, y=observations)) + geom_bar(stat = 'summary')

ggplot(data1, aes(x=region, y=observations)) + geom_point()+geom_jitter()

#The bar graph and scatter plots show very different stories. While the
#bar graph shows they all have similar means, the scatter plot shows the
#data is different based on region. For example, north is very compact
#whereas east and west are more spread out. South has two separate clusters
#and the mean is not really in either of them