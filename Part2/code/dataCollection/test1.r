setwd("../Data/Day_1/Tweets")

for (i in c(1:nrow(content)))
{
  file_name=paste("March 20th - Article",i)
  write.table(content$Content[1],file_name,  sep="\t", col.names = F, row.names = F)
}


write.table(Tweets_Collected_prepocessed,"March 20 - Tweets",  sep="\t", col.names = F, row.names = F)
