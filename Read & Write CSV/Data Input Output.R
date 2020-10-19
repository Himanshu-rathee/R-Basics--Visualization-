library(readxl)
library(xlsx)
write.csv(mtcars,file = "example.csv")
rd <- read.csv("My_example.csv")
wr <- read.csv("example.csv")
print(head(wr))
print(rd)

df <- read_excel("Sample_Sales_Data.xlsx",sheet = "Sheet1")
print(head(df))
entire.workbook <- lapply(excel_sheets("Sample_Sales_Data.xlsx"),read_excel,path="Sample_Sales_Data.xlsx" )
print(head(entire.workbook))

write.xlsx(mtcars,"output_test.xlsx")

