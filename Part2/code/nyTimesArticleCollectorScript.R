library(rtimes)

## Setting up Authentication
Sys.setenv(NYTIMES_AS_KEY = "fa567ce571174336957fc6786b4dc91e")

## Collecting of articles
DF <- as_search(q = "cambridge","analytica" , begin_date = "20180310", end_date = "20180329", all_results = TRUE)

## Pre- processing ( removing duplicates)
Data <- DF$data
Data <- subset(Data, select = -c(multimedia, keywords, byline.person))
Data = Data[!duplicated(Data$`_id`),]
Data = Data[!duplicated(Data$snippet),]
Data = Data[!duplicated(Data$word_count),]

## Saving the articles collected for the day
setwd("../Data/NYTimes")
Name=paste("NYTimes","- Collected" ,nrow(Data)," articles on :",Sys.time())
write.csv(Data, Name) 
setwd("../../code")

## Read all articles collected so far
setwd("../Data")
Articles <- read.csv("NYTimes_Articles_Info")
Articles <- subset(Articles, select = -c(X))
names(Articles)[names(Articles) == 'X_id'] <- '_id'

## Merge collected articles with existing articles and saving a consolidated csv file 
Articles <- rbind(Articles,Data)
Articles = Articles[!duplicated(Articles$`_id`),]
Articles = Articles[!duplicated(Articles$snippet),]
Articles = Articles[!duplicated(Articles$word_count),]
write.csv(Articles, "NYTimes_Articles_Info") 
setwd("../code")



