library(ggplot2)
library(ggthemes)
library(scales)
library(dplyr)
library(Amelia)
library(mice)

#Reading Csv file into a dataframe
titanicdata <- read.csv("train.csv",header = T,na.strings = "",stringsAsFactors = T)

#Getting all the NA values from Age column 
idx_na <- is.na(titanicdata$Age)

#Initializing training data as all values but not null values of Age column
age_train <- titanicdata[!idx_na,]

#Intializing the test data as all values which are NA in Age column
age_test <- titanicdata[idx_na,]

#Initializing out linear model 
#age_model <- lm(Age~Pclass+Survived+SibSp , data = age_train)
age_model <- lm(Age~Survived+Pclass+SibSp+Embarked , data = age_train)
age_test$Age <- predict(age_model,newdata=age_test)

imputedAgeLM <- titanicdata
imputedAgeLM[imputedAgeLM$PassengerId %in% age_test$PassengerId, "Age"] <- age_test$Age
imputedAgeMean <- titanicdata$Age
imputedAgeMean[is.na(imputedAgeMean)] <- median(imputedAgeMean, na.rm = T)

#Dealing with missing data by Mice Package in which each incomplete variable is calculated by a separate model
mice_mod <- mice(titanicdata[,!names(titanicdata) %in% c("PassengerId","Name","Ticket","Cabin","Survived")],method="rf")
mice_output <- complete(mice_mod)

#Converts the plot area into 4 slices
par(mfrow=c(2,2))

#handling the error that figure margins are too large
par(mar=c(1,1,1,1))

#Plotting Histograms
hist(titanicdata$Age, freq=F, main='Age: Original', col='red', ylim=c(0,0.04))
hist(imputedAgeMean, freq=F, main='Age: Imputed Age Mean', col='blue', ylim=c(0,0.04))
hist(imputedAgeLM$Age, freq=F, main='Age: Imputed Age LM', col='green', ylim=c(0,0.04))
hist(mice_output$Age, freq=F, main='Age: MICE Output', col='orange', ylim=c(0,0.04))


