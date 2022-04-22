#!/bin/bash
#
# crontab -e
# */10 * * * * bash scripts/push-to-github.sh > /tmp/push-to-github.log 2>&1
#
MERGED_FILTERS_FILE="merged-filters.txt"

# Check if git is installed
# https://stackoverflow.com/a/4785518/9618184
command -v "git" &> /dev/null ] || {
    echo "git is not installed!" >&2
    exit 1
}

if [ ! -f $MERGED_FILTERS_FILE ]; then
    echo "Make sure your are in the root directory before calling this script!" >&2
    exit 1
fi

# Stage the files
git add .

# Commit the files
git commit -m "wip"

# Push the file
bash -c "GIT_SSH_COMMAND='ssh -i ./key.ppk' git push -u origin main"

echo "Done!"
