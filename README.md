# Percent of Alexa top X domains that have AAAA records
This script gets the Alexa top 1 million domains and does an AAAA lookup and then determines the percentage of domains that have AAAA records

Run it like this:
`./get_aaaa.sh -n <number of top domains> -d <resolver IP>`

The default is for the top 100 domains and the default resolver is 8.8.8.8

Example output:
`There are 28.00 percent AAAA records for the top 100 domains.`
