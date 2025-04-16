#!/bin/bash

# Quick tools for CLI commands

qcli_message() {
    local line="$1"
    local kind="${2:-success}"

    case "$kind" in
        info)
            echo -e "ℹ️  $line"
            ;;
        error)
            echo -e "❌ $line"
            ;;
        warning)
            echo -e "⚠️  $line"
            ;;
        doing)
            echo -e "⏳ $line"
            ;;
        ball)
            echo -e "🟠 $line"
            ;;
        *)
            echo -e "✅ $line"
            ;;
    esac
}

# Example usage:
# qcli_message "This is an info message" info
# qcli_message "This is an error message" error
# qcli_message "This is a success message"