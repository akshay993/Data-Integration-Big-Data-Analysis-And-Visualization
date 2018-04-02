#!/usr/bin/env python
"""mapper.py"""

import sys
import nltk
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize

ps = PorterStemmer()
stop_words=set(stopwords.words("english"))

main_list=[]
# input comes from STDIN (standard input)
for line in sys.stdin:
    #line="SAN FRANCISCO — Facebook’s chief executive, Mark Zuckerberg, on Wednesday publicly addressed for the first time the misuse of data belonging to 50 million users of the social network and described the steps the company would take to safeguard the information of its more than two billion monthly users.Although his statement addressing a chorus of criticism fell short of a full-throated apology, Mr. Zuckerberg said that Facebook would contact users whose data had been harvested through a personality quiz app and passed along to the political data firm Cambridge Analytica. “We have a responsibility to protect your data,” Mr. Zuckerberg said Wednesday in a Facebook post, “and if we can’t then we don’t deserve to serve you. ”Mr. Zuckerberg, 33, was trying to quell the crisis over the disclosure last weekend that Cambridge Analytica had used data that had been improperly obtained from Facebook as the firm worked on behalf of Donald J. Trump’s presidential campaign. “Are there other Cambridge Analyticas out there?” Mr. Zuckerberg said later in an interview with The New York Times. He added, “Were there apps which could have gotten access to more information and potentially sold it without us knowing or done something that violated people’s trust? We also need to make sure we get that under control.”"
    # remove leading and trailing whitespace
    line=line.lower()
    line = line.strip()
    
    #Initializing Word List 
    word_list=[]    
    
    # split the line into words
    #words = line.split()
    words=word_tokenize(line)
    
    #Remove Stop words from the list of words
    #If Length of Word is 1, we are considering it as not useful and hence not adding it to our list
    for word in words:
        if word in stop_words or len(word)==1:
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
    

        