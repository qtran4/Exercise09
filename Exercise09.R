library('ggplot2')

##task 1
data_1 <- read.table("data_for_task_1.txt",header = TRUE,sep = "\t")
ggplot(data = data_1,
       aes(x = x, y = y)) +
  geom_point() +
  stat_smooth(method="loess")

##task 2
#barplot of the means of the four populations
data_2 <- read.table("data.txt",header = TRUE,sep = ",")
ggplot(data_2, aes(x = region, y = observations)) +
  stat_summary(fun.y = mean,
               geom = "bar")
#scatter plot of all of the observations
ggplot(data = data_2,
       aes(x = region, y = observations)) +
       geom_jitter()
#Do the bar and scatter plots tell you different stories? Why?
#Yes, they do. The bar plot shows the mean of each group, which helps us to 
#know about the overall value and central tendency of them; the scatter plot 
#shows the distribution of data inside the group.