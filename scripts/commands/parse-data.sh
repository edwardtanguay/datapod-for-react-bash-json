#!/bin/bash

source ../qtools/qfil.sh
source ../qtools/qcli.sh
source ../qtools/qstr.sh

lines=()
mapfile -t lines < <(qfil_get_lines_from_file "../../data/flashcards.txt")
qcli_message "Read ${#lines[@]} lines from flashcards.txt"

flashcards=()
count=0

i=0
while [ $i -lt ${#lines[@]} ]; do
    suuid=$(qstr_generate_suuid)
    category=$(echo "${lines[$i]}" | xargs)
    front=$(echo "${lines[$((i+1))]:-}" | xargs)
    back=$(echo "${lines[$((i+2))]:-}" | xargs)

    if [[ -n "$category" && -n "$front" && -n "$back" ]]; then
        # Build JSON object for this flashcard
        flashcard="{\"suuid\":\"$suuid\",\"category\":\"$category\",\"front\":\"$front\",\"back\":\"$back\"}"
        flashcards+=("$flashcard")
        ((count++))
    else
        qcli_message "Skipping incomplete flashcard at lines $((i+1))-$((i+3))" warning
    fi
    i=$((i+4))
done

qcli_message "Generated $count flashcards"

# Build JSON array
json="["
for idx in "${!flashcards[@]}"; do
    json+="${flashcards[$idx]}"
    if [ $idx -lt $((count-1)) ]; then
        json+=","
    fi
done
json+="]"

#echo "$json" 

# Save to file
output_file="../../parseddata/flashcards.json"
echo "$json" | jq . > "$output_file" 2>/dev/null

if [ $? -ne 0 ]; then
    qcli_message "Error writing flashcards to JSON file" error
else
    qcli_message "Wrote $count flashcards to flashcards.json"
fi