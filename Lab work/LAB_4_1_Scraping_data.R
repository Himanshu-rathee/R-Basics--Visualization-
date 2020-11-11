#Package HTMLTAB
library(htmltab)

url <- "https://en.wikipedia.org/wiki/Game_of_Thrones"

#Scrapping table number 2 (which = 2 )form the Wikipedia page 
seasons <- htmltab(doc = url, which = 2)

#Initializing row names as 1-8 because there are 8 seasons
rownames(seasons) <- c(1:8)

#Scrapping 4 table contents i.e the critics responses
criticResponses <- htmltab(doc = url, which = 4)
rownames(criticResponses) <- c(1:8)

#Factoring season column to merge both data frames into one
seasons$Season <- factor(seasons$Season,levels = c("Season 1","Season 2","Season 3","Season 4","Season 5","Season 6","Season 7","Season 8"),labels = c(1:8))
criticResponses$Season <- factor(criticResponses$Season,levels = c(1:8),labels = c(1:8))

#Merging both the data frames
GoTwikipedia <- merge(seasons,criticResponses,by="Season")

#TRYING TO ADD DATA WITHOUT MERGING 
fakeSeasons <- c(9:100)

#Rep function is used to put the same text over a length of a vector
fakeText <- rep('fake',length(fakeSeasons))

#creating fake data frame with fake data
fake.df.seasons <- data.frame(fakeSeasons,fakeText,fakeText,fakeText,fakeText,fakeText)

#Giving column names of original season data to the fake data frame
names(fake.df.seasons) <- names(seasons)

#Converting the columns of fake df to character
fake.df.seasons$Ordered <- as.character(fake.df.seasons$Ordered)
fake.df.seasons$Filming <- as.character(fake.df.seasons$Filming)
fake.df.seasons$`First aired` <- as.character(fake.df.seasons$`First aired`)
fake.df.seasons$`Last aired` <- as.character(fake.df.seasons$`Last aired`)
fake.df.seasons$`Novel(s) adapted` <- as.character(fake.df.seasons$`Novel(s) adapted`)


fakeReviews <- c(101:192)
fakeScores1 <- as.numeric(round(runif(length(fakeReviews),min=1,max=100)))
fakeScores2 <- as.numeric(round(runif(length(fakeReviews),min=1,max=100)))
fake.df.critics <- data.frame(fakeReviews)
names(fake.df.critics) <- c('Season')
fake.df.critics$'Rotten Tomatoes'<- paste0(fakeScores1, "% (33 reviews)")
fake.df.critics$Metacritic<- paste0(fakeScores2, " (34 reviews)")


seasons$Season <- as.numeric(seasons$Season)
criticResponses$Season <- as.numeric(criticResponses$Season)

seasons <- rbind(seasons, fake.df.seasons)
criticResponses <- rbind(criticResponses, fake.df.critics)

seasons$Season <- factor(seasons$Season, levels = c(1:100), labels = c(1:100))
criticResponses$Season <- as.factor(criticResponses$Season)

library(dplyr)
seasons <- sample_n(seasons, size = nrow(seasons))
criticResponses <- sample_n(criticResponses, size=nrow(criticResponses))

GoTWikipediaMerge <- merge(seasons, criticResponses, by="Season")


# API KEY 4bba76a2241491f5bc2f42c7cde87dff

