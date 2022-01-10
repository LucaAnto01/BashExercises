#!/bin/bash
#@author: Luca Antognarelli

#Check params
function check()
{
    if [ $1 -ne 1 ]; then
        echo "​ERROR: Usage:/exam/exercise6/exercise6.sh <file>"
        exit 1
    fi
}

#Check file input exist
function checkFile()
{
    if [[ ! -f "$1" ]]; then
        echo "ERROR: file $1 not found"
        exit 2
    fi
}

#check command sintax
check $#

file_dir=$1
#check file exist
checkFile $file_dir

echo $(file $file_dir)