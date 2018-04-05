for (i in c(1:nrow(Articles))){
  if (i>1){
    try(Data <- ContentScraper(Url = toString(Articles$web_url[i]), XpathPatterns =c("//h1","//article"), PatternsName = c("Title","Content")))
    #temp <- data.frame(Data)
    #temp$Content <- str_replace_all(temp$Content, "[^[:alnum:]]", " ") ##removes special characters
    #wordcount <- length(unlist(strsplit(toString(temp$Content)," "))) ## gets a count of the number of words in the article
    #temp <- cbind(temp,wordcount)
    #content <- rbind(content,temp)
  }
  print(i)
}