
s1 <- GoTJsonSeason1$episodes$guest_stars
 s1gender <- c()
 
 for(i in 1:length(s1)){
   tmp <- s1[[i]]
   s1gender <- c(s1gender,tmp$gender)
 }
 s1gender <- factor(s1gender)
 
 
 
 getGender <- function(seasonJson){
   gender <- c()
for(i in 1:length(seasonJson)){
  tmp <- seasonJson[[i]]
  gender <- c(gender,tmp$gender)
}
   return(gender)
 }
 
 
s2gender <- factor(getGender(GoTJsonSeason2$episodes$guest_stars)) 
s3gender <- factor(getGender(GoTJsonSeason3$episodes$guest_stars)) 
s4gender <- factor(getGender(GoTJsonSeason4$episodes$guest_stars)) 
s5gender <- factor(getGender(GoTJsonSeason5$episodes$guest_stars)) 
s6gender <- factor(getGender(GoTJsonSeason6$episodes$guest_stars)) 
s7gender <- factor(getGender(GoTJsonSeason7$episodes$guest_stars)) 



GoTwikipedia['MaleExtras'] <- as.integer(NA)
GoTwikipedia['FemaleExtras'] <- as.integer(NA)



#t <- table(factor(s1gender))
#GoTwikipedia1 <- GoTwikipedia[1,]
#GoTwikipedia[1,12] <- t[3]
#GoTwikipedia[1,13] <- t[2]


genderNumber <- function(t,s){
      tmp <- GoTwikipedia[]
      tmp[s,12] <- t[3]
      tmp[s,13] <- t[2]
      return(tmp)
     
 }



GoTwikipedia <- genderNumber(table(factor(s1gender)),1)
GoTwikipedia <- genderNumber(table(factor(s2gender)),2)
GoTwikipedia <- genderNumber(table(factor(s3gender)),3)
GoTwikipedia <- genderNumber(table(factor(s4gender)),4)
GoTwikipedia <- genderNumber(table(factor(s5gender)),5)
GoTwikipedia <- genderNumber(table(factor(s6gender)),6)
GoTwikipedia <- genderNumber(table(factor(s7gender)),7)


dataG <- data.frame(GoTwikipedia[,c("Season","MaleExtras","FemaleExtras")])

MoltenGender <- melt(dataG , id = 'Season')
finalD <- data %>% group_by(FemaleExtras,MaleExtras)


ggplot(finalD , aes(x=Season,y=MaleExtras,fill = MaleExtras)) +geom_bar(stat = 'identity')

ggplot(data = MoltenGender, aes(x = Season, y = value, colour = variable)) + geom_line() 


#library(tidyr)
#dataG %>% gather(FemaleExtras) %>% ggplot(aes(key,fill=value))+geom_bar(position = 'dodge')





# gender.list <- c(s1gender, s2gender, s3gender, s4gender, s5gender, s6gender, s7gender)
# 
# 
# gender.male <- unlist(lapply(gender.list, FUN = function(x) {
#   length(x[x == 2])
# }))
# 
# 
# gender.female <- unlist(lapply(gender.list, FUN = function(x) {
#   length(x[x == 1])
# }))
# 
# 
# gender.unknown <- unlist(lapply(gender.list, FUN = function(x) {
#   length(x[x == 0])
# }))
# 
# totalExtras <- unlist(lapply(gender.list, FUN = function(x) {length(x)}))
# 
# 
# GoTwikipedia$maleExtras <- gender.male
# GoTwikipedia$femaleExtras <- gender.female
# GoTwikipedia$unknownGenderExtras <- gender.unknown
# GoTWikipedia$totalExtras <- totalExtras


