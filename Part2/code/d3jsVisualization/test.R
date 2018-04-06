library(rjson)
library(jsonlite)
a<- read.csv("word.csv")


colnames(a) <- c("text","size")
a<-toJSON(a,dataframe ="values")
write(a,"word.json")
