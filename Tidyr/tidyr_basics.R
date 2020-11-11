#TIDYR
#install.packages('tidyr')
#install.packages('data.table')

library(tidyr)
library(data.table)

comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9,min=0,max=100)
q2 <- runif(9,min=0,max=100)
q3 <- runif(9,min=0,max=100)
q4 <- runif(9,min=0,max=100)

df <- data.frame(comp=comp,year=yr,Qtr1=q1,Qtr2=q2,Qtr3=q3,Qtr4=q4)

#Using Gather function to gather the results from different columns 
#as key values into two columns

g <- gather(df,Quarter,Revenue,Qtr1:Qtr4)
print(g)

#Spread function is opposite of gather
s <- spread(g,Quarter,Revenue)
print(s)

dff <- data.frame(new.col=c(NA,"a-x","b-x","c-x"))
#Separate one column values into two different columns
ss <- separate(data=dff,col = new.col,into = c("ABC","XYZ"),sep = "-")
print(ss)

#Unite function is used to unite two columns into one
u <- unite(ss,new.joined.col,ABC,XYZ, sep = "---")
print(u)
