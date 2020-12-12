#!/bin/bash

# -v suppresses header line
echo -e "The number of people in the file:"
grep -v -E  "^name|^\s" example_people_data.tsv | wc -l

# how many people are aged around 30/older
echo -e "The number of people aged around 30 or older"
awk '($6 <= 1990)' example_people_data.tsv | wc -l

# number of people called jan
echo -e  "The number of people called Jan"
awk '($1 == "Jan")' example_people_data.tsv | wc -l

# most common country of birth - from this country how many ppl are 50 or older
# country is last field
awk ' {if($7 == "Tokelau"){print $0}}' example_people_data.tsv > Tokelau.tsv
# wc -l Tokelau.tsv

awk ' {FS="\t"; if($7 == "United States"){print $0}}' example_people_data.tsv > UnitedStates.tsv
echo -e  "The number of people who are around 50 or older:"
awk '($6 <= 1970)' UnitedStates.tsv | wc -l

# people with edu email
awk ' {FS="\t"; if($2 == "edu$"){print $0}}' example_people_data.tsv > edu_email.tsv
