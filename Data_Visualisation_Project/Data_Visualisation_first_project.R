library(ggplot2)


file_name <- "Economist_Assignment_Data.csv"
#Read file and store the data into dataframe df, drop is used to drop the first column
df <- fread(file_name,drop = 1)

pl <- ggplot(df,aes(x=CPI,y=HDI)) + geom_point(aes(color=Region),shape=1,size=2)

pl1 <- pl + geom_smooth(aes(group=1),method = "lm",formula = y~log(x),se = F,color="red")


pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")


pl2 <- pl1 + geom_text(aes(label = Country), color = "gray20", 
      data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

#Breaks set what values we want to be displayed on the axis and limits sets the limit of the axis
pl3 <- pl2 + scale_x_continuous(name="Corruption Perceptions Index,2011 (10=Least corrupt)",
            limits = c(0.9,10.1) , breaks = 1:10)


pl4 <- pl3 + scale_y_continuous(name="Human Development Index, 2011 (1=Best)",
              limits = c(0.1,1.1), breaks = c(0.2,0.4,0.6,0.8,1))

#ggtitle is used for giving the graph a title
pl5 <- pl4 + ggtitle("Corruption and Human Development")

pl4
