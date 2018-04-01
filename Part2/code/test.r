library('RCurl')
library('stringr')
library('XML')

## Read all articles collected so far
setwd("../Data")
Articles <- read.csv("NYTimes_Articles_data")
Articles <- subset(Articles, select = -c(X))


text <- Articles$Content[1]
text <- data.frame(text)

setwd("../Data")
#write.table(text, "NYTimes_Test_Data_Article1.txt")
write.table(text, "NYTimes_Test_Data_Article1.txt",sep="\t",row.names=FALSE, col.names = FALSE)
