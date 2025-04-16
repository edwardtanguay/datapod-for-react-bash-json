#!/bin/bash
source ../developer/learn.sh

param=$1
exerciseCode="ex_$param"

if declare -f "$exerciseCode" > /dev/null; then
    echo "Calling function: $exerciseCode"
    $exerciseCode
else
    echo "Error: Function '$exerciseCode' not found."
    exit 1
fi