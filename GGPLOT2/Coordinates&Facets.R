library(ggplot2)

pl <- ggplot(mpg,aes(x = displ, y = hwy))  + geom_point()

#COORDINATES
#Coord_Cartesian allows us to set the x and y limits
pl1 <- pl + coord_cartesian(xlim = c(1,4), ylim = c(15,30))

#Aspect ratio of the graph is fixed by coord_fixed where ratio determines
# the x to y ratio
pl2 <- pl1 + coord_fixed(ratio = 1/3)


#FACETS
#. dot means all the other columns used in the graph facet_grid ( y ~ x)

pl3 <- pl + facet_grid(.~cyl)
pl4 <- pl + facet_grid(drv ~cyl)
pl4