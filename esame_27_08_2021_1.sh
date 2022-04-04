#!/bin/bash
#@author: Luca Antognarelli

#Display error
function errorFunction()
{   
    echo "ERROR: Usage: ./print.sh <params...>"
    exit 1  
}

#Check params
function check()
{
    if [ $1 -eq 0 ]; then
        errorFunction
    fi
}

#Print params
function print()
{
    for param in $*; do
        echo $param
    done
}

#check command sintax
check $#

#print params
print $*