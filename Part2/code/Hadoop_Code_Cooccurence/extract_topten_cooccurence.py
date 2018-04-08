import pandas as pd



##########Extracting Top Ten Co-occuring words from Hadoop output of NYTimes Data##########
df_nydata=pd.read_csv("../../Output/Count_Cooccuringwords/nytimescount_cooccuringwords.txt",sep='\t')

df_nydata.columns=['Word','Count']

df_nydata=df_nydata.sort_values('Count', ascending=False)


df_nydata_top_ten=df_nydata[0:10]

df_nydata_top_ten.columns = ['Word', 'Count']

df_nydata_top_ten.reset_index(drop = True, inplace = True)

df_nydata_top_ten.to_csv("../../Output/Top_50_Coocurringwords/nydata_top50.csv")


##########Extracting Top Ten Co-occuring words from Hadoop output of Twitter Data##########
df_tweets=pd.read_csv("../../Output/Count_Cooccuringwords/tweetcount_cooccuringwords.txt",sep='\t')

df_tweets.columns=['Word','Count']

df_tweets=df_tweets.sort_values('Count', ascending=False)


df_tweets_top_ten=df_tweets[0:10]

df_tweets_top_ten.columns = ['Word', 'Count']

df_tweets_top_ten.reset_index(drop = True, inplace = True)

df_tweets_top_ten.to_csv("../../Output/Top_50_Coocurringwords/tweetdata_top50.csv")
