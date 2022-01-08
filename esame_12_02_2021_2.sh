#!/bin/bash
#@author: Luca Antognarelli

starting_path=/exam/exercise8/dircontainer/

function check()
{
    if [ $1 -ne 1 ]; then
        echo "​ERROR: usage: createdir.sh <filename>"
        exit 1
    fi
}

function checkFile()
{
    if [[ ! -f "$1" ]]; then
        echo "ERROR: file $1 not found"
        exit 2
    fi
}

function checkDir()
{
    if [[ ! -d "$1" ]]; then
        mkdir -p $1
    else
        echo "ERROR: directory $1 already exist"
    fi
}

#check command sintax
check $#

file_dir=$1
#check file exist
checkFile $file_dir

#get all directory to create
directories=$(cat $file_dir)

#start from this specifc path
cd $starting_path

#create new directories
for new_dir in $directories; do
    #check directory doesn't already exist
    checkDir $new_dir
done
