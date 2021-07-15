#!/bin/bash

# Get labels from hySpc.skeleton package's repository

# Create directory
mkdir github-helpers

# Define variables:
url=https://api.github.com/repos/r-hyperspec/hySpc.skeleton/labels
file=github-helpers/r-hyperspec-github-labels.json

# Get the new url as labels were moved to a new place:
url_with_labels=$(
    curl -s $url |\
    sed '3!d' |\
    sed "s/^.*\"url\": \"\(.*\)\"\,.*$/\1/"
  )

# Read labels and write to file:
curl -s $url_with_labels |\
  grep -ve '\"id\":' -      |\
  grep -ve '\"node_id\":' - |\
  grep -ve '\"url\":' -     |\
  grep -ve '\"default\":' - > ${file}

## To preview 21 rows:
# head -21 ${file}

## To remove folder with all contents
# rm -rf github-helpers
