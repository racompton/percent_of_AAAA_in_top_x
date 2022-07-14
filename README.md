# Percent of Alexa top X domains that have AAAA records
This script gets the Alexa top 1 million domains and does an AAAA lookup and then determines the percentage of domains that have AAAA records

Run it like this:
`./get_aaaa.sh -n <number> -d <resolver IP>`

The default number is 100 and the default resolver is 8.8.8.8

Example output:
`There are 28.00 percent AAAA records for the top 100 domains.`
