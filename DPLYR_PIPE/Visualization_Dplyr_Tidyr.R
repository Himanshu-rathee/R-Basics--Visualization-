# INSTALL DIPLYR 
#install.packages("dplyr")
library(dplyr)
#Install a package nycflights13
#install.packages("nycflights13")
library(nycflights13)

#Printing the nycflights data
print(head(flights))

#Using filter function
#Filtering and printing the data
print(head(filter(flights,month==11,day==3,carrier=="AA")))

#Slice function
print(slice(flights,1:10))

#Arrange function 
#pass the data and then the order by which you want to arrange it
print(head(arrange(flights,year,month,day,arr_time)))

#To arrange in descending order 
print(head(arrange(flights,year,month,day,desc(arr_time))))

#Selecting data from a data frame

print(head(select(flights,carrier)))

#Rename function to rename columns
#New column name == old column name
print(rename(flights,airline_carrier = carrier))

#Distinct function used to give only distinct values
distinct(select(flights,carrier))

#Mutate a new column into the data frame
print(head(mutate(flights,new_col=arr_delay*dep_delay)))

#Transmutate will return only the new column created
transmute(flights,new_col=arr_delay*dep_delay)

#Summarise function
print(summarise(flights,avg_air_time=mean(air_time,na.rm = T)))

#Return random sample from the dataframe
#returns 10 random rows from flight data
sample_n(flights,10)


