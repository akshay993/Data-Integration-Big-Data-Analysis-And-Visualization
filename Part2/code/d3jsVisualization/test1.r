library(reshape2)
library(jsonlite)
library(hashmap)
a<-read.table("tweets.csv")
write.csv(a,"tweets.txt", row.names = F)

colnames(a) <- c("text","size")
##a <- a[3:14,]
words <- toJSON(a, dataframe = "rows", simplifyDataFrame = simplifyVector, auto_unbox = TRUE)
save(words, file="export.JSON")


datasetres <- a[,1:3]
write("var addressPoints = [",file="Data/output.txt")
for(i in 1:nrow(datasetres)){
  write(paste("[",datasetres[i,]$lat,",", datasetres[i,]$lon,", \"", datasetres[i,]$var1.pred, "\" ],",sep=''),file="Data/output.txt",append=TRUE)
}