#Matrix training exercise solutions
#1
A <- c(1,2,3)
B <- c(4,5,6)
test.mat <- rbind(A,B)
print(test.mat)
#2
mat <- matrix(1:9,nrow=3)
print(mat)
#3
print(is.matrix(mat))
#4
mat2 <- matrix(1:25,byrow=T,nrow=5)
print(mat2)
#5
print(mat2[2:3,2:3])
#6
print(mat2[4:5,4:5])
#7
print(sum(mat2))
#8
rmat <- matrix(data = runif(20,min=1,max=100),nrow = 4)
print(rmat)