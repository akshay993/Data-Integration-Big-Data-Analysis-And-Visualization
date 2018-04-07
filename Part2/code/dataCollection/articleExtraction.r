library('RCurl')
library('XML')
library(Rcrawler)
library(stringr)

## Read all articles collected so far
setwd("../../Data/NYTimes")
Articles <- read.csv("NYTimes_Articles_Total")
Articles <- subset(Articles, select = -c(X))
setwd("../../code/dataCollection")

#Rcrawler(Website = "https://www.nytimes.com/aponline/2018/03/20/world/europe/ap-eu-britain-facebook-cambridge-analytica-the-latest.html", no_cores = 4, no_conn = 4, ExtractXpathPat = c("//h1","//article"), PatternsNames = c("Title","Content"))

## Using rcrawler to extract the article from URL (present in "Articles")
## try is used for error handling
## A total word count is done on the article to elimninate duplicates

for (i in c(1:200)){
  if (i==1){
    try(Data<-ContentScraper(Url = toString(Articles$web_url[i]),
                             XpathPatterns =c("//*/p[@class='story-body-text story-content']"),
                             #ExcludeXpathPat = c("//*/header[@id='story-header']",
                             #                    "//*/div[@class='story-interrupter']",
                             #                   "//*/div[@class='story-interrupter']",
                             #                  "//*/footer[@class='story-footer story-content']",
                             #                 "//*/section[@id='related-combined-coverage']",
                             #                "//*/div[@class='reader-satisfaction-survey prompt feedback-prompt story-content hidden']",
                             #               "//*/div[@id='story-meta-footer']"),
                             PatternsName = c("Content"),
                             ManyPerPattern = TRUE))
    content <-data.frame(Data)
    content$Content <- str_replace_all(content$Content, "[^[:alnum:]]", " ")  ## removes special characters
    #wordcount <- length(unlist(strsplit(toString(content$Content[i])," "))) ## gets a count of the number of words in the article
    #content <- cbind(content,wordcount)
    content<-as.vector(t(as.matrix(content)))
    content<-data.frame(paste(content, collapse = ''))
    colnames(content) <- "content"
    wordcount <- length(unlist(strsplit(toString(content$content)," "))) ## gets a count of the number of words in the article
    content <- cbind(content,wordcount)
    
  }
  if (i>1){
    try(Data<-ContentScraper(Url = toString(Articles$web_url[i]),
                             XpathPatterns =c("//*/p[@class='story-body-text story-content']"),
                             #ExcludeXpathPat = c("//*/header[@id='story-header']",
                             #                    "//*/div[@class='story-interrupter']",
                             #                   "//*/div[@class='story-interrupter']",
                             #                  "//*/footer[@class='story-footer story-content']",
                             #                 "//*/section[@id='related-combined-coverage']",
                             #                "//*/div[@class='reader-satisfaction-survey prompt feedback-prompt story-content hidden']",
                             #               "//*/div[@id='story-meta-footer']"),
                             PatternsName = c("Content"),
                             ManyPerPattern = TRUE))
    temp <- data.frame(Data)
    temp$Content <- str_replace_all(temp$Content, "[^[:alnum:]]", " ") ##removes special characters
    temp<-as.vector(t(as.matrix(temp)))
    temp<-data.frame(paste(temp, collapse = ''))
    colnames(temp) <- "content"
    wordcount <- length(unlist(strsplit(toString(temp$content)," "))) ## gets a count of the number of words in the article
    temp <- cbind(temp,wordcount)
    content <- rbind(content,temp)
    
  }
  print(i)
}

## Eliminating duplicates caused by error handling
content = content[!duplicated(content$wordcount),]

## Saving the article extracted
setwd("../../Data")
write.table(content$content,"articlesTotal.txt",col.names = F,row.names = F, quote = F)
setwd("../code/dataCollection")
