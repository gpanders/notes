% GIT-CHANGE-AUTHOR(um)

# SYNOPSIS

Change author of git commits in a branch

# DESCRIPTION

The following will change all commits with author email `wrong@example.com` to
`correct@example.com` on the current branch.

```console
$ git filter-branch --env-filter '
WRONG_EMAIL="wrong@example.com"
NEW_NAME="New Name"
NEW_EMAIL="correct@example.com"

if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi

if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
'
```

To do this for all commits on all branches throughout the repository, add
`--tag-name-filter cat -- --branches --tags` to the end of the command.

# REFERENCE

- https://help.github.com/en/articles/changing-author-info
