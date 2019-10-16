# NAME

awk

# CHEAT SHEET

## Mean Square Error

If you have a file with two columns of data, you can find the mean-square-error
(MSE) between the two columns using

    awk 'BEGIN {sum = 0}; {sum += ($1 - $2)^2}; END {print sum / NR}' file.txt

