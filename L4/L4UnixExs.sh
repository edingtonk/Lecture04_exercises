#!/bin/bash

# -v suppresses header line
echo -e "The number of people in the file:"
# NF is number of fields - assessing if there are 7 of them
grep -v "name" example_people_data.tsv | awk ' {FS="\t"; if(NF == 7 && $1 != ""){print $0}}' | wc -l

# how many people are aged around 30/older
echo -e "The number of people aged around 30 or older"
# NEED TO THINK ABOUT BLANK LINES
awk ' {FS="\t"; if($6 <= 1989 && NF == 7){print $0}}' example_people_data.tsv | wc -l

# number of people called jan
echo -e  "The number of people called Jan"
# remember to be specific!! need to think e.g. if i used ^ may include other names that start w/ jan
awk '{FS="\t"; if($1 == "Jan"){print $0}}' example_people_data.tsv | wc -l

# most common country of birth - from this country how many ppl are 50 or older
# country is 7th field - cut -f7 outputs solely that field
# sort sorts output alphabetically
# uniq -c counts the no. nr countries and puts count next to country name
# -k1,1 specifies sort file on first column (number) nr is number and reverse (descending) order
cut -f7 example_people_data.tsv | sort | uniq -c | sort -k1,1nr | head -5
echo -e "The number of people around 50 years old or less in the most common country in the file:"
awk ' {FS="\t"; if($6 <= 1969 && $7 == "Mozambique"){print $0}}' example_people_data.tsv | wc -l

# people with edu email sorted by country then name in reverse alphabetical order 
grep "\.edu" example_people_data.tsv | sort -k7,7 -k1,1r > edu.out
