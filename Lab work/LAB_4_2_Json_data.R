#remove(list = ls())
library(dplyr)
library(ggplot2)
library(ggthemes)
library(reshape)

#Importing data from a Json file as a data frame

url <- "https://api.themoviedb.org/3/tv/1399?api_key=4bba76a2241491f5bc2f42c7cde87dff"

#Data frame to store the data from Json file
GotJson <- jsonlite::fromJSON(url,flatten = TRUE)

#Storing the Seasons Data Frame from GoTJson as it is a data frame of data frames
movieDBSeasons <- GotJson$seasons

#Removing the season 0 values because it is a documentary
movieDBSeasons <- movieDBSeasons[-1,]



key <- "4bba76a2241491f5bc2f42c7cde87dff"

url <- paste0("https://api.themoviedb.org/3/tv/1399/season/1", "?api_key=", key)
GoTJsonSeason1 <- jsonlite::fromJSON(url, flatten = TRUE)
url <- paste0("https://api.themoviedb.org/3/tv/1399/season/2", "?api_key=", key)
GoTJsonSeason2 <- jsonlite::fromJSON(url, flatten = TRUE)
url <- paste0("https://api.themoviedb.org/3/tv/1399/season/3", "?api_key=", key)
GoTJsonSeason3 <- jsonlite::fromJSON(url, flatten = TRUE)
url <- paste0("https://api.themoviedb.org/3/tv/1399/season/4", "?api_key=", key)
GoTJsonSeason4 <- jsonlite::fromJSON(url, flatten = TRUE)
url <- paste0("https://api.themoviedb.org/3/tv/1399/season/5", "?api_key=", key)
GoTJsonSeason5 <- jsonlite::fromJSON(url, flatten = TRUE)
url <- paste0("https://api.themoviedb.org/3/tv/1399/season/6", "?api_key=", key)
GoTJsonSeason6 <- jsonlite::fromJSON(url, flatten = TRUE)
url <- paste0("https://api.themoviedb.org/3/tv/1399/season/7", "?api_key=", key)
GoTJsonSeason7 <- jsonlite::fromJSON(url, flatten = TRUE)


movieDBRatings <- c()
movieDBRatings[1] <- mean(GoTJsonSeason1$episodes$vote_average)
movieDBRatings[2] <- mean(GoTJsonSeason2$episodes$vote_average)
movieDBRatings[3] <- mean(GoTJsonSeason3$episodes$vote_average)
movieDBRatings[4] <- mean(GoTJsonSeason4$episodes$vote_average)
movieDBRatings[5] <- mean(GoTJsonSeason5$episodes$vote_average)
movieDBRatings[6] <- mean(GoTJsonSeason6$episodes$vote_average)
movieDBRatings[7] <- mean(GoTJsonSeason7$episodes$vote_average)


seasonOneVoteAvg = c(7.543,7.902,7.987,8.462,8.212,8.447,7.953,8.759,8.610)

movieDBRatings <- movieDBRatings*10
GoTwikipedia <- GoTwikipedia[-8,]
GoTwikipedia <- cbind(GoTwikipedia,movieDBRatings)

GoTwikipedia$RT <- substr(GoTwikipedia$`Rotten Tomatoes`,1,2)
GoTwikipedia$Critic <- substr(GoTwikipedia$Metacritic,1,2)

data <- data.frame(GoTwikipedia[,c("Season","RT","Critic","movieDBRatings")])
data$Season <- as.numeric(data$Season)

Molten <- melt(data,id.vars = "Season")
Molten$value <- as.numeric(Molten$value)
ggplot(Molten, aes(x = Season, y = value, colour = variable)) + geom_line() + scale_x_continuous(breaks=c(1:7)) + ylab("Average review %")








