# Hayden Gallo
# Intro to Biocomputing
# Exercise 09

library(ggplot2)

# Problem 1
#1. Find some data on two variables that you would expect to be related to each other.
#These data can come from your own research, your daily life, or the internet.
#Enter those data into a text file or Excel and then save a text file, and write a script
#that loads this text file and produces a scatter plot of those two variables that includes a trend line.

baseball_data <- read.table('baseball_data.txt',header = TRUE, sep = '\t')

ggplot(data = baseball_data, aes(x = H, y = R)) + geom_point() + geom_smooth(se = FALSE, method ='lm') +
        xlab('Hits') + ylab('Runs') + ggtitle('Hits vs. Runs for Professional Baseball Teams')


# Problem 2
# 2. Given the data in “data.txt”. Write a script that generates two figures that sumamrize the data.
# First, show a barplot of the means of the four populations. Second, show a scatter plot of all of the observations.
# You may want to “jitter” the points (geom_jitter()) to make it easier to see all of the observations
# within a population in your scatter plot. Alternatively, you could also try setting the alpha argument
# in geom_scatterplot() to 0.1. Answer the following questions as a comment in your R script - Do the bar
# and scatter plots tell you different stories? Why?

data <- read.table('data.txt', header = TRUE, sep = ',')

data.mean <- aggregate(observations ~ region, data, mean)

ggplot(data.mean, aes(x = region, y = observations)) + geom_bar(stat = 'identity') + ggtitle('Mean of Each of the Four Populations')

ggplot(data = data, aes(x = region, y = observations)) + geom_point() + ggtitle('Region vs Observation Value') + geom_jitter()

# Yes, the bar and scatter plots definitely tell different stories. The bar plot shows that the averages
# of the populations are very close to one another, but based on the scatterplot, the spread of the data
# for each of the populations is very different, so it shows that the populations are made up of very different
# observation values but just happen to have means close to one another.
