#!/bin/bash

title="The Report"
echo The title is: $title # this works
echo "The title is: $title" # this works too
echo "The title is: ${title}" # this works too
echo "The title is: ${title:-default}" # this works too
echo "The subtitle is: ${subtitle:-(no subtitle)}" # this works too
echo "The title is: ${title:0:3}" # this works too
echo "The title is: ${title:0:3}..." # this works too
echo "---"
echo "The command running is called: $0" # this works too
echo "The first argument is: ${1:-(none)}" # this works too
echo "The variable is \$title"
