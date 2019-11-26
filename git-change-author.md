git-change-author(1) "" "ual"

# SYNOPSIS

Change author of git commits in a branch

## Using git rebase --interactive

First, set the correct author for the repository using _git config_.

```
git config user.email correct@example.com
```

Run _git rebase -i <commit>_ where _<commit>_ is the commit prior to the first
commit you want to change. This will open the interactive git rebase window.

On a new line after each commit that needs to have its author changed, write the
following:

```
exec git commit --amend --reset-author --no-edit
```

Save and close the interactive git rebase window.

## Using git filter-branch

*NOTE*: This approach is potentially dangerous, only use this if the first
method (git rebase) does not work for some reason.

The following will change all commits with author email _wrong@example.com_ to
_correct@example.com_ on the current branch.

```
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
_--tag-name-filter cat -- --branches --tags_ to the end of the command.

# REFERENCE

- https://help.github.com/en/articles/changing-author-info
