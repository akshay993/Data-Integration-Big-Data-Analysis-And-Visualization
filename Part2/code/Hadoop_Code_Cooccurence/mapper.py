#!/usr/bin/env python

import sys
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize


ps = PorterStemmer()
stop_words=set(stopwords.words("english"))

symbol_list=['.',',','?','!', '@', '"', "'", '<', '>', '/', '[', ']','{','}','(',')',':',';', '…', '”', '#','$','%','^','&','*','-','+','_','=']

stop_words1=["said", "also", "like", "could", "also", "would" ,"us", "want", "via", "amp"  ]             


main_list=[]


for line in sys.stdin:
    # remove leading and trailing whitespace
    line=line.lower()
    
    line = line.strip()
    
    #Initializing Word List 
    pair_word_list=[]    
    
    # split the line into words   
    words=word_tokenize(line)
    
    #Not including the stop words, symbols and words with length 1 in our word list
    for word in words:
        if word in stop_words or len(word)==1 or word in symbol_list or word in stop_words1:
            pass
        else:
            #word=ps.stem(word)
            pair_word_list.append(word)
    
    #Storing co-occuring words in list 
    for i in range(len(pair_word_list)-1):
        temp= pair_word_list[i]+" "+pair_word_list[i+1]
        main_list.append(temp)
        
    #Sorting the list
    main_list.sort()
    
#Printing the co-occurring words
for i in range(len(main_list)):
    print("%s\t%s" % (main_list[i], 1))
    
  
        