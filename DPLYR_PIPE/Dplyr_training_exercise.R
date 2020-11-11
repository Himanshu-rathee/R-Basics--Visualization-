library(dplyr)

df <- mtcars

#1Return rows of cars that have an mpg value greater than 20 and 6 cylinders.

s1 <- filter(df,mpg>20,cyl==6)
print(s1)

#2Reorder the Data Frame by cyl first, then by descending wt.

s2 <- arrange(df,cyl,desc(wt))
print(s2)

#3Select the columns mpg and hp
 s3 <- select(df,mpg,hp)
 print(s3)

 #4Select the distinct values of the gear column.
 s4 <- distinct(df,gear)
 print(s4)

 #5Create a new column called "Performance" which is calculated by hp divided by wt.
 mutate(df,Performance=hp/wt)
 
 #6Find the mean mpg value using dplyr.
 
s6 <- summarise(df,avg_mpg=mean(mpg,na.rm = T))
print(s6) 


#7Use pipe operators to get the mean hp value for cars with 6 cylinders.

s7 <- df %>% select(cyl==6) %>% mean(hp)
