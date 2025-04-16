#!/bin/bash

# String utility methods

qstr_generate_suuid() {
    local chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local suuid=""
    for i in {1..6}; do
        local rand_index=$(( RANDOM % ${#chars} ))
        suuid="${suuid}${chars:$rand_index:1}"
    done
    echo "$suuid"
}

# Example usage:
# suuid=$(qstr_generate_suuid)
# echo "$suuid"