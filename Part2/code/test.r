library('RCurl')
library('stringr')
library('XML')

## Read all articles collected so far
setwd("../Data")
Articles <- read.csv("NYTimes_Articles_Collected")
Articles <- subset(Articles, select = -c(X))

## Extracting url from data collected
url <- toString(data.frame(Articles$web_url)[1,])
pageToRead <- readLines(url)
grep('Opponent / Event',pageToRead)
mypattern = '<td class="row-text">([^<]*)</td>'
datalines = grep(mypattern,pageToRead,value=TRUE)


## Extract information without HTML tags
getexpr = function(s,g)substring(s,g,g+attr(g,'match.length')-1)
gg = gregexpr(mypattern,pageToRead)
matches = mapply(getexpr,pageToRead,gg)
result = gsub(mypattern,'\\1',matches)
names(result) = NULL
