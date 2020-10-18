#creating a dataframe
data() # gives access to all the prebuilt data frames in packages
Days <- c("Mon","Tue","Wed","Thu","Fri")
Temp <- c(23,33,20,25,30)
Rain <- c(F,T,F,T,T)
df <- data.frame(Days,Temp,Rain)
print(df)
print(str(df)) #Description of dataframe
print(summary(df)) #gives summary of dataframe

#Indexing and slicing
print(df$Temp)
print(df[1:3,c("Days","Temp")])
print(df["Days"])
rainy <- subset(df,subset = Rain==T)
print(rainy)
sorted.temp <- order(df["Temp"]) # Ascending order
print(sorted.temp)
print(df[sorted.temp,])
rev.temp <- order(-df$Temp) #Descending order
print(df[rev.temp,])

#Operations 
c1 <- 1:10
c2 <- letters[1:10]
df <- data.frame(col.name.1 = c1, col.name.2 = c2)
print(df)
write.csv(df,file="test.csv")
df2 <- read.csv("test.csv")
print(df2)
df[[2,"col.name.1"]] <- 99
df2 <- data.frame(col.name.1 = "200", col.name.2 = "new")
dfnew <- rbind(df,df2)
df$newcol <- 2*df$col.name.1
print(head(df))
print(df[df$col.name.1>9,])
print(subset(df,col.name.2 == "a"))
