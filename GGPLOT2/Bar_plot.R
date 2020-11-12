library(ggplot2)

df <- mpg

pl <- ggplot(df,aes(x=class))

#color is used for outline colors of bars and fill is used to fill the inside
print(pl + geom_bar(color="blue",fill="blue"))

#Filling bars with the column drv
print(pl + geom_bar(aes(fill=drv),position = "dodge"))