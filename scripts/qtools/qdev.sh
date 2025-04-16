#!/bin/bash

# Utility function for development debug output
function qdev_debug() {
    local obj="$1"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    if [[ "$obj" =~ ^[[:print:][:space:]]+$ ]]; then
        echo "🛠️  $timestamp - $obj"
    else
        # For non-string input, print using declare -p (best effort in Bash)
        declare -p obj
    fi
}