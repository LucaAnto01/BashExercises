#!/bin/bash
#@author: Luca Antognarelli

#Display error
function errorFunction()
{   
    echo "No argument found"
    exit 1  
}

#Check params
function check()
{
    if [ $1 -ne 1 ]; then
        errorFunction
    fi
}

#check command sintax
check $#

prize=$1

case $prize in
    100)
        echo "You got 1st prize"
        exit 0;;
    101)
        echo "You got 2st prize"
        exit 0;;
    102)
        echo "You got 3st prize"
        exit 0;;
    103)
        echo "You got 4st prize"
        exit 0;;
    *)
        echo "Sorry, try fot the next time"
        exit 0;;
esac