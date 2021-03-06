##rm(list =ls())
#### Code to collect tweets##
## All tweets collected are filter and appended to csv files in data folder automatically

library(twitteR)
library(ggplot2)
library(ggmap)
library(data.table)
library(stringr)
library(qdapRegex)

Start_date <- "2018-03-01"
End_date <- "2018-04-06"
## Setup oauth
setup_twitter_oauth("VxJ6qp5XL3VTclBzMBsD1Ez1A", 
                    "owezT5IVRVG8nvkSHXxqq4t2McwPO6mxesJTGU2549yHTJbP8m", 
                    "340449785-0AWt3nkBVvLlX7hbUFLl0fEqIKs47qUU7V5UnFWH", 
                    "qnaD0Pyp9jUXfwVb82RlSKikuvVi2MAWxp1J0mD1Fle4d")

                                    ############## Collection of Tweets ###################
## Searching for tweets ##
search.string <- c("#deletefacebook")
no.of.tweets <- 100
tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en", since= Start_date , until = End_date)

## Conversion of searched tweets to Data frame
tweets <- twListToDF(tweets)

## Saving collected data to a csv file - only the tweets collection this session
setwd("../../Data/Twitter")
Name=paste("Twitter -", no.of.tweets," Tweets Collected on :",Sys.time())
write.csv(tweets, file = Name)
setwd("../../code/dataCollection")


# Reading all tweets collected so far
Tweets_Collected=read.csv("../../Data/Twitter/Tweets_Collected")
Tweets_Collected<- subset(Tweets_Collected, select = -c(X)) #removing column named X
temp <- Tweets_Collected

# Creating a consolided data frame of all the tweets collected so far
Tweets_Collected <- rbind(Tweets_Collected,tweets) 
Tweets_Collected = Tweets_Collected[!duplicated(Tweets_Collected$id),]

# Saving all consolidated Tweets Collected to a csv file - before preprocessing
setwd("../../Data/Twitter")
write.csv(Tweets_Collected, file = "Tweets_Collected")  
setwd("../../code/dataCollection")

Tweets_Collected = Tweets_Collected[!duplicated(Tweets_Collected$text),]

## Remove non- ASCII characters, hastags (#xxxxx) used in tweet search, tags(@xxxxxx) and other special characters
Tweets_Collected_prepocessed <- data.frame(iconv(Tweets_Collected$text, "latin1", "ASCII", sub=""))
Tweets_Collected_prepocessed <- rm_url(Tweets_Collected_prepocessed$iconv.Tweets_Collected.text...latin1....ASCII...sub......)
Tweets_Collected_prepocessed <- sub("#\\w+ *", "", Tweets_Collected_prepocessed)
Tweets_Collected_prepocessed <- data.frame(sub("@\\w+ *", "", Tweets_Collected_prepocessed))
Tweets_Collected_prepocessed <- data.frame(gsub("RT", "", Tweets_Collected_prepocessed$sub.....w..........Tweets_Collected_prepocessed.)) 
Tweets_Collected_prepocessed <- data.frame(str_replace_all(Tweets_Collected_prepocessed$gsub..RT.......Tweets_Collected_prepocessed.sub.....w..........Tweets_Collected_prepocessed..,
                                                "[^[:alnum:]]", " "))
colnames(Tweets_Collected_prepocessed) <- c("content")
## Saves all tweets collected to a csv file - After PreProcessing
setwd("../../Data")
write.table(Tweets_Collected_prepocessed$content, file = "tweetsTotal.txt", sep="\t", col.names = F, row.names = F, quote = F)  
setwd("../code/dataCollection")

