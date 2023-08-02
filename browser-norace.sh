#!/bin/bash

# Save this file to $HOME/bin/browser-norace.sh 

# Used by '~/.mutt/mailcap'
#
# I found that when trying to view HTML content in the web browser it would  not display.
# This script resolved the problem.
#
# My browser of choice is `Brave`. Change `brave-browser` for whichever browser you prefer.
#
file="$1"
tmpfile="$(mktemp --suffix=.html)"
cp "$file" "$tmpfile"
brave-browser "$tmpfile"

