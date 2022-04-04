#!/bin/bash
#@author: Luca Antognarelli

#Display error
function errorFunction()
{   
    echo "ERROR: No argument found"
    exit 1  
}

#Check params
function check()
{
    if [ $1 -ne 1 ]; then
        errorFunction
    fi
}

#Check value input is a number
function checkIsNumber()
{
    rangeValue='^[0-9]+$'
    if ! [[ $1 =~ $rangeValue ]] ; then
        echo "$1: not a number"
        exit 2
    fi
}

#Wait for x seconds
function waitFor()
{
    echo "$1: is a number"
    echo "Wait for $1 seconds"
    $(sleep $1s)
    echo "Completed!!!"
    exit 0
}


#check command sintax
check $#

#check value input is a number
checkIsNumber $1

waitFor $1