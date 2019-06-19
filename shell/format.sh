#!/bin/bash
## This script prettifies HTML markup, python, or C++ code.
## Requires autopep8, tidy, and clang to be installed.

if [[ "$#" -eq 0 ]]; then
    echo "What do you want to format?";
    echo "Supported languages: HTML, Python, C++";
    echo -e "\nUsage: ./format <filenames>\n";
    exit 1;
else
    for file in "$@"
    do
        if [[ $file == *".py" ]]; then
            autopep8 $file --in-place;
            echo "Formatted $file with autopep8.";
        elif [[ $file == *".html" ]]; then
            tidy -m -i $file;
            echo "Formatted $file with tidy.";
        else
            clang-format -i -style="{BasedOnStyle: google, IndentWidth: 4, ColumnLimit: 100}" $file;
            echo "Formatted $file with clang-format.";
        fi
    done
fi
