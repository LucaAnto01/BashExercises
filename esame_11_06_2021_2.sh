#!/bin/bash
#@author: Luca Antognarelli

#Display error
function errorFunction()
{   
    echo "​ERROR: Usage: manage-package.sh <packageName> <search/install/remove/info>"
    exit 1  
}

#Check params
function check()
{
    if [ $1 -ne 2 ]; then
        errorFunction
    fi
}

#Search a package
function pkSearch
{
    echo $(yum search $1)
}

#Install package
function pkInstall()
{
    yum install $1

    if [ $? -eq 0 ]; then
        echo "$1 installed successfully"
    else
        echo "ERROR: $1 installed error"
        exit 2
    fi
}

#Remove package
function pkRemove()
{
    yum remove $1

    if [ $? -eq 0 ]; then
        echo "$1 removed successfully"
    else
        echo "ERROR: $1 removed error"
        exit 3
    fi
}

#Getting info of a package
function getInfo()
{
    echo $(yum info $1)
}

#check command sintax
check $#

pk_name=$1
action=$2

case $action in
    search)
        pkSearch $pk_name
        exit 0;;
    install)
        pkInstall $pk_name
        exit 0;;
    remove)
        pkRemove $pk_name
        exit 0;;
    info)
        getInfo $pk_name
        exit 0;;
    *)
        errorFunction;;
esac