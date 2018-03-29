#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar 24 18:43:21 2018

@author: muthuvel
"""

## Extra Whitespace
"ABC\t".strip()
" ABC\t".lstrip()
" ABC\t".rstrip()
"ABC".strip("C")


## Invalid character
s = "abc\xFF"
print (s) 
s.encode("ascii", "ignore") # Changed decode to encode for python3


## Weird or Incompatible Datetimes

import dateutil.parser as p

p.parse("August 13, 1985")
p.parse("2013-8-13")
p.parse("2013-8-13 4:15am")


## Example formatting script

def get_first_last_name(s):
    INVALID_NAME_PARTS = ["mr", "ms", "mrs",
                          "dr", "jr", "sir"]
    parts = s.lower().replace(".","").strip().split()
    parts = [p for p in parts
        if p not in INVALID_NAME_PARTS]
    if len(parts)==0:
        raise ValueError(
                "Name %s is formatted wrong" % s)
    first, last = parts[0], parts[-1]
    first = first[0].upper() + first[1:]
    last = last[0].upper() + last[1:]
    return first, last

def format_age(s):
    chars = list(s) # list of characters
    digit_chars = [c for c in chars if c.isdigit()]
    return int("".join(digit_chars))

def format_date(s):
    MONTH_MAP = {"jan": "01", "feb": "02", "may": "03"}
    s = s.strip().lower().replace(",", "")
    m, d, y = s.split()
    if len(y) == 2: y = "19" + y
    if len(d) == 1: d = "0" + d
    return y + "-" + MONTH_MAP[m[:3]] + "-" + d


import pandas as pd

df = pd.read_csv("file.tsv", sep="|")
df["First Name"] = df["Name"].apply(
    lambda s: get_first_last_name(s)[0])
df["Last Name"] = df["Name"].apply(
    lambda s: get_first_last_name(s)[1])
df["Age"] = df["Age"].apply(format_age)
df["Birthdate"] = df["Birthdate"].apply(
    format_date).astype(pd.datetime)
print (df)


## Regular Expression syntax

import re
# This matches "1600 Pennsylvania Ave."
# It does NOT match "5 Stony Brook St"
# cuz there is a space in "Stony Brook"
street_pattern = r"^[0-9]\s[A-Z][a-z]*" + \
 r"(Street|St|Rd|Road|Ave|Avenue|Blvd|Way|word)\.?$"
# Like the one above, this assumes
# there is no space in the town name
city_pattern = r"^[A-Z][a-z]*,\s[A-Z]{2},[0-9]{5}$"
address_pattern = street_pattern + r"\n" \
 + city_pattern
# Compile the string into a regular expression object
address_re = re.compile(address_pattern)
text = open("chapter4.txt", "r").read()
matches = re.findall(address_re, text)
# list of all strings that match
open("addresses_w_space_between.txt","w").write("\n\n".join(matches))
