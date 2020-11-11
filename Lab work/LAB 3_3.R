library(ggplot2)
library(ggthemes)
library(scales)
library(dplyr)
library(Amelia)
library(mice)

#Reading Csv file into a dataframe
titanicdata <- read.csv("train.csv",header = T,na.strings = "",stringsAsFactors = T)

#Removing Cabin data because it has too many missing values
titanicdata <- titanicdata[,-11]

ggplot(titanicdata, aes(x = Sex, fill = factor(Survived)))+
      geom_bar(stat = 'count',position = 'dodge') +
      labs( x = 'Sex')+ theme_few()
