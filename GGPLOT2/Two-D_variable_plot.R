library(ggplot2)
library(ggplot2movies)

pl <- ggplot(movies,aes(x =year,y = rating))

#Binwidth by default is (1,1)
#in bin2d data is shown by rectangles bins
pl2 <- pl + geom_bin2d(binwidth=c(3,1))


#Scale_fill_gradient is used to change the colour giving different color
# to high and low values
pl3 <- pl2 + scale_fill_gradient(high = "red",low = "blue")

#install.packages("hexbin")
#Data is showed as hexagonals
pl4 <- pl + geom_hex()


pl5 <- pl + geom_density2d()
pl5
