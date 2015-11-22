#!/bin/bash
URL=$1
if [[ -v BROWSER ]]
then 
    exec $BROWSER $URL
else
    path=$(which xdg-open || which gnome-open) && exec "$path" "$URL"
fi
echo "Can't find browser"

# Example:
# export BROWSER=`which firefox` --new-window
