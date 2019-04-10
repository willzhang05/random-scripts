#!/bin/bash
## This script is used to automatically typecheck student-submitted lean files.
## It takes a path to the student subdirectories.

if [[ $# -ne 1 ]]; then
    echo "Please provide a path to student submissions!"
    exit;
fi

START_DIR=$1

for STUDENT in "${START_DIR}"/*/; do
    #echo $STUDENT
    #ls "${STUDENT}Submission attachment(s)"/*.lean
    if [ -z "$(ls -A "${STUDENT}Submission attachment(s)")" ]; then
        echo ""
        echo "NO SUBMISSION: ${STUDENT}";
        continue;
    fi

    for LEANFILE in "${STUDENT}Submission attachment(s)"/*.lean;
    do
        echo ""
        rm -f "${STUDENT}Submission attachment(s)"/*.olean

        lean "${LEANFILE}" > /dev/null

        VALID=$(echo $?)
        SORRY=$(cat "${LEANFILE}" | grep "sorry")
        

        if [[ "${VALID}" -eq 0 && -z "${SORRY}" ]]; then
            echo "Type checked ${LEANFILE} successfully!"
        else
            echo "FAILED TYPECHECK: ${LEANFILE}"
        fi

        if [[ ! -z "${SORRY}" ]]; then
            echo "Incomplete definition found:"
            echo ""
            cat "${LEANFILE}" | grep -ni -B 4 -A 2 "sorry"
            echo ""
        fi
        
        #echo ${LEANFILE}
    done
done
