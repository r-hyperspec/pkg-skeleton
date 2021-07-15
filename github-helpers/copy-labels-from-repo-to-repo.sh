
# =========================================================================
#     Use this bash script to copy labels from one repo to the other 
# =========================================================================

# URL to websites on methods that can be used co copy/delete labels
# 
# https://github.com/jvandemo/copy-github-labels-cli
#
# https://github.com/ahmadawais/github-label-remove
# https://git.io/github-label-remove
#
# https://github.com/Financial-Times/github-label-sync

## Install necessary tools ------------------------------------------------

npm install -g copy-github-labels-cli


## Variables --------------------------------------------------------------

# pat - GitHub PAT (personal access token)
# You can generate PAT by running R code:
#    usethis::create_github_token()
# You can access PAT (if it is saved locally) by using R code:
#    gitcreds::gitcreds_set()

pat=???

# Source repo:
from_repo=r-hyperspec/hyperSpec

# Destination repo:
to_repo=r-hyperspec/hySpc.repo

## Delete default labels ---------------------------------------------------
## Non-default labels will not be deleted
# npx github-label-remove --repo $to_repo -t $pat --defaults

## Copy labels from one repo to the other ----------------------------------
## Old labels will not be removed
copy-github-labels -t $pat $from_repo $to_repo
