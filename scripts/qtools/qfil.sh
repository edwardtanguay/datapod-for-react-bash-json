#!/bin/bash

# File utility methods

qfil_get_lines_from_file() {
    local filePath="$1"
    local lines=()

    if [[ ! -f "$filePath" ]]; then
        qcli_message "Error reading file at $filePath" error
        return 1
    fi

    # Read file into array, one line per element
    while IFS= read -r line || [[ -n "$line" ]]; do
        lines+=("$line")
    done < "$filePath"

    # Print each line (or you can 'echo "${lines[@]}"' to return as space-separated)
    printf '%s\n' "${lines[@]}"
}

# Example usage:
# lines=()
# mapfile -t lines < <(qfil_get_lines_from_file "../data/flashcards.txt")
# echo "First line: ${lines[0]}"