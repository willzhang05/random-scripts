#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Please provide a path to student submissions!"
    exit;
fi

#readarray -td '' array < <(find "$1" -maxdepth 1 -mindepth 1 -type d -print0)

#array=()
#while IFS= read -r -d $'\0'; do
#    array+=("$SUBDIR")
#    echo $SUBDIR
#done < <(find "$1" -maxdepth 1 -mindepth 1 -type d -print0)

#SUBMISSIONS=$(find "$1" -maxdepth 1 -mindepth 1 -type d -printf '"%f"\n')
#IFS='\n' read -r -a array <<< $(find "$1" -maxdepth 1 -mindepth 1 -type d -printf '"%f"\n')
START_DIR=$1

for STUDENT in "$START_DIR"/*/; do
    #echo $STUDENT
    #ls "${STUDENT}Submission attachment(s)"/*.lean
    for LEANFILE in "${STUDENT}Submission attachment(s)"/*.lean;
    do
        rm -f "${STUDENT}Submission attachment(s)"/*.olean
        #VALID=$(lean --make "$LEANFILE"|echo $?)
        #echo $VALID
        lean --make "$LEANFILE" > /dev/null
        VALID=$(echo $?)
        if [ "$VALID" -eq 0 ]; then
            echo "Type checked $student/'Submission attachment(s)'/$LEANFILE successfully!"
        else
            echo "FAILED TYPECHECK: $student/'Submission attachment(s)'/$LEANFILE"
        fi
        
        echo $LEANFILE
    done
done
