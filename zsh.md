# NAME

zsh - the Z shell

# EXAMPLES

## Glob Qualifiers

Show only directories

```
print -l zsh_demo/**/*(/)
```

Show only regular files

```
print -l zsh_demo/**/*(.)
```

Show empty files

```
ls -l zsh_demo/**/*(L0)
```

Show files greater than 3 KB

```
ls -l zsh_demo/**/*(Lk+3)
```

Show files modified in the last hour

```
print -l zsh_demo/**/*(mh-1)
```

Sort files from most to least recently modified and show the last 3

```
ls -l zsh_demo/**/*(om[1,3])
```

## Variable Transformations

A plain old glob

```
print -l zsh_demo/data/europe/poland/*.txt
```

Return just the file name (like **basename**(1))

```
print -l zsh_demo/data/europe/poland/*.txt(:t)
```

Return the file name without the extension

```
print -l zsh_demo/data/europe/poland/*.txt(:t:r)
```

Return the extension

```
print -l zsh_demo/data/europe/poland/*.txt(:e)
```

Return the parent folder of the file (like **dirname**(1))

```
print -l zsh_demo/data/europe/poland/*.txt(:h)
```

Return the parent folder of the parent

```
print -l zsh_demo/data/europe/poland/*.txt(:h:h)
```

Return the parent folder of the first file

```
print -l zsh_demo/data/europe/poland/*.txt([1]:h)
```

# SEE ALSO

- https://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell/
