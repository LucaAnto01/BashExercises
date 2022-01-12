#!/bin/bash
#@author: Luca Antognarelli

#Display error
function errorFunction()
{   
    echo "​ERROR: Usage: check.sh <file/directory>"
    exit 1  
}

#Check params
function check()
{
    if [ $1 -ne 1 ]; then
        errorFunction
    fi
}

#Check file or dir input exist
function checkFileDir()
{
    if [[ -f "$1" ]]; then
        echo "$1 Is a file!!!"
        exit 0
    fi

    if [[ -d "$1" ]]; then
        echo "$1 Is a directory!!!"
        exit 0
    fi

    errorFunction #if no condition is true
}

#check command sintax
check $#

file_dir=$1
#check file exist
checkFileDir $file_dir