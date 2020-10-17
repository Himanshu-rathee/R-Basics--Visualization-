# Simple matrix creation
goog <- c(450,400,500,350,550)
msft <- c(250,300,200,150,100)
days <- c("MON","TUE","WED","THU","FRI")
stock.name <- c("GOGGLE","MICROSOFT")
stock.vector <- c(goog,msft)
stock.matrix <- matrix(stock.vector,byrow = T,nrow = 2)
colnames(stock.matrix) <- days
row.names(stock.matrix) <- stock.name
print(stock.matrix)



