import pandas as pd

df=pd.read_csv("/Users/akshaychopra/Documents/Data-Integration-Big-Data-Analysis-And-Visualization/Part2/Hadoop_Code_Cooccurence/reducer_output.txt",sep='\t')

df=df.sort_values('1', ascending=False)

df_top_ten=df[0:10]

df_top_ten.columns = ['Word', 'Count']

df_top_ten.reset_index(drop = True, inplace = True)

#df_top_ten.to_csv("/Users/akshaychopra/Documents/Data-Integration-Big-Data-Analysis-And-Visualization/Part2/Hadoop_Code_Cooccurence/topten.csv", sep='\t')

df_top_ten.to_csv("/Users/akshaychopra/Documents/Data-Integration-Big-Data-Analysis-And-Visualization/Part2/Hadoop_Code_Cooccurence/topten.csv", header=None, index=None, sep=' ', mode='a')