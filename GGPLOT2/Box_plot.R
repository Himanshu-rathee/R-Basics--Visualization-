library(ggplot2)

df <- mtcars

#Box plot takes categorical data and not continuous data so cyl is factored
pl <- ggplot(df,aes(x = factor(cyl), y = mpg))

#Simple boxplot
print(pl + geom_boxplot())

#boxplot with coordiantes flipped
print(pl + geom_boxplot()+ coord_flip())

#using column values to fill colour 
print(pl + geom_boxplot(aes(fill=factor(cyl))))