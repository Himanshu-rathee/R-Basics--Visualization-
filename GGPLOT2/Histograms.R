#HISTOGRAM
#install.packages("ggplot2.movies")  the data set to work on

library(ggplot2)
library(ggplot2movies)

#DATA AND AESTHETICS HISTOGRAM
pl <- ggplot(data = movies , aes(x = rating))

#GEOMETRY
#Alpha for transparency, binwidth for width of the bins
pl1 <- pl + geom_histogram(binwidth = 0.1,color="red",fill="pink",alpha=0.4)

#Label the x and y axis, Also title the graph
pl2 <- pl1 + xlab("Movie Rating") + ylab("Count") + ggtitle("MY TITLE")
print(pl2)

#Way to get the colour of histogram as per the values
pl4 <- pl + geom_histogram(binwidth = 0.1,aes(fill=..count..))
print(pl4)