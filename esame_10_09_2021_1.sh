#!/bin/bash
#@author: Luca Antognarelli

#Display error
function errorFunction()
{   
    echo "ERROR: Usage: fact.sh <number>"
    exit 1  
}

#Check params
function check()
{
    if [ $1 -ne 1 ]; then
        errorFunction
    fi
}

#Calculate factorial
function calFatt()
{
    fatt=1

    for((i=2;i<=$1;i++))
    {
        fatt=$((fatt * i))
    }

    echo $fatt

}

#check command sintax
check $#

calFatt $1