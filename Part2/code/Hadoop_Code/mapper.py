#!/usr/bin/env python
"""mapper.py"""

import sys
import nltk
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize

ps = PorterStemmer()
stop_words=set(stopwords.words("english"))
symbol_list=['.',',','?','!', '@', '"', "'", '<', '>', '/', '[', ']','{','}','(',')',':',';', '…', '”', '#','$','%','^','&','*','-','+','_','=']

stop_words1=["said", "also", "like", "could", "also", "would" ,"us", "want", "via", "amp"  ]             
main_list=[]
# input comes from STDIN (standard input)
for line in sys.stdin:
    
    # remove leading and trailing whitespace
    line=line.lower()
    line = line.strip()
    
    #Initializing Word List 
    word_list=[]    
    
    # split the line into words
    words=word_tokenize(line)
    
    #Remove Stop words from the list of words
    #If Length of Word is 1, we are considering it as not useful and hence not adding it to our list
    for word in words:
        if word in stop_words or len(word)==1 or word in symbol_list or word in stop_words1:
            pass
        else:
            #word=ps.stem(word)
            word_list.append(word)
                    

    # Appending the words in the Main List
    for word in word_list:        
        main_list.append(word)
        

#Sorting the Main List        
main_list.sort()

#Printing the Word with count 1
for word in main_list:
    # write the results to STDOUT (standard output);
    # what we output here will be the input for the
    # Reduce step, i.e. the input for reducer.py
    # tab-delimited; the trivial word count is 1
    #print ("%s\t%s" % (word, 1))
    print ("%s\t%s" % (word, 1))
    

        