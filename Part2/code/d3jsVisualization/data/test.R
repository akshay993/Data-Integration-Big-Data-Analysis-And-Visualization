a <- read.table("tweetdata_top50.csv")
colnames(a) <- c("name", "count")
write.csv(a,"co_tweets_top50.csv", row.names = F)
