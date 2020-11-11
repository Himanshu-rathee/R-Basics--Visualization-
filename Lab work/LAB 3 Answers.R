library(ggplot2)
library(ggthemes)
library(scales)
library(dplyr)
library(Amelia)
titanicdata <- read.csv("train.csv",header = T,na.strings = "",stringsAsFactors = T)
titanicdata$Survived <- as.factor(titanicdata$Survived)
titanicdata$Pclass <- as.factor(titanicdata$Pclass)
sapply(titanicdata,function(x)sum(is.na(x)))
missmap(titanicdata,main="Missing Values Vs Observed Values")
paste("Passenger ID:",titanicdata[is.na(titanicdata$Embarked),1],"needs to be corrected")
embarked <- titanicdata %>% filter(PassengerId !=62 & PassengerId !=830)
ggplot(embarked,aes(x=Embarked,y=Fare,fill=factor(Pclass)))+geom_boxplot()+geom_hline(aes(yintercept=80),colour="red",linetype='dashed',lwd=2)+scale_y_continuous(labels=dollar_format())+theme_few()
titanicdata$Embarked[c(62,830)] <- "C"
imputed_agemean <- titanicdata[!is.na(titanicdata$Age),"Age"]
hist(titanicdata$Age)
temp <- mean(imputed_agemean)
titanicdata[is.na(titanicdata$Age),"Age"] <- temp
hist(titanicdata$Age)