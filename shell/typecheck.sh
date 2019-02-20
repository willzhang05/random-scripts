#!/bin/bash
## This script is used to automatically typecheck student-submitted lean files.
## It takes a path to the student subdirectories.

if [ $# -ne 1 ]; then
    echo "Please provide a path to student submissions!"
    exit;
fi

START_DIR=$1

for STUDENT in "${START_DIR}"/*/; do
    #echo $STUDENT
    #ls "${STUDENT}Submission attachment(s)"/*.lean
    for LEANFILE in "${STUDENT}Submission attachment(s)"/*.lean;
    do
        rm -f "${STUDENT}Submission attachment(s)"/*.olean

        lean --make "${LEANFILE}" > /dev/null

        VALID=$(echo $?)

        if [ "${VALID}" -eq 0 ]; then
            echo "Type checked ${LEANFILE} successfully!"
        else
            echo "FAILED TYPECHECK: ${LEANFILE}"
        fi
        
        #echo ${LEANFILE}
    done
done
