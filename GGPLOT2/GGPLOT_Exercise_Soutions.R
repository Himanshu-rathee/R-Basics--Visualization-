#GGPLOT 2 Exercise Solutions
library(ggplot2)

#1Histogram of hwy mpg values:
#S1

s1 <- ggplot(mpg,aes(x = hwy)) + geom_histogram(fill="orange")
print(s1)

#Barplot of car counts per manufacturer with color fill defined by cyl count
#S2
s2 <- ggplot(mpg,aes(x= manufacturer)) + geom_bar(aes(fill=factor(cyl)))
print(s2)

#Create a scatterplot of volume versus sales. Afterwards play around with alpha and color arguments to clarify information.
#Dataset is txhousing
#S3
s3 <- ggplot(txhousing,aes(x=sales,y=volume)) + geom_point(color="blue",alpha=0.4)
print(s3)

#Add a smooth fit line to the scatterplot from above. Hint: You may need to look up geom_smooth()
#S4

s4 <- s3 + geom_smooth(aes(color="red"))
print(s4)
