#!/bin/bash
#@author: Luca Antognarelli

function check()
{
    if [ $1 -ne 2 ]; then
        echo "ERROR: invalid input"
        exit 1
    fi
}

#call function and pass param $# --> number of input params
check $#

for((i = 0 ; i < $1 ; i++));do
    echo "Ciao $2"
done

