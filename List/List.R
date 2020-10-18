v <- c(1,2,3,4,5)
mat <- matrix(1:9,nrow=3)
df <- mtcars
my.list <- list(sample.v = v, sample.m = mat, sample.d = df)
print(my.list)
print(my.list[1])
print(my.list$sample.m)
print(my.list["sample.m"])