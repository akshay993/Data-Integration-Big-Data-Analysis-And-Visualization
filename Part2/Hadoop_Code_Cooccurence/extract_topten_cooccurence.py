import pandas as pd



##########Extracting Top Ten Co-occuring words from Hadoop output of NYTimes Data##########
df_nydata=pd.read_csv("/Users/akshaychopra/Documents/Data-Integration-Big-Data-Analysis-And-Visualization/Part2/Hadoop_Code_Cooccurence/reducer_output.txt",sep='\t')

df_nydata=df_nydata.sort_values('1', ascending=False)

df_nydata.columns=['Word','Count']

df_nydata_top_ten=df_nydata[0:10]

df_nydata_top_ten.columns = ['Word', 'Count']

df_nydata_top_ten.reset_index(drop = True, inplace = True)

#df_top_ten.to_csv("/Users/akshaychopra/Documents/Data-Integration-Big-Data-Analysis-And-Visualization/Part2/Hadoop_Code_Cooccurence/topten.csv", header=None, index=None, sep=' ', mode='a')


##########Extracting Top Ten Co-occuring words from Hadoop output of Twitter Data##########
df_tweets=pd.read_csv("/Users/akshaychopra/Documents/Data-Integration-Big-Data-Analysis-And-Visualization/Part2/Hadoop_Code_Cooccurence/output.txt",sep='\t')

df_tweets=df_tweets.sort_values('1', ascending=False)

df_tweets.columns=['Word','Count']

df_tweets_top_ten=df_tweets[0:10]

df_tweets_top_ten.columns = ['Word', 'Count']

df_tweets_top_ten.reset_index(drop = True, inplace = True)
