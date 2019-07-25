# NAME

zsh - the Z shell

# EXAMPLES

## Glob Qualifiers

```zsh
# show only directories
print -l zsh_demo/**/*(/)

# show only regular files
print -l zsh_demo/**/*(.)

# show empty files
ls -l zsh_demo/**/*(L0)

# show files greater than 3 KB
ls -l zsh_demo/**/*(Lk+3)

# show files modified in the last hour
print -l zsh_demo/**/*(mh-1)

# sort files from most to least recently modified and show the last 3
ls -l zsh_demo/**/*(om[1,3])
```

## Variable Transformations

```zsh
# A plain old glob
print -l zsh_demo/data/europe/poland/*.txt

# Return the file name (t stands for tail)
print -l zsh_demo/data/europe/poland/*.txt(:t)

# Return the file name without the extension (r stands for remove_extension, I
think)
print -l zsh_demo/data/europe/poland/*.txt(:t:r)

# Return the extension
print -l zsh_demo/data/europe/poland/*.txt(:e)

# Return the parent folder of the file (h stands for head)
print -l zsh_demo/data/europe/poland/*.txt(:h)

# Return the parent folder of the parent
print -l zsh_demo/data/europe/poland/*.txt(:h:h)

# Return the parent folder of the first file
print -l zsh_demo/data/europe/poland/*.txt([1]:h)
# Remember you can combine qualifiers and modifiers.
```

# SEE ALSO

- https://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell/
