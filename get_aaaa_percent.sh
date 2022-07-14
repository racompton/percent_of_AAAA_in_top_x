#!/bin/bash

# This script gets the Alexa top 1 million domains and does an AAAA lookup and then determines the percentage of domains that have AAAA records


while getopts n:d: flag
do
    case "${flag}" in
        n) number=${OPTARG};;
        d) dns=${OPTARG};;
    esac
done

if [ -z "$number" ]
then
        number=100
fi


if [ -z "$dns" ]
then
        dns="8.8.8.8"
fi

rm /tmp/top-1m.csv.zip 2> /dev/null
rm /tmp/top-1m.csv 2> /dev/null

wget -q http://s3.amazonaws.com/alexa-static/top-1m.csv.zip  -O /tmp/top-1m.csv.zip

unzip -q /tmp/top-1m.csv.zip -d /tmp


cat /tmp/top-1m.csv | head -$number | cut -f2 -d',' | while read line ;  do echo $line `dig AAAA $line +short @$dns` ; done > /tmp/top_"$number"_AAAA_records.txt

num_of_aaaa=`grep ":" /tmp/top_"$number"_AAAA_records.txt | wc -l`

percent_aaaa=`echo "scale=2; ($num_of_aaaa / $number)*100" | bc `

echo "There are $percent_aaaa percent AAAA records for the top $number domains."

rm /tmp/top-1m.csv 2> /dev/null
rm /tmp/top_"$number"_AAAA_records.txt 2> /dev/null
