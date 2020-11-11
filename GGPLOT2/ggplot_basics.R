library(ggplot2)

#DATA
#AESTHETICS
#GEOMETRIES
#FACETS
#STATISTICS
#COORDINATES
#THEMES

#Data and aesthetics and geometry
pl <- ggplot(mtcars,aes(x=mpg,y=hp)) + geom_point()

#Facets and Statistics
pl1 <- pl + facet_grid(cyl~.) +stat_smooth()

#Coordinates and Themes
pl2 <- pl1 + coord_cartesian(xlim=c(20,25)) + theme_bw()

pl2