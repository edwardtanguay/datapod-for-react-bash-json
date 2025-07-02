#!/bin/bash

title="The Report 001"
lowercase_title=${title,,}
filename="rest_of_the_report.txt"

echo "The string \"${title}\" has ${#title} characters"
echo "This is the title in all caps: ${title^^}"
echo "This is the title in all lower case: ${title,,}"
echo "This is the title with the first character in upper case: ${lowercase_title^}"
echo "snake case: ${filename}"
echo "kebab case: ${filename//_/-}"
echo "The report number is: ${title:11:3}"