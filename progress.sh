#!/bin/bash

function count() {
    for (( x=0; x <= $1; x++ )); do
        echo $x;
    done
}

if [ -z $1 ]; then
    echo "ERROR: Enter the first parameter.";
else
    for x in $(count $1); do
        echo "cool" $1 $2 "great";
    done
fi