#!/bin/bash

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
        echo ""
        rm -f "${STUDENT}Submission attachment(s)"/*.olean

        lean --make "${LEANFILE}" > /dev/null

        VALID=$(echo $?)
        SORRY=$(cat "${LEANFILE}" | grep "sorry")
        
        if [[ ! -z "${SORRY}" ]]; then
            echo "Incomplete definition found:"
            echo ""
            cat "${LEANFILE}" | grep -ni -B 4 -A 2 "sorry"
            echo ""
        fi

        if [[ "${VALID}" -eq 0 && -z "${SORRY}" ]]; then
            echo "Type checked ${LEANFILE} successfully!"
        else
            echo "FAILED TYPECHECK: ${LEANFILE}"
        fi
        
        
        #echo ${LEANFILE}
    done
done
