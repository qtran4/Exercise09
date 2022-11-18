# BIOS 30318 Biocomputing -- Plotting data
# G Andreasen
# 11 18 2022

library(ggplot2)
library(cowplot)

setwd("~/Documents/Courses/Biocomputing_BIOS_60318/Tutorials/Exercise09")

# Data from Bartel et al. 2005 "Mammal abundance indices in the northern 
# portion of the Great  Basin"
# <https://www.esapubs.org/archive/ecol/E086/172/default.htm#data>
# Indices of abundance of selected mammals were obtained for two study areas 
# within the Great Basin: the Idaho National Engineering and Environmental 
# Laboratory, Idaho, (INEEL) and Curlew Valley, (CV) Utah, USA.  Data collection 
# occurred biannually 1962–1993, with varying durations among species and sites.  
mammals <- read.table(file = "Mammal_abundance_indices.txt", 
	sep = '\t', header = TRUE)

# "-999 denotes no data collected given appropriate season"
# Let's replace -999 with 'NA'
mammals[mammals == -999] <- NA

# Problem 1: scatter plot w/ trend line
# Let's assume a correlation between the number of coyotes (Canis) in the CV 
# region and the number of rabbits (Lepus) in the CV region.
ggplot(data = mammals, 
       aes(x = CV.Canis, y = CV.Lepus, color = Season)) +
  geom_point() +
	xlab("No. of coyotes in CV") + 
  ylab("No. of rabbits in CV") +
	scale_color_manual(values = c("orange", "yellowgreen")) +
  stat_smooth(method="lm") +
	theme_classic()


# Problem 2: data.txt plots -- barplot and scatter
data <- read.delim(file = "data.txt", sep = ',', header = TRUE)

# Calculate the means
data_means <- aggregate(data[, 2], list(data$region), mean)
# Rename the columns
colnames(data_means) <- c("region", "observation_mean")

# Barplot time
ggplot(data = data_means, 
			 aes(x = region, y = observation_mean, fill = region)) +
	geom_bar(stat = "identity") +
	xlab("Region") +
	ylab("Mean observation")

# Scatterplot time
ggplot(data = data,
			 aes(x = region, y = observations, color  = region)) +
	geom_point() +
	geom_jitter(width = 0.25) +
	xlab("Region") +
	ylab("Observations")

# Do the bar and scatter plots tell you different stories? Why?
# They do. In it's nature, the bar plot can only show you one value - in our 
# case, the mean - unless you add error bars. While this is informative, it 
# does not depict the breadth and variability in the data -- unlike a 
# scatterplot. The bar plot minimizes the data to one value, while the 
# scatterplot shows the variability in the data. 
# When looking at the barplot, there seems to be very little difference in the
# data. However, looking at the scatterplot, we can see the huge distribution
# of data points in east compared to north, as well as the weird split in 
# observations in the south region. It's also easier to see the lack of 
# natural distribution in the data points in the west region.

