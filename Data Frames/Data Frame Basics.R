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

