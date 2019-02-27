#!/bin/bash
## This script prettifies python or C++ code.

if [[ $1 ]]; then
    if [[ $1 == *".py" ]]; then
        autopep8 $1 --in-place;
    else
        clang-format -i -style="{BasedOnStyle: google, IndentWidth: 4, ColumnLimit: 100}" $1;
    fi
    echo "Formatted $1.";
else
    echo "What do you want to format?";
fi
