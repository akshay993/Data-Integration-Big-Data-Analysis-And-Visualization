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
wordcount <- length(unlist(strsplit(toString(content$Content[i])," "))) ## gets a count of the number of words in the article
content <- cbind(content,wordcount)
content$Content

Rcrawler(Website = "http://www.imdb.com/chart/top", 
         no_cores = 4, no_conn = 4, urlregexfilter = "/title/", 
         ExtractCSSPat = c(".originalTitle","#titleCast .itemprop"),
         PatternsNames = c("title", "Cast"), ManyPerPattern = TRUE, MaxDepth=1 )
Rcrawler(Website = "http://www.imdb.com/chart/top", no_cores = 4, no_conn = 4, 
         urlregexfilter = "/title/", 
         ExtractXpathPat = c("//head/title","//*/div[@id='titleCast']//span[@class='itemprop']"),
         PatternsNames = c("title", "Cast"), 
         ManyPerPattern = TRUE, MaxDepth=1 )