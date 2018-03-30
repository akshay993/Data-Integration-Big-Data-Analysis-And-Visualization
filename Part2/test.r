library(rtimes)

Sys.setenv(NYTIMES_AS_KEY = "fa567ce571174336957fc6786b4dc91e")
DF <- as_search(q = "facebook", begin_date = "20180321", end_date = "20180329", all_results = TRUE)

Data <- data.frame(DF$data)

df <- sapply(data, as.character)
rownames(df) <- rownames(data)
write.csv(df, "yourfile.csv")

Data$multimedia <- as.vector(Data$multimedia)
Data$keywords <- as.vector(Data$keywords)
Data$byline.person <- as.vector(Data$byline.person)
setwd("Data")

Data <- subset(Data, select = -c(multimedia, keywords, byline.person))


write.csv(Data, "NYTIMES_data.csv") 

