#!/bin/sh
# This is the top-level script for the GhostInTheShell Application.

# To use this application three parameters are passed into this script and the
# script will pass them into two lower level Python scripts.

#This script is initiated from the command line like so:
# sh initiateGhost.sh tesserae Venus Magellan <enter>


#Call ghostScraper.py in order to search for pertinent articles


# Assembling the complete list of arguments dynamically
# This allows for any number of key words to be used with which to judge pertinence of results
for var in $@
do
    keyWords=$keyWords" "$var
done

echo "Searching for articles pertaining to: "$keyWords

# Use the ghostScraper script to collect articles. Wait for script to finish executing before continuing.
# The ghostScraper.py script will call
#python ghostScraper.py $keyWords
scrapy startproject pages
Wait
scrapy crawl pages
Wait









# Feed the pages to the natural language processor







# Email the results from results.db to the researcher
