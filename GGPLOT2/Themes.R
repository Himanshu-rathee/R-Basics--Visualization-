library(ggplot2)

#Sets the theme for all the plots
#theme_set(theme_minimal())
pl <- ggplot(mtcars,aes(x = wt,y = mpg)) + geom_point()

pl1 <- pl + theme_dark()

pl1