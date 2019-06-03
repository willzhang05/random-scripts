#!/bin/bash
## This script prettifies HTML markup, python, or C++ code.
## Requires autopep8, tidy, and clang to be installed.

if [[ $1 ]]; then
    if [[ $1 == *".py" ]]; then
        autopep8 $1 --in-place;
    if [[ $1 == *".html" ]]; then
        tidy -m -i $1;
    else
        clang-format -i -style="{BasedOnStyle: google, IndentWidth: 4, ColumnLimit: 100}" $1;
    fi
    echo "Formatted $1.";
else
    echo "What do you want to format?";
fi
