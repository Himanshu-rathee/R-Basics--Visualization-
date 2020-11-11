#sCATTERPLOTS
library(ggplot2)

df <- mtcars

#DATA AND AESTHETICS

pl <- ggplot(df,aes(x=wt,y=mpg))

#GEOMETRY size is used for size of the dots
pl1 <- pl + geom_point(alpha=0.4,size = 5)
print(pl1)

#Size can be used in aesthetics and can be assigned any column value
pl2 <- pl + geom_point(aes(size = factor(cyl)))
print(pl2)

#Shape can be used for different values in the column
pl3 <- pl + geom_point(aes(shape=factor(cyl),color=factor(cyl)),size = 5)
print(pl3)