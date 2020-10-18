#1
Age <- c(22,25,26)
Weight <- c(150,165,120)
Sex <- c('M','M','F')
new.df <- data.frame(Age,Weight,Sex)
row.names(new.df) <- c("Sam","Frank","Amy")
print(df)

#2
print(is.data.frame(mtcars))

#3
mat <- matrix(1:25,nrow = 5,byrow = F)
df2 <- as.data.frame(mat)
print(df2)

#4,5
df <- mtcars
print(df[1:6,])

#6
print(mean(df$mpg))

#7
print(subset(df,cyl==6))

#8
print(df[,c("am","gear","carb")])

#9,10
df$performance <- round(df$hp/df$wt , digits = 2)
print(head(df))

#11
print(df["Hornet Sportabout","mpg"])

      