#!/usr/bin/env python

import sys
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize


ps = PorterStemmer()
stop_words=set(stopwords.words("english"))


line="hi my name is akshay. I am a programmer"
#for line in sys.stdin:
# remove leading and trailing whitespace
line=line.lower()

line = line.strip()

#Initializing Word List 
pair_word_list=[]    
# split the line into words
#words = line.split()
words=word_tokenize(line)

for word in words:
    if word in stop_words or len(word)==1:
        pass
    else:
        word=ps.stem(word)
        pair_word_list.append(word)


for i in range(len(pair_word_list)-1):    
    print ("%s %s\t%s" % (pair_word_list[i],pair_word_list[i+1], 1))