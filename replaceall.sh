#!/bin/bash

# Usage function to print out usage instructions
function usage {
    echo "Usage: $0 [-h] [--whole-regexp] old_string new_string [glob]"
    echo "Replace text in files."
    echo ""
    echo "Positional arguments:"
    echo "  old_string    Text to replace."
    echo "  new_string    Replacement text."
    echo "  glob          (Optional) Glob pattern to search for files. Default: *."
    echo ""
    echo "Optional arguments:"
    echo "  -h, --help         Show this help message and exit."
    echo "  -w, --whole-regexp     Match whole words only."
}

# Define short and long options
SHORT_OPTS="hw"
LONG_OPTS="help,word-regexp"

# Default value for --whole-regexp flag
WORD_REGEXP=""

# Parse command line options
OPTS=$(getopt -o $SHORT_OPTS --long $LONG_OPTS --name "$0" -- "$@")
if [ $? -ne 0 ]; then
    usage
fi

eval set -- "$OPTS"
while true; do
    case "$1" in
    -w | --word-regexp)
        WORD_REGEXP="--word-regexp"
        shift
        ;;
    -h | --help)
        usage
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Invalid option: $1" >&2
        usage
        ;;
    esac
done

# Check if old_string and new_string arguments are present
if [ -z "$1" ] || [ -z "$2" ]; then
    usage
    exit 1
fi

# Set old and new strings
OLD_STRING="$1"
NEW_STRING="$2"

# Set the glob pattern to * if not provided
GLOB="${3:-*}"

# Find files with matches
FILES=$(rg $WORD_REGEXP --no-ignore --files-with-matches "$OLD_STRING" $GLOB)

if [ -z "$FILES" ]; then
    echo "No files found with matches for '$OLD_STRING'"
    exit 0
fi

# Replace old string with new string in files
for file in $FILES; do
    sed -i "s/$OLD_STRING/$NEW_STRING/g" "$file"
done

echo "Replaced '$OLD_STRING' with '$NEW_STRING' in the following files:"
echo "$FILES"
