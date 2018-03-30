library(rtimes)

Sys.setenv(NYTIMES_AS_KEY = "fa567ce571174336957fc6786b4dc91e")
DF <- as_search(q = "facebook", all_results = TRUE)

Data <- DF$data
