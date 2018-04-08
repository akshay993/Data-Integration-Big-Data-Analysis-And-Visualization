library(rtimes)

Start_Date <- "20180320"
End_Data <- "20180321"

## Setting up Authentication
Sys.setenv(NYTIMES_AS_KEY = "fa567ce571174336957fc6786b4dc91e")

## Collecting of articles
DF <- as_search(q = "delete","facebook", begin_date = Start_Date, end_date = End_Data, all_results = TRUE)

## Pre- processing ( removing duplicates)
Data <- DF$data
Data <- subset(Data, select = -c(multimedia, keywords, byline.person))
Data = Data[!duplicated(Data$`_id`),]
Data = Data[!duplicated(Data$snippet),]
Data = Data[!duplicated(Data$word_count),]

## Saving the articles collected for the day
setwd("../../Data/NYTimes")
Name=paste("NYTimes","- Collected" ,nrow(Data)," articles on :",Sys.time())
write.csv(Data, Name) 
setwd("../../code/dataCollection")

## Read all articles collected so far
setwd("../../Data/NYTimes")
Articles <- read.csv("NYTimes_Articles_Total")
Articles <- subset(Articles, select = -c(X))
names(Articles)[names(Articles) == 'X_id'] <- '_id'

## Merge collected articles with existing articles and saving a consolidated csv file 
Articles <- rbind(Articles,Data)
Articles = Articles[!duplicated(Articles$`_id`),]
Articles = Articles[!duplicated(Articles$snippet),]
Articles = Articles[!duplicated(Articles$word_count),]
write.csv(Articles, "NYTimes_Articles_Total") 
setwd("../../code/dataCollection")



