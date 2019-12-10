# NAME

bash

# REFERENCE

## IFS

**IFS** is the variable used as a word separator. By default it is a space.
When expanding the **$\*** variable, **bash** expands it to
"**$1**c**$2**c**$3**c..." where _c_ is the first character of **IFS**.

## Read lines from a command in a loop

To iterate over lines of output from a command, use

    command | while IFS= read -r line; do
        echo "Line: $line"
    done

or

    while IFS= read -r line; do
        echo "Line: $line"
    done < <$(command)

For example,

    grep -v '^ *#' < file | while IFS= read -r line; do
        echo "Line: $line"
    done


