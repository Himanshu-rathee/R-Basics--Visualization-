#USE OF PIPE OPERATOR
library(dplyr)

df<-mtcars

#DATA %>% operation1 %>% operation 2 %>% operation 3
result <- df %>% filter(mpg>20) %>% sample_n(size=5) %>% arrange(desc(mpg))
print(result)