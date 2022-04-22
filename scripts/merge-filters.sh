#!/bin/bash
#
# crontab -e
# */9 * * * * bash scripts/merge-filters.sh > /tmp/merge-filters.log 2>&1
#
DESTINATION_FILE="merged-filters.txt"

# Check if git is installed
# https://stackoverflow.com/a/4785518/9618184
command -v "git" &> /dev/null ] || {
    echo "git is not installed!" >&2
    exit 1
}

# Check if paste is installed
command -v "paste" &> /dev/null ] || {
    echo "paste is not installed!" >&2
    exit 1
}

if [ ! -f $DESTINATION_FILE ]; then
    echo "Destination file does not exist!" >&2
    echo "Make sure your are in the root directory before calling this script." >&2
    exit 1
fi

# Pull changes from the repository
git pull

# Merge the filters
declare -a filters=(
    "filters/cookie-consent-popups.txt"
    "filters/stackexchange-network.txt"
    "filters/third-party-logos.txt"
)

# Empty the destination file
echo -n > $DESTINATION_FILE

# Append the filters
for i in "${filters[@]}"
do
    # Append the filter banner
    printf "\n" >> $DESTINATION_FILE
    printf "! ###########################" >> $DESTINATION_FILE
    printf "\n" >> $DESTINATION_FILE
    printf "! Filter: %s" $(basename $i) >> $DESTINATION_FILE
    printf "\n" >> $DESTINATION_FILE
    printf "! ###########################" >> $DESTINATION_FILE
    printf "\n\n" >> $DESTINATION_FILE

    # Append the file content
    paste $i >> $DESTINATION_FILE
done

echo "Done!"
